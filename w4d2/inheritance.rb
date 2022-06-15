class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, salary, title, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_e(self) if !boss.nil?
        boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def add_e(employee)
        @employees << employee
        employee
    end


    def total_subsalary
      total_subsalary = 0
      self.employees.each do |employee|
        if employee.is_a?(Manager)
          total_subsalary += employee.salary + employee.total_subsalary
        else
          total_subsalary += employee.salary
        end
      end
      total_subsalary
    end

    def bonus(multiplier)
        self.total_subsalary * multiplier
    end
end


ned = Manager.new("Ned",1000000,"Founder",nil)
darren = Manager.new("Darren",78000,'ta manager',ned)
shawna = Employee.new('Shawna',12000,'ta',darren)
david = Employee.new('David',10000,'ta',darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000