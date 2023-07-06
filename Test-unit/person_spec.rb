require './person'
require './book'
require './rental'

describe Person do
  subject do
    Person.new(age: 22, name: 'maximilianus')
  end

  context '#initialize' do
    it 'should initialize a person' do
      expect(subject.name).to eq 'maximilianus'
      expect(subject.age).to eq 22
      expect(subject.rentals).to be_empty
    end
  end

  context '#can_use_services?' do
    it 'should allow a person to use services' do
      expect(subject.can_use_services?).to be true
    end
  end

  context '#correct_name' do
    it 'should return the correct name' do
      expect(subject.correct_name).to eq 'maximilianus'
    end
  end

  describe '#add_rental' do
    let(:person) { Person.new(age: 25, name: 'John Doe', parent_permisson: true) }
    let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
    date = '09-09-2022'
    it 'creates a rental and adds it to the person\'s rentals list' do
      rental = person.send(:add_rental, book, date)

      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end
  end
end
