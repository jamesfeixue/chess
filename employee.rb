class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(options = {})
    defaults = {:name => "Default Name", :title => "Employee", :salary: 0, :boss => "unassigned"}
    options = defaults.merge(options)

    @name = options[name]
    @title = options[title]
    @salary = options[salary]
    @boss = options[boss]

end
