class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        print "#{self.mark} chooses position #{pos.to_s} \n"
        return pos
    end
end