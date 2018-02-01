class TestUntitled < Test::Unit::TestCase

  def test_start
    hand = Hand.new("2H 4S 4C 2D 4H")
    assert_equal Card.new('2',:hearts),   hand[0]
    assert_equal Card.new('4',:spades),   hand[1]
    assert_equal Card.new('4',:clubs),    hand[2]
    assert_equal Card.new('2',:diamonds), hand[3]
    assert_equal Card.new('4',:hearts),   hand[4]
  end

  def test_card_has_pips_and_suit_set_on_creation
    card = Card.new('2',:hearts)
    assert_equal '2', card.pips
    assert_equal :hearts, card.suit
    card = Card.new('T',:hearts)
    assert_equal 'T', card.pips
    assert_equal :hearts, card.suit
    card = Card.new('J',:hearts)
    assert_equal 'J', card.pips
    assert_equal :hearts, card.suit
    card = Card.new('Q',:hearts)
    assert_equal 'Q', card.pips
    assert_equal :hearts, card.suit
    card = Card.new('K',:hearts)
    assert_equal 'K', card.pips
    assert_equal :hearts, card.suit
    card = Card.new('A',:hearts)
    assert_equal 'A', card.pips
    assert_equal :hearts, card.suit
  end

  def test_hand_ranked_three_of_a_kind
    assert_equal :three_of_a_kind, Hand.new("2H 4S 4C AD 4H").rank
  end

  def test_hand_ranked_one_pair
    assert_equal :one_pair, Hand.new("2H 4S 5C JD 4H").rank
  end

  def test_hand_ranked_two_pairs
    assert_equal :two_pairs, Hand.new("2H 4S 5C 2D 4H").rank
  end

  def test_hand_ranked_flush
    assert_equal :flush, Hand.new("2H 4H 6H 8H TH").rank
  end

  def test_hand_ranked_straight
    assert_equal :straight, Hand.new("2H 3C 4H 5H 6H").rank
  end

  def test_hand_ranked_full_house
    assert_equal :full_house, Hand.new("2H 4S 4C 2D 4H").rank
  end

  def test_hand_ranked_four_of_a_kind
    assert_equal :four_of_a_kind, Hand.new("2H 4S 4C 4D 4H").rank
  end

  def test_hand_ranked_straight_flush
    assert_equal :straight_flush, Hand.new("2H 4H 3H 5H 6H").rank
  end

  def test_hand_ranked_high_card
    assert_equal :high_card, Hand.new("2C 3H 4S 8C AH").rank
  end

  def test_full_house_beats_flush
    black = Hand.new("2H 4S 4C 2D 4H")    
    white = Hand.new("2S 8S AS QS 3S")
    assert_equal 1, black <=> white
  end

  def test_higher_card_wins_if_equal_rank
    black = Hand.new("2H 3D 5S 9C KD")
    assert_equal :high_card, black.rank
    white = Hand.new("2C 3H 4S 8C AH")
    assert_equal :high_card, white.rank
    assert_equal -1, black <=> white
  end

  def test_equal_hands
    black = Hand.new("2H 3D 5S 9C KD")
    assert_equal :high_card, black.rank
    white = Hand.new("2D 3H 5C 9S KH")
    assert_equal :high_card, white.rank
    assert_equal 0, black <=> white
  end

end
class Hand

  def initialize(cards)
    @cards = 
      cards.gsub(/\s+/, "")
           .scan(/.{2}/)
           .map{|ch| Card.new(ch[0],suit(ch[1]))}
  end

  def [](n)
    return @cards[n]
  end

  def rank
    return :straight_flush if straight? && flush?
    return :flush          if flush?
    return :straight       if straight?

    pip_tallies = pip_counts.sort.reverse
    return {
      [4,1] => :four_of_a_kind,
      [3,2] => :full_house,
      [3,1] => :three_of_a_kind,
      [2,2] => :two_pairs,
      [2,1] => :one_pair,
      [1,1] => :high_card
    }[pip_tallies[0..1]]
  end

  def <=>(other)
    keys <=> other.keys
  end

  def keys
    [ranking,pip_counts]
  end

private

  def ranking
    ranks.index(rank)
  end

  def ranks
    [
      :high_card,
      :pair,
      :two_pairs,
      :three_of_a_kind,
      :straight,
      :flush, 
      :full_house,
      :four_of_a_kind,
      :straight_flush
    ]
  end

  def pip_counts
    "23456789TJQKA"
      .chars
      .collect {|pips| pip_count(pips)}
  end

  def pip_count(pips)
    @cards.count{|card| card.pips == pips}
  end

  def pip_flags
    pip_counts.map{|n| n > 0 ? 'T' : 'F'}.join
  end

  def straight?
    pip_flags.include? 'TTTTT'
  end

  def flush?
    suit_counts.any?{|n| n == 5}
  end

  def suit_counts
    suits.collect{|suit| suit_count(suit)}
  end

  def suits  
    [:clubs,:diamonds,:hearts,:spades]
  end

  def suit_count(suit)
    @cards.count{|card| card.suit == suit}
  end

  def suit(ch)
    return suits["CDHS".index(ch)]
  end

end

class Card

  def initialize(pips,suit)
    @pips,@suit = pips,suit
  end

  def ==(other)
    pips == other.pips && suit == other.suit
  end

  def pips
    @pips
  end

  def suit
    @suit
  end
end