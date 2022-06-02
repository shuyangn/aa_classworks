require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark,player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @currentplayer = @player1
    end

    def switch_turn
        if @currentplayer == @player1
            @currentplayer = @player2
        else
            @currentplayer = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                print 'victory : ' + @currentplayer.mark.to_s
            else
                self.switch_turn
            end
        end
    end
end