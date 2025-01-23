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

      # Exit the loop if a user pushes "3) exit"
      

      
    end
  end  

  def print_greetings
    puts "\nHey, Pinky! I need your help!"
  end

  def print_bye
    puts "Thank you for helping the Brain in mixing reagents for the potion. See you!"
  end
