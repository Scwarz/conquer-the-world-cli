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

      user_choice = gets.chomp.to_i

      case user_choice
      when 1
        list_of_reagents
      when 2
        mix_some_reagents
      # Exit the loop if a user pushes "3) exit"
      when 3
        puts 'Stop preparing the potion. Bye-bye!'
        break # Exit the loop
      else
        puts 'Invalid option. Please choose again.'
      end # End of case block
    end # End of loop
  end

  def list_of_reagents
    puts 'What we have in our pockets that we could use for making the potion:'
    @reagents = ['Human nail', 'Cat claw', 'Mouse tail']
    @reagents.each { |reagent| puts reagent }
  end

  def mix_some_reagents
    if @reagents.empty?
      puts 'Please choose some of the reagents first!'
      return
    end

    puts 'Choose two reagents by typing their names:'
    print 'Type the first reagent: '
    reagent1 = gets.strip.downcase.chomp
    print 'Type the second reagent: '
    reagent2 = gets.strip.downcase.chomp

    # Special messages for specific combinations
    special_messages = {
      ['human nail', 'cat claw'] => "Oh no, you turned a human into a cat! Run, Pinky!",
      ['cat claw', 'human nail'] => "Oh no, you turned a human into a cat! Run, Pinky!",
      ['cat claw', 'mouse tail'] => "Not bad, Pinky! You turned all cats into mice. At least we are safe from cats, but we still need to take over the world! Keep trying!",
      ['mouse tail', 'cat claw'] => "Not bad, Pinky! You turned all cats into mice. At least we are safe from cats, but we still need to take over the world! Keep trying!",
      ['human nail', 'mouse tail'] => "You've created a tiny human-mouse hybrid. Fascinating! Now, it's time to conquer the world!",
      ['mouse tail', 'human nail'] => "You've created a tiny human-mouse hybrid. Fascinating! Now, it's time to conquer the world!"
    }
    #Have to google it since my knolodges are not strong. So I was stuck with a vlidation that both entered reagents are valid and are on the list. So I converted reagents to downcase and check if both are valid
    reagents = [reagent1, reagent2]
    valid_reagents = @reagents.map(&:downcase) # Downcase the list of reagents
    if (valid_reagents & reagents).size == 2
      # Check for special messages with both orderings
      key = reagents.sort
      message = special_messages.fetch(key, "You mixed: #{reagent1.capitalize} and #{reagent2.capitalize}. No strange effects... yet. Try again")
      puts message
    else
      puts 'Invalid reagents. Please select from the list of reagents.'
    end
  end

  def print_greetings
    puts "\nHey, Pinky! I need your help!"
  end

  def print_bye
    puts "Thank you for helping the Brain in mixing reagents for the potion. See you!"
  end
end
