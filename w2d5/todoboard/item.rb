class Item
    def self.valid_date?(date_string)
        parts = date_string.split("-")
        return false if parts.length != 3
        year, month, day = parts.map(&:to_i)
        return false if month > 12 || month < 1
        return false if day > 31 || day < 1
        true
    end

    attr_reader :title, :deadline, :description
    attr_writer :title, :description

    def initialize(title,deadline,description)
        raise "not valid deadline" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        raise "not valid deadline" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end
end
    