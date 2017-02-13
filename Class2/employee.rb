require_relative 'person'

class Employee < Person
  attr_accessor :category, :desired_AC_temperature
end
