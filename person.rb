class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(name = 'Unknown', age, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def is_of_age?
    @age >= 18
  end
end
