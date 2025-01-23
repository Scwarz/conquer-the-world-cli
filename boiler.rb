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
    
  end

  def print_greetings
    puts "\nHey, Pinky! I need your help!"
  end

  def print_bye
    puts "Thank you for helping the Brain in mixing reagents for the potion. See you!"
  end
