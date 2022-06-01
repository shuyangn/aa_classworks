
def proper_factors(num)
    (1...num).each.select {|n| num % n == 0}
end


def aliquot_sum(num)
    proper_factors(num).sum
end



def perfect_number?(num)
    num == aliquot_sum(num)
end


def ideal_numbers(n)
    ans = []
    i = 1
    while ans.length < n
        if perfect_number?(i)
            ans << i
        end
        i += 1
    end
    ans
end