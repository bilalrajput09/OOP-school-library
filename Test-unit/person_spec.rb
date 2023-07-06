require './person.rb'

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

  context '#add_rental' do
    it 'should create a new rental' do
      book = double('book')
      date = double('date')
      rental = subject.send(:add_rental, book, date)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq date
      expect(rental.book).to eq book
      expect(rental.person).to eq subject
    end
  end
end
