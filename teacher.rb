require './person'

class Teacher < Person
  def initialize(
    id:,
    age:,
    specialization:, name: 'Unknown',
    parent_permisson: true
  )

    super(id: id, age: age, name: name, parent_permisson: parent_permisson)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
