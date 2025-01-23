require_relative 'reagent'

class Boiler
  attr_accessor :reagents

  def initialize
    @reagents = ['Human nail', 'Cat claw', 'Mouse tail']
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
    @reagents.each { |reagent| puts reagent.capitalize }
  end

  def mix_some_reagents
    if @reagents.empty?
      puts 'Please choose some of the reagents first!'
      return
    end

    puts 'Choose two reagents by typing their names:'
    print 'Type the first reagent: '
    reagent1 = gets.strip.downcase
    print 'Type the second reagent: '
    reagent2 = gets.strip.downcase

    # Special messages for specific combinations
    special_messages = {
      ['human nail', 'cat claw'] => "Oh no, you turned a human into a cat! Run, Pinky!",
      ['cat claw', 'mouse tail'] => "Not bad, Pinky! You turned all cats into mice. At least we are safe from cats, but we still need to take over the world! Keep trying!",
      ['human nail', 'mouse tail'] => "You've created a tiny human-mouse hybrid. Fascinating! Now, it's time to conquer the world!"
    }

   # Had to google a bit for help since I am not that strong at Ruby to get a message for a specific combination because what if a user types "cat claw" first and "human nail" after so that array will not match and a user will get a different message so I downcased reagents for comparison
   downcase_reagents = @reagents.map(&:downcase)
  
   # Check if both entered reagents are valid
   if downcase_reagents.include?(reagent1) && downcase_reagents.include?(reagent2)
     reagent = Reagent.new
     mixed_reagents = reagent.add(reagent1.capitalize, reagent2.capitalize)
 
     # Sort the input reagents to make sure the order doesn't matter
     key = [reagent1, reagent2].sort
  
     # Loop through special messages and check if the sorted input matches any key
     special_messages.each do |message_key, message_value|
       if message_key.sort == key
         puts message_value
         return
       end
     end
 
     puts "You mixed: #{mixed_reagents}. No strange effects... yet. Try again!"
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
