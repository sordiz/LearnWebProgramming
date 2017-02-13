require_relative 'person'

class Employee < Person
  field :category, type: String
  field :desired_AC_temperature, type: Integer 
end
