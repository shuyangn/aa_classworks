class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all?{|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  attr_reader :pegs

  def initialize(array)
    raise "invalid pegs" if !Code.valid_pegs?(array)
    @pegs = array.map(&:upcase)
  end

  def self.random(length)
    array = Array.new(length) {POSSIBLE_PEGS.keys.sample}
    Code.new(array)
  end

  def self.from_string(string)
    array = string.split("")
    return Code.new(array)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_ins)
    count = 0
    code_ins.pegs.each_with_index do |c,i|
      count += 1 if c.upcase == @pegs[i]
    end
    count
  end


  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(code_ins)
    self.length == code_ins.length && self.num_exact_matches(code_ins) == self.length
  end
end

