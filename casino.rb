require 'io/console'
require 'colorize'
@wallet = 100

# ============== 21 ============================== #
class Deck
  attr_accessor :cards
  attr_accessor :wallet

  def initialize wallet, bet
    @bet = bet
    @round_end = false
    @wallet = wallet
    @cards = []
    values = ["2","3","4","5","6","7","8","9","10","J", "Q", "K", "A"]
    make("Spades" , values)
    make("Hearts" , values)
    make("Clubs" , values)
    make("Diamonds" , values)
    @dealer = draw(1)
    @player = draw(2)
    if get_count(:player) == 21
      @round_end = true
      print_all
    else
      play
    end
  end

  private

  def play
    loop do
      print_all
      break if get_count(:player) > 21
      puts "Hit or Stay?"
      break if get_action == 'break'
    end
      dealer_play
      puts "play again? [Y / N]"
      initialize(@wallet, @bet) if gets.chomp.downcase.slice(0) == "y"
  end

  def print_all
    system 'clear'
    puts "Wallet: $#{@wallet}\n\n"
    if get_count(:dealer) <= 21
      puts "Dealer has #{get_count :dealer}"
    else
      puts "Dealer is BUST".colorize(:color => :white, :background => :red)
    end
    print_dealer
    puts "\n\n\n"
    if get_count(:player) <= 21
      puts "Player has #{get_count :player}"
    else
      puts "Player is BUST".colorize(:color => :white, :background => :red)
    end
    print_player
    puts "\n\n"
    puts final if @round_end
  end

  def final
    if get_count(:player) <= 21 && (get_count(:player) >= get_count(:dealer) || get_count(:dealer) > 21)
      if get_count(:player) > get_count(:dealer) || get_count(:dealer) > 21
        @wallet += @bet
      "You win $#{@bet}".colorize(:color => :white, :background => :blue)
      else
        "PUSH".colorize(:color => :white, :background => :blue)
      end
    else
      @wallet -= @bet
      "You lose $#{@bet}".colorize(:color => :white, :background => :red)
    end
  end

  def dealer_play
    loop do
      print_all
      sleep 1
      break if get_count(:dealer) >= 17
      @dealer += draw(1)
    end
    @round_end = true
    print_all
  end

  def get_action
    case gets.chomp.downcase
    when "hit" then @player += draw(1)
    when "stay" then 'break'
    else
      puts "Sorry didn't get that. Please choose Hit or Stay!"
      get_action
    end
  end

  def get_count person
    person == :player ? (player = @player) : (player = @dealer)
    aces = 0
    ace_ind = []
    sub_total = 0
    player.count.times do |i|
      if player[i][1] == "A"
        ace_ind.unshift(i)
        aces += 1
        sub_total += 11
      end
    end
    ace_ind.each do |i|
      player.delete_at(i)
    end
    player.each do |card|
      if card[1].to_i == 0
        sub_total += 10
      end
        sub_total += card[1].to_i
    end
    loop do
      break if aces < 1
      break if sub_total <= 21
      sub_total -= 10
      aces -= 1
    end
    sub_total
  end

  def print_player
    puts set_contructor @player
  end

  def print_dealer
    if @dealer.count == 1
      full_set = Array.new(6) {""}
      card = card_maker @dealer[0]
      blank = make_blank
      6.times do |i|
        full_set[i] += card[i] + " " + blank[i]
      end
      puts full_set
    else
      puts set_contructor @dealer
    end
  end

  def draw amount
    drawn = []
    amount.times do |i|
      drawn << @cards.delete_at(@cards.index(@cards.sample))
    end
    drawn
  end

  def make type, values
    values.each {|v| @cards << [type,v]}
  end

  def set_contructor cards
    full_set = Array.new(6) {""}
    cards.each do |card|
      next_card = card_maker card
      6.times {|i| full_set[i] += next_card[i] + " "}
    end
    full_set
  end

  def card_maker card
    case card[0]
    when "Spades" then make_spade card[1]
    when "Hearts" then make_heart card[1]
    when "Clubs" then make_club card[1]
    when "Diamonds" then make_diamond card[1]
    end
  end

  def make_blank
    [".------.".colorize(:color => :Black, :background => :white),
    "|      |".colorize(:color => :Black, :background => :white),
    "|      |".colorize(:color => :Black, :background => :white),
    "|      |".colorize(:color => :Black, :background => :white),
    "|      |".colorize(:color => :Black, :background => :white),
    "`------`".colorize(:color => :Black, :background => :white),]
  end

  def make_spade value
    if value == "10"
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '.   |'.colorize(:color => :Black, :background => :white),
      '| / \  |'.colorize(:color => :Black, :background => :white),
      '|(_,_) |'.colorize(:color => :Black, :background => :white),
      '|  I '.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    else
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + ' .   |'.colorize(:color => :Black, :background => :white),
      '| / \  |'.colorize(:color => :Black, :background => :white),
      '|(_,_) |'.colorize(:color => :Black, :background => :white),
      '|  I  '.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    end
  end

  def make_heart value
    if value == "10"
      ['.------.'.colorize(:color => :red, :background => :white),
      '|'.colorize(:color => :red, :background => :white) + value.colorize(:color => :red, :background => :white) + '  _ |'.colorize(:color => :red, :background => :white),
      '|( \/ )|'.colorize(:color => :red, :background => :white),
      '| \  / |'.colorize(:color => :red, :background => :white),
      '|  \/'.colorize(:color => :red, :background => :white) + value.colorize(:color => :red, :background => :white) + '|'.colorize(:color => :red, :background => :white),
      '`------`'.colorize(:color => :red, :background => :white)]
    else
      ['.------.'.colorize(:color => :red, :background => :white),
      '|'.colorize(:color => :red, :background => :white) + value.colorize(:color => :red, :background => :white) + '_  _ |'.colorize(:color => :red, :background => :white),
      '|( \/ )|'.colorize(:color => :red, :background => :white),
      '| \  / |'.colorize(:color => :red, :background => :white),
      '|  \/ '.colorize(:color => :red, :background => :white) + value.colorize(:color => :red, :background => :white) + '|'.colorize(:color => :red, :background => :white),
      '`------`'.colorize(:color => :red, :background => :white)]
    end
  end

  def make_club value
    if value == "10"
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '_   |'.colorize(:color => :Black, :background => :white),
      '| ( )  |'.colorize(:color => :Black, :background => :white),
      '|(_x_) |'.colorize(:color => :Black, :background => :white),
      '|  Y '.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    else
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + ' _   |'.colorize(:color => :Black, :background => :white),
      '| ( )  |'.colorize(:color => :Black, :background => :white),
      '|(_x_) |'.colorize(:color => :Black, :background => :white),
      '|  Y  '.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    end
  end

  def make_diamond value
    if value == "10"
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '/\  |'.colorize(:color => :Black, :background => :white),
      '| /  \ |'.colorize(:color => :Black, :background => :white),
      '| \  / |'.colorize(:color => :Black, :background => :white),
      '|  \/'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    else
      ['.------.'.colorize(:color => :Black, :background => :white),
      '|'.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + ' /\  |'.colorize(:color => :Black, :background => :white),
      '| /  \ |'.colorize(:color => :Black, :background => :white),
      '| \  / |'.colorize(:color => :Black, :background => :white),
      '|  \/ '.colorize(:color => :Black, :background => :white) + value.colorize(:color => :Black, :background => :white) + '|'.colorize(:color => :Black, :background => :white),
      '`------`'.colorize(:color => :Black, :background => :white)]
    end
  end
