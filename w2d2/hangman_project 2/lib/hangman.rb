class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    sample = Hangman.random_word
    @secret_word = sample
    @guess_word = Array.new(@secret_word.length.to_i, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    ans = []
    @secret_word.each_char.with_index do |c,i|
      if c == char
        ans << i
      end
    end
    ans
  end

  def fill_indices(char, array)
    array.each do |a|
      @guess_word[a] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    end

    @attempted_chars << char
    
    idx = self.get_matching_indices(char)
    if idx.empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, idx)
    return true
    end
  end

  def ask_user_for_guess
    print 'Enter a char:'
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      return true
    else
      return false
    end
  end
end
