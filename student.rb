require './person'
class Student < Person
  attr_reader :classroom

  def initialize(
    age:,
    classroom:,
    name: 'Unknown',
    parent_permisson: true
  )
    super(age: age, name: name, parent_permisson: parent_permisson)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
    
  end
end
