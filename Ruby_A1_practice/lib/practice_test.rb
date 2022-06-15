# Define a method `titleize(title)` that capitalizes each word in a string like 
# a book title.  First word in a title should always be capitalized.  Do not 
# capitalize words like 'a', 'and', 'of', 'over' or 'the'.

def titleize(title)
  exclude = ['a', 'and', 'of', 'over', 'the']
  words = title.split(" ")
  words[0] = words[0].downcase.capitalize
  (1...words.length).each do |i|
    words[i] = words[i].capitalize if !exclude.include?(words[i].downcase)
  end
  words.join(" ")
end

class String
  # Define a method `String#real_words_in_string(dictionary)` that returns an 
  # array of all the subwords of the string that appear in the dictionary 
  # argument. The method should NOT return any duplicates.

  def real_words_in_string(dictionary)
    ans = []
    (0...self.length - 1).each do |i|
      (i...self.length).each do |j|
        ans << self[i..j] if dictionary.include?(self[i..j]) && !ans.include?(self[i..j])
      end
    end
    ans
  end
end

class String
  # Define a method `String#symmetric_substrings` that returns an array of 
  # substrings that are palindromes.  Only include substrings of length > 1.

  # example: "cool".symmetric_substrings => ["oo"]

  def symmetric_substrings
    ans = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j|
        ans << self[i..j] if self[i..j] == self[i..j].reverse
      end
    end
    ans
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  ans = ''
  (0...string.length-1).each do |i|
    (i+1...string.length).each do |j|
      ans = string[i..j] if string[i..j] == string[i..j].reverse && (j-i+1) > ans.length
    end
  end
  if ans.length <= 2
    return false
  else
    return ans.length
  end
end

# Write a function `anagrams(str1, str2)` that takes in two words and returns a 
# boolean indicating whether or not the words are anagrams. Anagrams are words 
# that contain the same characters but not necessarily in the same order. Solve 
# this without using `Array#sort` or `Array#sort_by`.

def anagrams(str1, str2)
  str1.each_char do |c|
    return false if !str2.include?(c)
  end
  str2.each_char do |c|
    return false if !str1.include?(c)
  end
  return false if str1.length != str2.length
  true
end

# Write a method that takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).
# **Do NOT use `Array#sort` or `Array#sort_by`.**

