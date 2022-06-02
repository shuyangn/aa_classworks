class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`'
        get = gets.chomp.split(" ")
        get.map {|i| i.to_i}
    end
end


