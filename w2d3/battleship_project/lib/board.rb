class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def size
        @size
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships   
        count = 0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if @grid[row][col] == :S
                    count += 1
                end
            end
        end
        count
    end

    # def num_ships   简便写法
    #     @grid.flatten.count(:S)
    # end
    
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        count = self.size * 0.25
        while self.num_ships < count
            r = rand(0...@grid.length)
            c = rand(0...@grid.length)
            @grid[r][c] = :S
        end
    end

    def hidden_ships_grid
        ans = Array.new(@grid.length) { Array.new(@grid.length) }
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if @grid[row][col] == :S
                    ans[row][col] = :N
                else
                    ans[row][col] = @grid[row][col]
                end
            end
        end
        ans
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
