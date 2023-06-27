require './person'
class Student < Person
  def initialize(
    age:,
    classroom:, name: 'Unknown',
    parent_permisson: true
  )
    super( age: age, name: name, parent_permisson: parent_permisson)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
