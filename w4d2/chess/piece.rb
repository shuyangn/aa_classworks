class Piece
    def initialize(color = nil, board = nil, pos = nil)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def Symbol
    end

    private
    def move_into_check?(end_pos)
    end
end