require './app'

def main
  app = App.new
  loop do
    show_menu
    select_option(app)
  end
end

def show_menu
  puts 'Choose option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a book'
  puts '4. List all rentals by a person ID'
  puts '5. Create a new person'
  puts '6. Create a new rental'
  puts '7. Quit'
end

def select_option(app)
  options_hash = {
    '1' => :books_list,
    '2' => :people_list,
    '3' => :create_book,
    '4' => :list_person_id_of_rentals,
    '5' => :create_person,
    '6' => :create_rental,
    '7' => :exit_application
  }

  input = gets.chomp
  if options_hash.key?(input)
    app.send(options_hash[input])
  else
    puts 'INVALID!! Please select again!'
  end
end

def exit_application
  puts 'Goodbye! see you again....'
  exit
end

main
