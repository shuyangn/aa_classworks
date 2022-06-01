# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.length.to_f
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        len = self.length
        if len % 2 == 0         #也可以写成self.length.odd?
            (sorted[len / 2] + sorted[len / 2 - 1]) / 2.0
        else
            sorted[self.length / 2]
        end
    end

    def counts
        hash = Hash.new{0}
        self.each do |i|
            hash[i] += 1
        end
        hash
    end

    def my_count(value)
        count = 0
        self.each {|i| count += 1 if i == value}
        count
    end
    
    def my_index(value)
        self.each_with_index do |a, idx|
            if a == value
                return idx
            end
        end
        return nil
    end

    def my_uniq
        uniq = []
        self.each do |i|
            if !uniq.include?(i)
                uniq << i
            end
        end
        uniq
    end

    def my_transpose
        ans = []
        self.each.with_index do |m, i|
            row = []
            self.each.with_index do |n, j|
                row << self[j][i]
            end
            ans << row
        end
        ans
    end

end
