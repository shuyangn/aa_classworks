def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |d|
        if num % d == 0
            return false
        end
    end
    true
end

def nth_prime(n)
    count = 0
    i = 1
    while count < n
        i += 1
        if is_prime?(i)
            count += 1
        end
    end
    i
end

def prime_range(min,max)
    ans = (min..max).select {|n| is_prime?(n)}
end
