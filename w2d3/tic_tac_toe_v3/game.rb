require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(n,hash)
        @players = []
        hash.each do |player_mark,type|
            if type
                @players << ComputerPlayer.new(player_mark)
            else
                @players << HumanPlayer.new(player_mark)
            end
        end
        @board = Board.new(n)
        @currentplayer = @players.first
    end

    def switch_turn
        @currentplayer = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @currentplayer.get_position(@board.legal_positions)
            @board.place_mark(pos,@currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                puts  @currentplayer.mark.to_s + ' win!'
                return
            else
                self.switch_turn
            end
        end
        print 'draw'
    end
end