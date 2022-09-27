class Person
    attr_accessor :name, :age, :parent_permission
    attr_reader :id
    def initialize(name="Unknown", age, parent_permission: true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    Private
    
    def is_of_age?
        if @age >= 18
            true
        else 
            false
    end
end