end

# ============== 21 ============================== #

# ================== Games ===================
def lobby
  p "Welcome to the Casino!"
  loop do
    p "What's your game?"
    p "Poker, Roulette, 21"
    p @wallet
    games(gets.chomp!)
  end
end

def poker
    p "Welcome to Poker" 
  loop do
    p "Please place your bet..."
    print_wallet
    bet = gets.chomp!.to_i
    handle_round bet
    print_wallet
    break unless play_again?
  end
end

def roulette
    p "Welcome to Roulette" 
  loop do
    p "Please place your bet..."
    print_wallet
    bet = gets.chomp!.to_i
    handle_round bet
    print_wallet
    break unless play_again?
  end
end

def twentyone
  system 'clear'
  puts "Welcome to blackjack table
  Whats your bet?"
  bet = gets.chomp.to_i
  my_game = Deck.new(@wallet, bet)
  @wallet = my_game.wallet
end


# ================== Methods ===================

def games choice
  case choice.downcase
  when "poker" then poker
  when "roulette" then roulette
  when "21" then twentyone
  else
  p "Dont have this game..."
  end
end

def play_again?
  p "Do you want to play again? [Y / N]"
  return(true) if STDIN.getch.downcase == "y"
  false
end

def win?
  [true,false].sample
end

def handle_round bet
  if win?
    @wallet += bet
      p "Collect you reward"
  else
    @wallet -= bet
      p "Try again later"
  end
end

def print_wallet
  puts "$#{@wallet}"
end

lobby


# ================== Poker =======================