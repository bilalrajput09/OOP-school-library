require './store'

class DataLoader
  def initialize(app)
    @store = Store.new
    @app = app
  end

  def load_books_data
    return unless File.exist?('books.json')

    books = @store.read_file('books.json')

    books.each do |book|
      @app.create_book(title: book['title'], author: book['author'])
    end
  end

  def load_person_data
    return unless File.exist?('persons.json')

    persons = @store.read_file('persons.json')

    persons.each do |person|
      if person['options'] == '1'
        @app.create_student(person['age'], person['name'], person['permission'])
      else
        @app.create_teacher(person['age'], person['name'], person['specialization'])
      end
    end
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    rentals = @store.read_file('rentals.json')
    rentals.each do |rental|
      @app.create_rental(rental['date'], @app.books[rental['book_id']], @app.people[rental['person_id']])
    end
  end
end
