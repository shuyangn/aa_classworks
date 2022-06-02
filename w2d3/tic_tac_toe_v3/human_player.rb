class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        pos = [-1,-1]
        until legal_positions.include?(pos)
            puts 'enter a valid position as numbers with a space between them'
            pos = gets.chomp.split(" ").map(&:to_i)
            if !legal_positions.include?(pos)
                puts 'not a valid position'
            end
        end
        pos
    end
end