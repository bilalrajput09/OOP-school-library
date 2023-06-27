require "./base_decorator"

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = super()
    name[0,10]
  end
end

