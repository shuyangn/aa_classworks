=begin
My Each
Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:
=end

class Array
    def my_each(&blk)
        i = 0

        while i < self.length
            blk.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&blk)
        new_array = []
    
        self.my_each do |ele|
            new_array << ele if blk.call(ele)
        end
        # new_array << self.my_each(&blk) if blk.call(self)
        new_array
    end

    def my_reject(&blk)
        new_array = []

        self.my_each do |ele|
            new_array << ele if !blk.call(ele)
        end

        new_array
    end


    def my_any?(&blk)
        self.my_each do |ele|
            return true if blk.call(ele)
        end
        false
    end

    def my_all?(&blk)
        self.my_each do |ele|
            return false if !blk.call(ele)
        end
        true
    end

    def my_flatten
        new_array = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                new_array += ele.my_flatten
            else
                new_array << ele
            end
        end
        new_array
    end

    def my_zip(*args)
        new_array = Array.new(self.length){Array.new(args.length + 1)}

        self.each_with_index do |ele, i|
            new_array[i][0] = self[i]
            (0...args.length).each do |j|
                new_array[i][j + 1] = args[j][i]
            end
        end

        new_array
    end
    
    def my_rotate(n = 1)
        new_array = self
        if n >= 0
            n.times do 
                new_array.push(new_array[0]).shift
            end
        else
            (-n).times do
                new_array.unshift(new_array[-1]).pop
            end
        end
        new_array
    end

    def my_join(args = "")
        result = ""

        self.each do |ele|
            result += args + ele
        end

        result
    end

    def my_reverse
        new_array = []
        i = self.length - 1
        while i >= 0
            new_array << self[i]
            i -= 1
        end
        new_array
    end
    
    def bubble_sort!
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |n, i|
                if self[i] > self[i+1]
                    self[i], self[i+1] = self[i+1],self[i]
                    sorted = false
                end
            end
        end
        return self
    end

end

# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
    (1..num).select {|n| num % n == 0 }
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending