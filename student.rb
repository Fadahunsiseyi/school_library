relative_require 'Person'

class Student < Person
    attr_accessor :classroom

    def initialize(name="Unknown", age, classroom, parent_permission: true)
        super(name, age, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end