# Example:
# `jumble_sort("hello")` => "ehllo"
# `jumble_sort("hello", ['o', 'l', 'h', 'e'])` => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a
  dic = Hash.new(0)
  str.each_char do |c|
    dic[c] += 1
  end
  ans = ''
  alphabet.each do |i|
    if dic.has_key?(i)
      ans += i * dic[i]
    end
  end
  ans
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use `Array#sort` or `Array#sort_by` in your implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return self if self.length < 2
    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
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
  # Define a method `Array#quick_sort` that implements the quick sort method. 
  # The method should be able to accept a block. **Do NOT use the built-in
  # `Array#sort` or `Array#sort_by` methods in your implementation.**

  def my_quick_sort(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return self if self.length < 2
    left = []
    right = []
    pivot = self[0]
    (1...self.length).each do |i|
      if prc.call(pivot, self[i]) == 1
        left << self[i]
      else
        right << self[i]
      end
    end
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end  
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in `Array#sort` or `Array#sort_by` methods in 
  # your implementation. 
  
  def bubble_sort(&prc)
    prc ||= Proc.new{|x, y| x <=> y}
    sorted = false
    arr = self.dup
    while !sorted
      sorted = true
      (0...arr.length-1).each do |i|
        if prc.call(arr[i], arr[i+1]) == 1
          arr[i], arr[i+1] = arr[i+1], arr[i]
          sorted = false
        end
      end
    end
    arr
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    
  end
end

class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**
  
  # NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
  # We will not give you points if you visit every element in the array every 
  # time you search.

  # For example, given the array [1, 2, 3, 4], you should NOT be checking
  # 1 first, then 2, then 3, then 4.
  def my_bsearch(target)
    return nil if self.length == 0
    mid = self.length / 2
    return mid if self[mid] == target
    if self[mid] > target
      return self[0...mid].my_bsearch(target)
    else
      rightidx = self[mid+1..-1].my_bsearch(target)
      rightidx.nil? ? nil : mid + 1 + rightidx
    end
  end
end

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  i = 0
  j = 0
  while i < string.length && j < key.length
    if string[i] == key[j]
      j += 1
    end
    i += 1
  end
  return j == key.length
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
# the resulting number. Keep repeating until there is only one digit in the 
# result, called the "digital root". **Do NOT use the built in `Integer#to_s`
# or `Integer#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num / 10 == 0
  ans = 0
  while num / 10 > 0
    ans += num % 10
    num = num / 10
  end
  ans += num
  digital_root(ans)
end

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.

def first_even_numbers_sum(n)
  return n if n == 0
  first_even_numbers_sum(n-1) + 2*n
end

# Define a method `rec_sum(nums)` that returns the sum of all elements in an 
# array recursively

def rec_sum(nums)
  return 0 if nums.empty?
  nums.first + rec_sum(nums.drop(1))
end

# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2
  fibs_sum(n-1) - fibs_sum(n-3) + fibs_sum(n-1)
end

# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  return 1 if n == 0
  if n > 0
    exponent(b,n-1) * b
  else
    exponent(b,n+1) * 1/(b.to_f)
  end
end

# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2
  factorials_rec(num - 1) + [factorials_rec(num - 1)[-1] * (num-1)]
end

# Using recursion and the `is_a?` method, write an `Array#deep_dup` method that 
# will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
  ans = []
  arr.each do |a|
    if a.is_a?(Array)
      ans << deep_dup(a)
    else
      ans << a
    end
  end
  ans

end

class Array
  # Define a method `Array#two_sum`, that finds all pairs of positions where the 
  # elements at those positions sum to zero. The method should return a nested 
  # array of positions.

  # Ordering matters. We want each of the pairs to be sorted smaller index 
  # before bigger index. We want the array of pairs to be sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    ans = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j|
        ans << [i,j] if self[i] + self[j] == 0
      end
    end
    ans
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def primes(num)
  return [] if num == 0
  return [2] if num == 1
  prev = primes(num-1)
  temp = prev[-1] + 1
  while !is_prime?(temp)
    temp += 1
  end
  prev + [temp]
end

def is_prime?(num)
  return false if num < 2
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

class Array
  # Write an `Array#median` method that returns the median element in an array.
  # If the length is even, return the average of the middle two elements.

  def median
    return nil if self.empty?
    sorted = self.sort
    return sorted[self.length / 2] if self.length % 2 != 0
    return (sorted[self.length / 2] + sorted[self.length / 2 - 1])/2.0
  end
end

class Hash
  # Write a `Hash#my_merge(other_hash)` method. This should NOT modify the 
  # original hash and return a combined version of both hashes.
  # **Do NOT use the built-in `Hash#merge` method in your implementation.**
  
  def my_merge(other_hash)
    ans = self.dup
    other_hash.each {|k,v| ans[k] = v}
    ans
  end
end

class Array
  # Write an `Array#my_reverse` method that reverses the order in which elements
  # appear within the array. **Do NOT use the built-in `Array#reverse` method
  # in your implementation.**
  
  def my_reverse
    ans = []
    size.times {ans << self.pop}
    ans
  end
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order.
  # e.g. [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dic = Hash.new {|h,k| h[k] = []}
    self.each_with_index {|n,i| dic[n] << i}
    dic.select {|k,v| v.length > 1}
  end
end

# Write a method that doubles each element in an array. Assume all elements of
# the array are integers.

def doubler(array)
  array.map {|i| i*2}
  
end

class Array
  # Define a method `Array#my_zip(*arrays)` that merges elements from the 
  # receiver with the corresponding elements from each provided argument. You 
  # CANNOT use Ruby's built-in `Array#zip` method

  # example => [1,2,3].my_zip([4,5,6], [7,8,9]) 
  # should return => [[1,4,7], [2,5,8], [3,6,9]]

  def my_zip(*arrays)
    ans = Array.new(self.length) {Array.new(0)}
    self.each_with_index {|ele, i| ans[i] << ele} 
    (0...size).each do |idx|
      arrays.each do |arr|
        ans[idx] << arr[idx]
      end
    end
    ans
  end
end

class Array
  # Write an `Array#my_flatten` method that akes a multi-dimentional array and 
  # returns a single array of all the elements.
  #
  # Example: `[1,[2,3], [4,[5]]].my_flatten` => [1,2,3,4,5]
  
  def my_flatten
    ans = []
    i = 0
    while i < size
      if !self[i].is_a?(Array)
        ans << self[i]
      else
        ans += self[i].my_flatten
      end
      i += 1
    end
    ans
  end

  # Write an `Array#my_controlled_flatten(n)` method that only flattens n levels 
  # of an array. For example, if you have an array with 3 levels of nested 
  # arrays, and run `arr.my_flatten(1)`, you should return an array with 1 
  # level of nested arrays flattened.
  #
  # Example: `[1,[2,3], [4,[5]]].my_controlled_flatten(1)` => [1,2,3,4,[5]]

  def my_controlled_flatten(n=nil)
    ans = []
    self.each do |ele|
      if n != 0 && ele.is_a?(Array)
        ans += (n.nil? ? ele.my_controlled_flatten : ele.my_controlled_flatten(n-1))
      else
        ans << ele
      end
    end
    ans

  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  return nil if num <= 0
  ans = []
  (1..num).each {|n| ans << n if num % n == 0}
  ans
end

class Array
  # Define a method `Array#my_rotate(positions)` that rotates the elements 
  # correctly based on the argument provided.  The work for positive and 
  # negative integer arguments.  You CANNOT use Ruby's `Array#rotate` or 
  # `Array#rotate!`.

  def my_rotate(positions=1)
    if positions > 0
      n = positions % size
      front = self.take(n)
      back = self.drop(n)
      return back + front
    else
      n = (-positions) % size
      front = self.take(size - n)
      back = self.drop(size - n)
      return back + front
    end
  end  
end

class Array
  # Write an `Array#my_join` method. If my_join receives no argument, then use
  # an empty string to join the array together.
  # **Do NOT use the built-in `Array#join` method in your implementation.**
  #
  # Examples.
  # `[1,2,3].my_join` => '123'
  # `[1,2,3].my_join('$')` => '1$2$3'

  def my_join(separator = "")
    ans = self.first.to_s
    i = 1
    while i < size
      ans += separator + self[i].to_s
      i += 1
    end
    ans
  end
end

class Array
  # Write an `Array#my_each_with_index(&prc)` method that calls a proc on each 
  # element with its index. **Do NOT use the built-in `Array#each`, `Array#map` 
  # or `Array#each_with_index` methods in your implementation.**

  def my_each_with_index(&prc)
    i = 0
    while i < size
      prc.call(self[i],i)
      i += 1
    end
    self

  end
end

class Hash
  # Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair.
  # **Do NOT use the built-in `Hash#each`, `Hash#map`, `Hash#each_with_index` 
  # methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < keys.length
      prc.call(keys[i],self[keys[i]])
      i += 1
    end
    self

  end
end

class Array
  # Write an `Array#my_any?(&prc)` method. This method should return true if any
  # of the Array elements satisfy the block, otherwise it should return false.

  # Examples: 
  # `[1,2,3].my_any? { |n| n.even? }` => true
  # `[1,3,5].my_any? { |n| n.even? }` => false

  def my_any?(&prc)
    self.each {|i| return true if prc.call(i)}
    false
  end
end

class Array
  # Define a method `Array#my_select(&prc)` that correctly returns an array of 
  # selected elements according to the block. **Do NOT use the built-in 
  # `Array#select` or `Array#reject` in your implementation.**

  def my_select(&prc)
    ans = []
    self.each {|i| ans << i if prc.call(i)}
    ans
  end  
end

class Array
  # Write an `Array#my_all?(&prc)` method. This method should return true if
  # every element in the array satisfies the block, otherwise return false.
  # **Do NOT use `Array#all?` in your implementation.**
  
  # Examples: 
  # `[1,2,3].my_all? { |n| n.even? }` => false
  # `[2,4,6].my_all? { |n| n.even? }` => true

  def my_all?(&prc)
    self.each {|i| return false if !prc.call(i)}
    true
  end
end

class Array
  # Write an `Array#my_reject(&prc)` method. This method should return a new 
  # array excluding all the elements in the original array that satisfy the proc.
  # **Do NOT use the built-in `Array#reject` or `Array#select` methods in your 
  # implementation.**
  
  # Example: `[1,2,3].my_reject {|n| n.even?}` => [1,3]

  def my_reject(&prc)
    ans = []
    self.each {|i| ans << i if !prc.call(i)}
    ans
  end
end

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if accumulator == nil
      accumulator = self[0] 
      (1...size).each do |i|
        accumulator = prc.call(accumulator,self[i])
      end
    else
      (0...size).each do |i|
        accumulator = prc.call(accumulator,self[i])
      end
    end
    accumulator
  end
end

