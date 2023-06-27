require "./nameable"
class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    puts @nameable
  end
  def correct_name
    @nameable.correct_name
  end
end

base = BaseDecorator.new(person)