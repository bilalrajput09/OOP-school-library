require './student'
describe Student do
  subject do
    Student.new(age: 18, classroom: 'A', name: 'John Doe')
  end
  context '#initialize' do
    it 'should initialize a student' do
      expect(subject.name).to eq 'John Doe'
      expect(subject.age).to eq 18
      expect(subject.classroom).to eq 'A'
      expect(subject.rentals).to be_empty
    end
  end
  context '#play_hooky' do
    it 'should return a string' do
      expect(subject.play_hooky).to be_a(String)
    end
    it 'should return the correct string' do
      expect(subject.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
