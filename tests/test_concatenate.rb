require 'minitest/autorun'
require './boiler'
#I used the documentation for StringIO on https://ruby-doc.org/stdlib-1.9.3/libdoc/stringio/rdoc/StringIO.html
class TestConcatenate < Minitest::Test

  def setup
    @boiler = Boiler.new
  end

  
  def test_bad_potion # Simulate that the user types "Human nail" and "Cat claw"
    
    input = StringIO.new("human nail\ncat claw\n")
  output = StringIO.new
  $stdin = input
  $stdout = output
  
  @boiler.mix_some_reagents

  # Full expected output including prompts
  expected_output = "Choose two reagents by typing their names:\nType the first reagent: Type the second reagent: Oh no, you turned a human into a cat! Run, Pinky!\n"
  assert_equal expected_output, output.string
ensure
  $stdin = STDIN
  $stdout = STDOUT
  end

  def test_good_potion # Simulate that the user types "Human nail" and "Mouse tail"
    
    input = StringIO.new("human nail\nmouse tail\n")
    output = StringIO.new
    $stdin = input
    $stdout = output
    
    @boiler.mix_some_reagents

    expected_output = "Choose two reagents by typing their names:\nType the first reagent: Type the second reagent: You've created a tiny human-mouse hybrid. Fascinating! Now, it's time to conquer the world!\n"
    assert_equal expected_output, output.string
  ensure
    $stdin = STDIN
    $stdout = STDOUT
  end

  def test_try_again_potion # Simulate that the user types "Cat claw" and "Mouse tail"
    
    input = StringIO.new("cat claw\nmouse tail\n")
    output = StringIO.new
    $stdin = input
    $stdout = output
    
    @boiler.mix_some_reagents

    expected_output = "Choose two reagents by typing their names:\nType the first reagent: Type the second reagent: Not bad, Pinky! You turned all cats into mice. At least we are safe from cats, but we still need to take over the world! Keep trying!\n"
    assert_equal expected_output, output.string
  ensure
    $stdin = STDIN
    $stdout = STDOUT
  end

end
