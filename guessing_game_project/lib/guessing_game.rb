class GuessingGame

    def initialize(min,max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        @game_over = true if num == @secret_num
        if num == @secret_num
            p "you win"
        elsif num > @secret_num
            p "too big"
        else
            p "too small"
        end
    end

    def ask_user
        p "enter a number"
        num_input = gets.chomp.to_i
        self.check_num(num_input)
    end
end
