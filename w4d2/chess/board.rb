require_relative 'piece'

class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8){Array.new(8)}
        (0...8).each do |i|
            if i == 0 || i == 1 || i == 6 || i == 7
                (0...8).each do |j|
                    @rows[i][j] = Piece.new()
                end
            end
        end
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []= (pos,val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        raise 'there is no piece' if self[start_pos].nil?
        # raise 'cannot move to end position' 
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def valid_pos?(pos)
    end
end
