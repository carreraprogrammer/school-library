def main
    puts
    puts "Welcome to school library app"
    puts
    puts "Please choose an option by entering a number:"
    puts
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    puts
    
    response = gets.chomp.to_i
    
    if response <= 7
      puts "You chose the #{response} option"
    else
      puts
      puts "~~ Please, insert a valid number ~~"
      sleep(1)
      main
    end
  end
  
  main
  