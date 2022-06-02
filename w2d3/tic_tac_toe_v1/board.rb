class Board
    def initialize
        @grid = Array.new(3){Array.new(3,"_")}
    end

    def valid?(pos)
        pos[0] <= 2 && pos[0] >= 0 && pos[1] <= 2 && pos[1] >= 0
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos,mark)
        if !self.valid?(pos) || !self.empty?(pos)
            raise 'invalid position'
        end
        @grid[pos[0]][pos[1]] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any?{|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        if (0...@grid.length).all?{|i| @grid[i][i] == mark} || (0...@grid.length).all?{|i| @grid[i][2-i] == mark}
            return true
        end
        return false
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end      


end