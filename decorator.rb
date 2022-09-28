require_relative './nameable'
class Decorator < Nameable
    def initialize(nameable)
        super()
        @nameable = nameable
    end
end