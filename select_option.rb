class SelectOption
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
end
