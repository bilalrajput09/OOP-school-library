class Person
  attr_reader(:id)
  attr_accessor(:name, :age)

  def initialize(
    id:,
    age:,
    name: 'Unknown',
    parent_permisson: true
  )
    @id = id
    @name = name
    @age = age
    @parent_permisson = parent_permisson
  end

  def can_use_services?
    return true if of_age? || @parent_permisson
  end

  private

  def of_age?
    age >= 18
  end
end
