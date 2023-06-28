require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :name, :age, :id, :parent_permission

  def initialize(specialization, age, name, id, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
