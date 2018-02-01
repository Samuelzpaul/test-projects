require 'rspec'

def html_generator title
  heading = %w(
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title> html_generator </title>
</head>

<body>
</body>
</html>)
  heading[1] = title
  "<%s>%s<%s>" % heading
end

describe 'HTML generator' do
  it 'allows for a dynamic title' do
    expect(html_generator 'My Site').to match(/My Site/)
  end
end

def html_generator title
<<HTML
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title> html_generator </title>
</head>

<body>
</body>
</html>
HTML
end