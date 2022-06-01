# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    if num < 2
        return nil
    end

    (2..num).reverse_each do |i|
        if num % i == 0 && prime?(i)
            return i
        end
    end
    return nil
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

def unique_chars?(str)
    app = ""
    str.each_char do |c|
        if app.include?(c)
            return false
        else
            app += c
        end
    end
    true
end

def dupe_indices(arr)
    ans = {}
    (0...arr.length).each do |i|
        c = arr[i]
        ans[c] = ans.fetch(c,[]).to_a.append(i)
    end
    ans.select {|key,value| value.length >= 2}
end

def ana_array(arr1,arr2)
    (0...arr1.length).each do |i|
        if !arr2.include?(arr1[i])
            return false
        end
    end
    (0...arr2.length).each do |i|
        if !arr1.include?(arr2[i])
            return false
        end
    end
    true
end