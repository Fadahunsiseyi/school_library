class Person
    attr_accessor :name, :age, :parent_permission
    attr_reader :id
    def initialize(name="Unknown", age, parent_permission: true)
    end
end