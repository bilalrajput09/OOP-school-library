require './person'
require './book'
require './teacher'
require './student'
require './rental'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
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

  def create_student
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
    puts 'Student Created!'
  end

  def create_teacher
    puts 'Specialization:'
    specialization = gets.chomp

    puts 'Age:'
    age = gets.chomp

    puts 'Name:'
    name = gets.chomp

    @people << Teacher.new(age: age, specialization: specialization, name: name)
    puts 'Teacher Created!'
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'

    input = gets.chomp
    input_int = input.to_i

    case input_int
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)

    @books << book

    puts 'Book Created!'
  end

  def create_rental
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

    puts 'Rental Created!'
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
end
