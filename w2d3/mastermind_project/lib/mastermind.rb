require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_ins)
        puts code_ins.num_exact_matches(@secret_code)
        puts code_ins.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        code = gets.chomp
        guess_code = Code.from_string(code)
        print_matches(guess_code)
        guess_code == @secret_code
    end
end
