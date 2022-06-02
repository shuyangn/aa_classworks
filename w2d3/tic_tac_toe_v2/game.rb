require_relative "board"
require_relative "human_player"

class Game
    def initialize(n,*player_marks)
        @players = []
        player_marks.each do |player_mark|
            @players << HumanPlayer.new(player_mark)
        end
        @board = Board.new(n)
        @currentplayer = @players[0]
    end

    def switch_turn
        @currentplayer = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                print 'victory : ' + @currentplayer.mark.to_s
                return
            else
                self.switch_turn
            end
        end
        print 'draw'
    end
end