require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
p person.correct_name # => "maximilianus"
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name # => "Maximilianus"
capitalized_trimmer_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmer_person.correct_name # = > "Maximilian"
