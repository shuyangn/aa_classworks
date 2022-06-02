class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n,"_")}
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
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
        if (0...@grid.length).all?{|i| @grid[i][i] == mark} || (0...@grid.length).all?{|i| @grid[i][@grid.length-1-i] == mark}
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

    def legal_positions
        legal = []
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if empty?([i,j])
                    legal << [i,j]
                end
            end
        end
        legal
    end

    # def legal_positions   #更机智的写法
    #     indices = (0...@grid.length).to_a
    #     positions = indices.product(indices)
    #     positions.select { |pos| empty?(pos) }
    # end
end