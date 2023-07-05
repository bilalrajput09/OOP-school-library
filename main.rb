require './app'
require './select_option'
require './data_loader'

def main
  app = App.new
  select_obj = SelectOption.new
  load_data = DataLoader.new(app)
  load_data.load_books_data
  load_data.load_person_data
  load_data.load_rentals

  loop do
    show_menu
    select_obj.select_option(app)
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

main
