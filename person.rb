require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader(:id)
  attr_accessor(:name, :age)

  def initialize(
    age:,
    name: 'Unknown',
    parent_permisson: true
  )
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permisson = parent_permisson
  end

  def can_use_services?
    return true if of_age? || @parent_permisson
  end

  def correct_name
    name
  end

  private

  def of_age?
    age >= 18
  end
end

person = Person.new(age: 22, name: 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
