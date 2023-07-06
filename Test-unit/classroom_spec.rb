require './classroom'
require './student'
require "./person"


describe Classroom do
  subject(:classroom) { Classroom.new('Seven') }

  it 'is an instance of Classroom' do
    expect(classroom).to be_instance_of(Classroom)
  end

  it 'has the correct classroom label' do
    expect(classroom.label).to eq('Seven')
  end

  describe '#add_student' do
    let(:student) { double('student', age: '22', name: 'Bilal', parent_permission: true) }

    it 'adds a student to the classroom' do
      allow(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.students[0].name).to eq('Bilal')
    end
  end
end