relative_require 'Person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name = 'Unknown', age, specialization, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
