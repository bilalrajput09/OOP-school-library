require './rental'
require './book'
require './person'
describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(age: 25) }
  let(:date) { '2023-06-26' }
  subject { Rental.new(date, book, person) }
  context '#initialize' do
    it 'should initialize a rental' do
      expect(subject.date).to eq date
      expect(subject.book).to eq book
      expect(subject.person).to eq person
    end
    it 'should add the rental to person rentals' do
      expect(person.rentals).to include(subject)
    end
    it 'should add the rental to book rentals' do
      expect(book.rentals).to include(subject)
    end
  end
end
