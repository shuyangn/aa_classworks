class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'enter a valid position as two numbers with a space between them'
        pos = gets.chomp.split(" ").map(&:to_i)
        if pos.length != 2
            raise 'invalid position'
        end
        pos
    end


end