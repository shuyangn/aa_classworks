def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|i| hash[i] += 1}
    hash.select {|k,v| v == 1}.keys
end
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new{|h,k| h[k] = []}
    str.each_char.with_index do |c,i|
        hash[c] << i
    end
    hash
end
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    prev = ''
    count = 0
    tempcount = 0
    res = ''
    str.each_char do |c|
        if c == prev || prev == ''
            tempcount += 1
        else
            tempcount = 1
        end
        prev = c
        if tempcount >= count
            res = c
            count = tempcount
        end
    end
    res * count
end

# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    primefactors = (2..num).select {|n| prime?(n) && num % n == 0}
    (0...primefactors.length).each_with_index do |i|
        (i...primefactors.length).each_with_index do |j|
            return true if num == primefactors[i] * primefactors[j]
        end
    end
    false
end


def prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message,keys)
    ans = ""
    alphabet = ("a".."z").to_a
    message.each_char.with_index do |c,i|
        ans += alphabet[(alphabet.index(c) + keys[i % keys.length.to_i]) % 26]
    end
    ans
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowel_arr = []
    vowel_idx = []
    str.each_char.with_index do |c,i|
        if "aeiou".include?(c)
            vowel_arr << c
            vowel_idx << i
        end
    end
    vowel_arr.rotate!(-1)
    vowel_idx.each_with_index do |vi,i|
        str[vi] = vowel_arr[i]
    end
    str
end
# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        return '' if !prc
        ans = ''
        self.each_char {|c| ans += c if prc.call(c)}
        ans
    end

    def map!(&prc)
        self.each_char.with_index do |c,i|
            self[i] = prc.call(c,i)
        end
        self
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

def multiply(a,b)
    return 0 if b == 0
    if b < 0
        return -(a + multiply(a,-b-1))
    else
        return a + multiply(a,b-1)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2
    return lucas_sequence(num - 1) + [lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |n|
        if num % n == 0
            factor1 = n
            factor2 = num / n
            return *prime_factorization(factor1), *prime_factorization(factor2)
        end
    end
    [num]   #直到不能继续拆分
end

# Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]