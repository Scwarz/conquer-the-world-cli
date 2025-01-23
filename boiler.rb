require_relative 'reagent'

class Boiler
  attr_accessor :reagents

  def initialize
    @reagents = []
  end

  def run
    print_greetings
    start_loop
    print_bye
  end

  def start_loop
    loop do
      puts 'Options:'
      puts '1) List of Reagents'
      puts '2) Mix some Reagents'
      puts '3) Exit'
      
      case user_choice
      when 1
        list_of_reagents
      when 2
        mix_some_reagents
      # Exit the loop if a user pushes "3) exit"
      when 3
        puts 'Stop preparing the potion. Bye-bye!'
      
    end
  end  

  def list_of_reagents
    puts 'What we have in our pockets that we could use for making the potion:'
    @reagents = ['Human nail', 'Cat claw', 'Mouse tail']

  end

  def mix_some_reagents
    if @reagents.empty?
      puts 'Please choose some of the reagents first!'
      return
    end
    puts 'Choose two reagents by typing their names:'
    print 'Type the first reagent: '
    reagent1 = gets.downcase.chomp
    print 'Type the second reagent: '
    reagent2 = gets.downcase.chomp
    if @reagents.include?(reagent1) && @reagents.include?(reagent2)
      reagent = Reagent.new
      mixed_reagents = reagent.add(reagent1.capitalize, reagent2.capitalize)
      puts "You mixed: #{mixed_reagents}"
    else
      # Special messages for specific combinations
      special_messages = {
      ['human nail', 'cat claw'] => "Oh no, you turned a human into a cat! Run, Pinky!",
      ['cat claw', 'mouse tail'] => "Not bad, Pinky! You turned all cats into mice. At least we are safe from cats, but we still need to take over the world! Keep trying!",
      ['human nail', 'mouse tail'] => "You've created a tiny human-mouse hybrid. Fascinating! Now, it's time to conquer the world!"
    }
    key = [reagent1, reagent2].sort # Have to google it. Stuck with the sorting because what if a user types "cat claw and human nail" so that will be a different combination, but has to have the same message. So I sorted it to make it to ensure order doesn't matter
    if special_messages.key?(key)
      puts special_messages[key]
    else
      puts "You mixed: #{mixed_reagents}. No strange effects... yet. Try again"
    end
      puts 'Invalid reagents. Please select from the list of reagents.'
    end

  end

  def print_greetings
    puts "\nHey, Pinky! I need your help!"
  end

  def print_bye
    puts "Thank you for helping the Brain in mixing reagents for the potion. See you!"
  end
