require './person'
require './book'
require './teacher'
require './student'
require './rental'
require './store'
require './operations'

class App
  attr_accessor :people, :books

  def initialize
    @rentals = []
    @books = []
    @people = []
    @operations = Operations.new
  end

  def books_list
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def people_list
    @people.each do |p|
      puts "ID: #{p.id}, Name: #{p.name}, Age: #{p.age}"
    end
  end

  def create_student(age = nil, name = nil, permission = nil)
    if age.nil? && name.nil? && permission.nil?

      puts 'Name:'
      name = gets.chomp

      puts 'Age:'
      age = gets.chomp

      puts 'Has Parent permission? [Y/N]'
      permission_input = gets.chomp
      permission = true if %w[Y y].include?(permission_input)
      permission = false if %w[N n].include?(permission_input)

      student = Student.new(age: age, classroom: nil, name: name, parent_permisson: permission)

      @people.push(student)
      @operations.store_person(1, age, name, permission)
      puts 'Student Created!'

    else
      student = Student.new(age: age, classroom: nil, name: name, parent_permisson: permission)

      @people.push(student)
    end
  end

  def create_teacher(age = nil, name = nil, specialization = nil)
    if age.nil? && name.nil? && specialization.nil?
      puts 'Specialization:'
      specialization = gets.chomp

      puts 'Age:'
      age = gets.chomp

      puts 'Name:'
      name = gets.chomp

      @people << Teacher.new(age: age, specialization: specialization, name: name)
      @operations.store_person(2, age, name, nil, specialization)

      puts 'Teacher Created!'
    else
      @people << Teacher.new(age: age, specialization: specialization, name: name)
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'

    input = gets.chomp
    input_int = input.to_i

    case input_int
    when 1
      create_student(nil, nil, nil)
    when 2
      create_teacher(nil, nil, nil)
    end
  end

  def create_book(title: false, author: false)
    if title && author

      book = Book.new(title, author)

      @books.push(book)
    else

      puts 'Title:'
      title = gets.chomp

      puts 'Author:'
      author = gets.chomp

      book = Book.new(title, author)

      @books << book

      @operations.store_books(title, author)

      puts 'Book Created!'

    end
  end

  def create_rental(date = nil, book_id = nil, person_id = nil)
    if date.nil? && person_id.nil? && book_id.nil?

      puts 'Select a book by number'

      @books.each_with_index do |book, i|
        puts "#{i}) Title: #{book.title}, Author: #{book.author}"
      end

      book_i = gets.chomp.to_i

      puts 'Select a person by number (not ID)'

      @people.each_with_index do |p, i|
        puts "#{i}) Name: #{p.name} , ID: #{p.id}, Age: #{p.age}"
      end

      p_index = gets.chomp.to_i

      puts 'Date:'
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_i], @people[p_index])

      @operations.store_rentals(date, book_i, p_index)

      puts 'Rental Created!'

    else

      @rentals << Rental.new(date, book_id, person_id)
    end
  end

  def list_person_id_of_rentals
    puts 'Enter ID:'
    person_id = gets.chomp
    person_id_int = person_id.to_i

    person = @people.find { |p| p.id == person_id_int }

    rentals = @rentals.select { |rental| rental.person == person }

    rentals.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end

  def exit_application
    puts 'Goodbye! see you again....'
    exit
  end
end
