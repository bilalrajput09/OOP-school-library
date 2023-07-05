require './store'
class Operations
  def initialize
    @store = Store.new
  end

  def store_books(title, author)
    books = []
    book = { title: title, author: author }
    books = @store.read_file('books.json') if File.exist?('books.json')
    books.push(book)
    @store.write_file('books.json', books)
  end

  def store_person(num, age, name, permission = true, specialization = nil)
    persons = []
    persons = @store.read_file('persons.json') if File.exist?('persons.json')
    person = if num == 1
               { options: num, age: age, name: name, parent_permisson: permission }
             else
               { options: num, age: age, name: name, specialization: specialization }
             end
    persons.push(person)
    @store.write_file('persons.json', persons)
  end

  def store_rentals(date, book_id, person_id)
    rentals = []
    rentals = store.read_file('rentals.json') if File.exist?('rental.json')
    rental = { date: date, book_id: book_id, person_id: person_id }
    rentals.push(rental)
    @store.write_file('rentals.json', rentals)
  end
end
