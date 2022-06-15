class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new{|x, y| x<=>y}
    return self if size < 2
    mid = size / 2
    left = self[0...mid].merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    ans = []
    while !left.empty? && !right.empty?
      if prc.call(left.first,right.first) == 1
        ans << right.shift
      else
        ans << left.shift
      end
    end
    ans + left + right
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    ans = []
    (0...size - 1).each do |i|
      (i+1...size).each do |j|
        ans << [i,j] if self[i] + self[j] == target
      end
    end
    ans
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    ans = []
    self.each do |ele|
      if level != 0 && ele.is_a?(Array)
        ans += (level.nil? ? ele.my_flatten : ele.my_flatten(level-1))
      else
        ans << ele
      end
    end
    ans
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    ans = []
    (0...size-1).each do |i|
      (i+1...size).each do |j|
        ans << self[i..j] if self[i..j] == self[i..j].reverse
      end
    end
    ans
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  return nil if n == 0
  i = 2
  while n > 0
    n -= 1 if is_prime?(i)
    i += 1
  end
  i - 1
end

def is_prime?(num)
  return false if num < 2
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < size
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    i = 0
    ans = []
    while i < size
      ans << self[i] if prc.call(self[i])
      i += 1
    end
    ans
  end
end

