class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    sample = self.random_word
    @secret_word = sample
    @guess_word = Array.new(@secret_word.length.to_i, "_")
    @attempted_char = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_char
    @attempted_char
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_char.include?(char)
  end

  def get_matching_indices(char)
    ans = @secret_word.each_char.with_index do |c,i|
      if c == char
        i
      end
    end
    ans
  end

  def fill_indices(char, array)
    array.each do |a|
      @guess_word[a] = char
    end
  end
end
