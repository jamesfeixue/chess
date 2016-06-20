require 'byebug'
require_relative 'employee'
class Manager < Employee
  attr_accessor :subordinates

  def initialize(subordinates = [], options = {})
    @subordinates = subordinates

    super(options)

  end

  def bonus(multiplier)
    sum = 0
    queue = self.subordinates

    until queue.empty?
      manager = queue.shift
      sum += manager.salary
      if manager.is_a?(Manager)
        manager.subordinates.each do |subordinate|
          queue << subordinate
        end
      end
    end

    #debugger

    sum * multiplier

  end

  def add_employee(employee)
    self.subordinates << employee
  end

end
