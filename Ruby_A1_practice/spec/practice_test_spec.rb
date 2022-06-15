gem 'rspec'
require 'practice_test'

describe "#titleize" do
  it "capitalizes a word" do
    expect(titleize("jaws")).to eq("Jaws")
  end

  it "capitalizes every word (aka title case)" do
    expect(titleize("david copperfield")).to eq("David Copperfield")
  end

  it "doesn't capitalize 'little words' in a title" do
    expect(titleize("war and peace")).to eq("War and Peace")
  end

  it "does capitalize 'little words' at the start of a title" do
    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
  end
end

describe "String#real_words_in_string" do
  it "finds a simple word" do
    words = "asdfcatqwer".real_words_in_string(["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find words not in the dictionary" do
    words = "batcabtarbrat".real_words_in_string(["cat", "car"])
    expect(words).to be_empty
  end

  it "finds words within words" do
    dictionary = ["bears", "ear", "a", "army"]
    words = "erbearsweatmyajs".real_words_in_string(dictionary)
    expect(words).to match_array(["bears", "ear", "a"])
  end
end

describe "String#symmetric_substrings" do
  it "handles a simple example" do
    expect("aba".symmetric_substrings).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect("aba1cdc".symmetric_substrings).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect("xabax".symmetric_substrings).to match_array(["aba", "xabax"])
  end

  it "handles no symmetrical substrings" do
    expect("abcd".symmetric_substrings).to match_array([])
  end
end

describe '#longest_palindrome' do
  it 'returns false if there is no palindrome longer than two letters' do
    expect(longest_palindrome("palindrome")).to eq(false)
  end

  it 'returns the correct length of the palindrome' do
    expect(longest_palindrome("181847117432")).to eq(6)
  end

  it 'returns the correct length for the longest palindrome in the string' do
    expect(longest_palindrome("noonminimum")).to eq(5)
  end
end

describe "#anagrams" do
  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "returns true if words are anagrams" do
    expect(anagrams('abc', 'cba')).to be true
  end

  it "returns false if words are not anagrams" do
    expect(anagrams('abc', 'aba')).to be false 
  end
  
  it "does not count words with same letters but varying lengths as anagrams" do
    expect(anagrams('abc', 'cbaa')).to be false
  end

  it "can handle large words with letters extremely scrambled" do
    expect(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxv')).to be true
    expect(anagrams('aiuwehfxzxcvmneowieurahsde', 'nsewceaerihfawzueouxdihmxw')).to be false
  end
end

describe "#jumble_sort" do
  before(:each) do 
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end

  it "works with an empty string" do
    expect(jumble_sort("")).to eq("")
  end

  it "works with a string of one item" do
    expect(jumble_sort("g")).to eq("g")
  end
end

describe "Array#merge_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq([1,2,3,4,5])
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end

  it "calls the merge helper method" do
    expect(Array).to receive(:merge).at_least(:once).and_call_original
    array.merge_sort
  end
end

describe "Array#my_quick_sort" do
  let(:array) { [1, 2, 3, 4, 5, 6, 7].shuffle }
  let(:sorted) { [1, 2, 3, 4, 5, 6, 7] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do 
    expect([].my_quick_sort).to eq([])
  end

  it "works with an array of one number" do 
    expect([5].my_quick_sort).to eq([5])
  end

  it "sorts numbers" do
    expect(array.my_quick_sort).to eq(sorted)
  end

  it "sorts arrays with duplicates" do
    expect([17,10,10,9,3,3,2].my_quick_sort).to eq([2,3,3,9,10,10,17])
  end

  it "will use block if given" do
    reversed = array.my_quick_sort do |num1, num2|
      num2 <=> num1
    end
    expect(reversed).to eq([7, 6, 5, 4, 3, 2, 1])
  end
end

describe "Array#bubble_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq([1, 2, 3, 4, 5])
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

describe 'Array#my_bsearch' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  disallowed_methods = [
    :index, :find_index, :include?, :member?, :dup
  ]

  before(:each) do
    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end
    expect_any_instance_of(Array).not_to receive(:index)
  end

  it "returns nil if the array is empty" do
    expect([].my_bsearch(11)).to be_nil
  end

  it "returns the index of a target" do
    expect(arr.my_bsearch(33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(arr.my_bsearch(22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(arr.my_bsearch(66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    # Properly returns nil searching left half
    expect(arr.my_bsearch(5)).to be_nil
    # Properly returns nil searching right half
    expect(arr.my_bsearch(80)).to be_nil
  end
end

describe "#string_include_key" do
  it "returns true for the same string" do
    expect(string_include_key?("adblfci", "abc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 1" do
    expect(string_include_key?("adbblfci", "abbc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 2" do
    expect(string_include_key?("adbclfci", "abbc")).to eq(false)
  end

  it "returns false if the key characters are in the wrong order" do
    expect(string_include_key?("dblfcia", "abc")).to eq(false)
  end

  it "returns false if the string doesn't contain the key" do
    expect(string_include_key?("db", "abc")).to eq(false)
  end
end

describe "#digital_root" do
  before(:each) do
    expect_any_instance_of(Integer).to_not receive(:to_s)
    expect_any_instance_of(Integer).to_not receive(:digits)
  end
  
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a multi-digit number" do
    expect(digital_root(125)).to eq(8)
  end
  
  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
  end
end

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.
describe '#first_even_numbers_sum' do
  it "returns the sum of the first even number" do
    expect(first_even_numbers_sum(1)).to eq(2)
  end

  it "returns the sum of the first n even numbers" do
    expect(first_even_numbers_sum(6)).to eq(42)
  end

  it "calls itself recursively" do
    expect(self).to receive(:first_even_numbers_sum).at_least(:twice).and_call_original
    first_even_numbers_sum(6)
  end
end

describe "#rec_sum" do
  it "returns the sum of all elements in an array" do
    arr = [1,2,3,4]
    expect(rec_sum(arr)).to eq(10)
  end

  it "returns the sum of all elements in an array" do
    expect(rec_sum([-6, 6, 5, 4])).to eq(9)
  end
  
  it "returns 0 if the array is empty" do
    expect(rec_sum([])).to eq(0)
  end

  it "calls itself recursively" do
    expect(self).to receive(:rec_sum).exactly(4).times.and_call_original
    rec_sum([1,2,3])
  end
end

describe '#fibs_sum' do
  it 'returns the sum of the first fibonacci number' do
    expect(fibs_sum(1)).to eq(1)
  end

  it 'returns the sum of the first 2 fibonacci numbers' do
    expect(fibs_sum(2)).to eq(2)
  end

  it 'returns the sum of the first 6 fibonacci numbers' do
    expect(fibs_sum(6)).to eq(20)
  end

  it "calls itself recursively" do 
    expect(self).to receive(:fibs_sum).at_least(:twice).and_call_original
    fibs_sum(6)
  end
end

describe "#exponent" do
  it "returns the correct answer for positive exponents" do
    expect(exponent(5,3)).to eq(125)
  end

  it "returns the correct answer for negative exponents" do
    expect(exponent(2, -3)).to eq(1/8.0)
  end

  it "returns the correct answer when n is 0" do
    expect(exponent(2, 0)).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:exponent).at_least(:twice).and_call_original
    exponent(2, 3)
  end
end

describe "#factorials_rec" do
  it "returns first factorial number" do
    expect(factorials_rec(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials_rec(2)).to eq([1, 1])
  end

  it "returns many factorials numbers" do
    expect(factorials_rec(6)).to eq([1, 1, 2, 6, 24, 120])
  end

  it "calls itself recursively" do
    expect(self).to receive(:factorials_rec).at_least(:twice).and_call_original
    factorials_rec(6)
  end
end

describe "#deep_dup" do
  subject(:robot_parts) do [
      ["nuts", "bolts", "washers"],
      ["capacitors", "resistors", "inductors"]
    ]
  end
  let(:copy) { deep_dup(robot_parts) }

  it "makes a copy of the original array" do
    expect(copy).to eq(robot_parts)
    expect(copy).not_to be(robot_parts)
  end

  it "deeply copies arrays" do
    expect(copy[0]).to eq(robot_parts[0])
    expect(copy[0]).not_to be(robot_parts[0])

    copy[1] << "LEDs"
    expect(robot_parts[1]).to eq(["capacitors", "resistors", "inductors"])
  end
end

describe "Array#two_sum" do
  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].two_sum).to eq([[0, 3]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq([])
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq([[0, 3]])
  end
end

describe "#primes" do
  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "Array#median" do
  let(:even_array) { [3, 2, 6, 7] }
  let(:odd_array) { [3, 2, 6, 7, 1] }

  it "returns nil for the empty array" do
    expect([].median).to be_nil
  end

  it "returns the element for an array of length 1" do
    expect([1].median).to eq(1)
  end

  it "returns the median of an odd-length array" do
    expect(odd_array.median).to eq(3)
  end

  it "returns the median of an even-length array" do
    expect(even_array.median).to eq(4.5)
  end
end

describe "Hash#my_merge" do
  let(:hash1) { {a: 1, b: 2, c: 3} }
  let(:hash2) { {d: 4, e: 5} }
  let(:hash3) { {c: 33, d: 4, e: 5} }

  before(:each) do
    expect(hash1).not_to receive(:merge)
    expect(hash1).not_to receive(:merge!)
  end

  it "merges 2 hashes and returns a hash" do
    expect(hash1.my_merge(hash2)).to eq({ a: 1, b: 2, c: 3, d: 4, e: 5 })
  end

  it "prioritizes values from the hash being merged in" do
    expect(hash1.my_merge(hash3)).to eq({ a: 1, b: 2, c: 33, d: 4, e: 5 })
  end
end

describe "Array#my_reverse" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:reverse!)
    expect(array).not_to receive(:reverse)
    expect(array).not_to receive(:dup)
    expect(array).not_to receive(:slice)
    expect(array).not_to receive(:slice!)
  end

  it "reverses an array" do
    expect(array.my_reverse).to eq(["d", "c", "b", "a"])
  end

  it "works on an array of length one" do 
    expect([1].my_reverse).to eq([1])
  end

  it "works on an empty array" do 
    expect([].my_reverse).to eq([])
  end
end

describe "Array#dups" do
  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "#doubler" do
  subject(:array) { [1, 2, 3] }

  it "doubles the elements of the array" do
    expect(doubler(array)).to eq([2, 4, 6])
  end

  it "does not modify the original array" do
    duped_array = array.dup
    doubler(array)
    
    expect(array).to eq(duped_array)
  end
end

describe "Array#my_zip" do
  let(:arr1) { [ 4, 5, 6 ] }
  let(:arr2) { [ 7, 8, 9 ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:zip)
  end 

  it "Zips arrays of the same size" do
    expect([1, 2, 3].my_zip(arr1, arr2)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "Zips arrays of differnet sizes and adds nil appropriately" do
    expect(arr1.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
  end

  let(:arr3) { [10, 11, 12] }
  let(:arr4) { [13, 14, 15] }

  it "Zips arrays with more elements than the original" do
    expect([1, 2].my_zip(arr1, arr2, arr3, arr4)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
    expect([].my_zip(arr1, arr2, arr3, arr4)).to eq([])
  end
end

describe "Array#my_flatten" do
  let(:arr) { [1, 2, 3, [4, [5, 6]], [[[7]], 8]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it 'flattens arrays correctly' do
    expect(arr.my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'works on one dimensional arrays' do
    expect([1,2,3,4,5].my_flatten).to eq([1,2,3,4,5])
  end
end

describe "Array#my_controlled_flatten" do
  let(:arr) { [1,[2,3], [4,[5]], [[6,[7]]]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it "flattens an array the specified number of levels" do
    expect(arr.my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end

  it "returns a one dimensional array when invoked without an argument" do
    expect(arr.my_controlled_flatten).to eq([1, 2, 3, 4, 5, 6, 7])
  end

  it "works on one dimensional arrays" do
    expect([1,2,3,4,5].my_controlled_flatten).to eq([1,2,3,4,5])
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end

  it "returns nil for numbers less than zero" do
    expect(factors(-5)).to eq(nil)
  end

  it "returns [1] when finding factors of 1" do
    expect(factors(1)).to eq([1])
  end
end

describe "Array#my_rotate" do
  let(:arr) {[ "a", "b", "c", "d" ]}

  before (:each) do
    expect_any_instance_of(Array).not_to receive(:rotate)
    expect_any_instance_of(Array).not_to receive(:rotate!)
  end
  
  it "Rotates the elements 1 position if no argument is passed in" do
    expect(arr.my_rotate).to eq(["b", "c", "d", "a"])
  end
  
  it "Rotates the elements correctly if an argument is passed in" do
    expect(arr.my_rotate(2)).to eq(["c", "d", "a", "b"])
  end

  it "Rotates the elements correctly if a negative argument is passed in" do
    expect(arr.my_rotate(-3)).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly for a large argument" do
    expect(arr.my_rotate(15)).to eq(["d", "a", "b", "c"])
  end
end

describe "Array#my_join" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:join)
  end

  it "joins an array if no argument is passed" do
    expect(array.my_join).to eq("abcd")
  end

  it "joins an array if an argument is passed" do
    expect(array.my_join("$")).to eq("a$b$c$d")
  end
end

describe "Array#my_each_with_index" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }

  before(:each) do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:map)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:each_with_index)
    expect_any_instance_of(Array).not_to receive(:map!)
  end

  it "works for blocks that use both the index and element" do
    arr.my_each_with_index { |el, i| res << 2 * el + i }
    expect(res).to eq([2,5,8])
  end

  it "does not modify the original array" do 
    arr.my_each_with_index { |el, i| res << el * 2 + i }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each_with_index { |el, i| el + i } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each_with_index do |el, i|
      res << el * 2 + i 
    end.my_each_with_index do |el, i|
      res << el * 2 + i 
    end

    expect(res).to eq([2,5,8,2,5,8])
  end
end

describe "Hash#my_each" do
  let(:a) { {"a"=> 1, "b" => 2, "c" => 3} }
  let(:res) { Array.new }

  before(:each) do
    expect(a).not_to receive(:each)
    expect(a).not_to receive(:dup)
    expect(a).not_to receive(:slice)
    expect_any_instance_of(Hash).not_to receive(:each_with_index)
    expect_any_instance_of(Hash).not_to receive(:map)
    expect_any_instance_of(Hash).not_to receive(:map!)
  end

  it "should call the proc on each key value pair" do
    a.my_each{ |key, v| v.times{res << key} }
    expect(res.sort).to eq(["a","b","b","c","c","c"])
  end

  it "should not modify the hash" do 
    a.my_each { |key, v| v.times { res << key } }
    expect(a).to eq({ "a"=> 1, "b" => 2, "c" => 3 })
  end

  it "should return the original hash" do 
    expect(a.my_each{ |key, v| v.times { res << key } }).to eq(a)
  end

  it "should be chainable" do 
    a.my_each do |k,v|
      v.times { res << k }
    end.my_each do |k,v|
      v.times { res << k }
    end
    expect(res).to eq(["a","b","b","c","c","c","a","b","b","c","c","c"])
  end 
end

describe 'Array#my_any' do
  let(:arr) { [1,2,3] }

  before(:each) do
    expect(arr).not_to receive(:any?)
    expect(arr).not_to receive(:dup)
  end

  it "returns true if any number matches the block" do
    expect(arr.my_any? { |num| num > 2 }).to eq(true)
  end

  it "returns false if no elementes match the block" do
    expect(arr.my_any? { |num| num == 4 }).to eq(false)
  end
end

describe "Array#my_select" do
  let(:arr) { [1, 2, 3] }

  before(:each) do
    expect(arr).not_to receive(:select)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:select!)
    expect_any_instance_of(Array).not_to receive(:reject)
    expect_any_instance_of(Array).not_to receive(:reject!)
  end

  it "It correctly selects elements according to the passed in block" do
    expect(arr.my_select { |num| num > 1 }).to eq([2, 3])
  end

  it "It returns an empty array if there are no matches" do
    expect(arr.my_select { |num| num == 4 }).to eq([])
  end
end

describe 'Array#my_all' do
  let(:arr) { [1,2,3] }
  
  before(:each) do
    expect(arr).not_to receive(:all?)
    expect(arr).not_to receive(:dup)
  end

  it "returns true if all elements match the block" do
    expect(arr.my_all? { |num| num > 0 }).to eq(true)
  end

  it "returns false if not all elements match the block" do
    expect(arr.my_all? { |num| num > 1 }).to eq(false)
  end
end

describe 'Array#my_reject' do
  let(:arr) { [1, 2, 3] }

  before(:each) do
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:select)
    expect_any_instance_of(Array).not_to receive(:reject)
    expect_any_instance_of(Array).not_to receive(:reject!)
    expect_any_instance_of(Array).not_to receive(:select!)
  end

  it 'It correctly selects elements that do not match the passed in block' do
    expect(arr.my_reject { |num| num > 1 }).to eq([1])
  end

  it 'It returns all elements if no elements match the block' do
    expect(arr.my_reject { |num| num == 4 }).to eq([1,2,3])
  end
end

describe "Array#my_each" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }

  before(:each) do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:map)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:each_with_index)
    expect_any_instance_of(Array).not_to receive(:map!)
  end

  it "works for blocks" do
    arr.my_each { |el| res << 2 * el }
    expect(res).to eq([2,4,6])
  end

  it "does not modify original array" do 
    arr.my_each { |el| res << 2 * el }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each { |el| el } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each do |el| 
      res << 2 * el
    end.my_each do |el|
      res << 3 * el 
    end

    expect(res).to eq([2,4,6,3,6,9])
  end
end

describe 'Array#my_inject' do
  let(:arr) { [1, 2, 3] }
  
  before(:each) do
    expect_any_instance_of(Array).not_to receive(:inject)
    expect_any_instance_of(Array).not_to receive(:reduce)
  end

  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_inject(:dummy, &block)
    end.to yield_control.once
  end

  it 'makes the first element the accumulator if no default is given' do
    expect do |block|
      ["el1", "el2", "el3"].my_inject(&block)
    end.to yield_successive_args(["el1", "el2"], [nil, "el3"])
  end

  it 'yields the accumulator and each element to the block' do
    expect do |block|
      [1, 2, 3].my_inject(100, &block)
    end.to yield_successive_args([100, 1], [nil, 2], [nil, 3])
  end

  it 'with accumulator, it correctly injects and returns answer' do
    expect([1, 2, 3].my_inject(1) { |acc, x| acc + x }).to eq(7)
    expect([3, 3].my_inject(3) { |acc, x| acc * x }).to eq(27)
  end

  it 'without accumulator, it correctly injects and returns answer' do
    expect([1, 2, 3].my_inject { |acc, x| acc + x }).to eq(6)
    expect([3, 3].my_inject { |acc, x| acc * x }).to eq(9)
  end
end

