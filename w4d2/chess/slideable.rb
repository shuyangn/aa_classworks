module Slideable 
    HORIZONTAL_DIRS = [[[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs(start_pos)
        res = []
        HORIZONTAL_DIRS.each do |dir|
            x = dir[0] + start_pos[0]
            y = dir[1] + start_pos[1]
            while (0..7).include?(x) && (0..7).include?(y)
                res << [x,y]
                x += dir[0]
                y += dir[1]
            end
        end
        res
    end

    def diagonal_dirs(start_pos)
        res = []
        DIAGONAL_DIRS.each do |dir|
            x = dir[0] + start_pos[0]
            y = dir[1] + start_pos[1]
            while (0..7).include?(x) && (0..7).include?(y)
                res << [x,y]
                x += dir[0]
                y += dir[1]
            end
        end
        res
    end

    def moves(start_pos)
        horizontal_dirs(start_pos) + diagonal_dirs(start_pos)
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir
    end
end

