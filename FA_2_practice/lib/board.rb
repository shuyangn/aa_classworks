class Board

    def self.build_stacks(num)
        Array.new(num){Array.new()}
    end

    attr_reader :max_height

    def initialize(num, max_height)
        raise 'rows and cols must be >= 4' if max_height < 4 || num < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num)
    end

    def add(token,index)
        if @stacks[index].length < @max_height
            @stacks[index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.any? {|row| row.length == @max_height && row.all?{|i| i == token}}
    end

    def horizontal_winner?(token)
        (0...@max_height).each do |col|
            return true if @stacks.all?{|row| row[col] == token}
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
