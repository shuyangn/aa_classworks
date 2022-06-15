class Board

    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(@size){Array.new(@size)}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            return true if row.all?{|i| i == mark}
        end
        false
    end

    def complete_col?(mark)
        @grid.transpose.each do |col|
            return true if col.all?{|j| j == mark}
        end
        false
    end

    def complete_diag?(mark)
        (0...@size).all?{|i| @grid[i][i] == mark} || (0...@size).all?{|i| @grid[i][@size-1-i] == mark}
    end

    def winner?(mark)
        return true if complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
        false
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
