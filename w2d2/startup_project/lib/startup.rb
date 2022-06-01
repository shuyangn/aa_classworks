require "employee"

class Startup
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        @funding > another_startup.funding
    end

    def hire(employee_name, title)
        unless valid_title?(title)
            raise error
        end
        @employees << Employee.new(employee_name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise error
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|e| sum += @salaries[e.title]}
        sum / @employees.length.to_i
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title,salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees = @employees + another_startup.employees
        another_startup.close
    end
end
