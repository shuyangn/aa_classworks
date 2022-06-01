def strange_sums(arr)
    count = 0
    arr.each_with_index do |n,i|
        j = i + 1
        while j < arr.length
            if n + arr[j] == 0
                count += 1
            end
            j += 1
        end
    end
    count
end

def pair_product(arr,prod)
    arr.each_with_index do |n,i|
        j = i + 1
        while j < arr.length
            if n * arr[j] == prod
                return true
            end
            j += 1
        end
    end
    false
end

def rampant_repeats(str,hash)
    ans = ""
    str.each_char do |c|
        if hash.has_key?(c)
            ans << c * hash[c]
        else
            ans << c
        end
    end
    ans
end

def perfect_square(num)
    i = 1
    while i <= num
        if i * i == num
            return true
        end
        i += 1
    end
    false
end
#def perfect_square(n)   easier way
#    (1..n).any? { |i| i * i == n }
#end

def anti_prime?(num)
    n = 1
    maxcount = 0
    while n < num            #get the max number of divisors of num smaller than target
        count = 0
        (1..n).each do |d|
            if n % d == 0
                count += 1
            end
        end
        if count > maxcount
            maxcount = count
        end
        n += 1
    end
    num_c = 0
    (1..num).each do |di|
        if num % di == 0
            num_c += 1
        end
    end
    if num_c > maxcount
        true
    else
        false
    end
end

def matrix_addition(matrix1,matrix2)
    r = matrix1.length
    c = matrix1[0].length
    ans = Array.new(r){Array.new(c)}
    (0...r).each do |i|
        (0...c).each do |j|
            ans[i][j] = matrix1[i][j] + matrix2[i][j]
        end
    end
    ans
end

def mutual_factors(*nums)
    ans = []
    nums.each do |n|
        temp = []
        (1..n).each do |d|
            if n % d == 0
                temp << d
            end
        end
        if ans.length > 0
            ans = ans & temp
        else
            ans = temp
        end
    end
    ans
end

def tribonacci_number(num)
    if num == 1
        return 1
    end
    if num == 2
        return 1
    end
    if num == 3
        return 2
    end
    seq = [1,1,2]
    l = 3
    while l < num
        seq << seq[l - 3] + seq[l - 2] + seq[l - 1]
        l += 1
    end
    seq[-1]
end

def matrix_addition_reloaded(*matrix)
    ans = []
    matrix.each do |m|
        if ans.length == 0
            ans = m
        else
            if m.size != ans.size
                return nil
            else
                (0...ans.length).each do |i|
                    (0...ans[0].length).each do |j|
                        ans[i][j] += m[i][j]
                    end
                end
            end
        end
    end
    ans
end

def squarocol?(matrix)
    nrow = matrix.length
    ncol = matrix[0].length
    (0...nrow).each do |i|
        (0...ncol).each do |j|
            if matrix[i][j] != matrix[i][0]
                break
            end
            if j == ncol - 1
                return true
            end
        end
    end
    (0...ncol).each do |j|
        (0...nrow).each do |i|
            if matrix[i][j] != matrix[0][j]
                break
            end
            if i == nrow - 1
                return true
            end
        end
    end
    false
end

def squaragonal?(matrix)
    if squarocol?(matrix)
        return true
    else
        nrow = matrix.length
        (0...nrow).each do |i|
            if matrix[i][i] != matrix[0][0]
                break
            end
            if i == nrow - 1
                return true
            end
        end
        (0...nrow).each do |i|
            if matrix[i][nrow-i-1] != matrix[0][nrow-1]
                break
            end
            if i == nrow - 1
                return true
            end
        end
    end
    false
end

def pascals_triangle(num)
    ans = []
    (1..num).each do |level|
        temp = Array.new(level)
        temp[0] = 1
        temp[-1] = 1
        i = 1
        while i < level-1 
            temp[i] = ans[-1][i-1] + ans[-1][i]
            i += 1
        end
        ans << temp
    end
    ans
end


def onelesspw2(num)
    (1..num).each do |n|
        if 2**n - 1 == num
            return true
        end
    end
    false
end
def prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end
def mersenne_prime(nth)
    seq = []
    i = 1
    while seq.length < nth
        if onelesspw2(i) and prime?(i)
            seq << i
        end
        i += 1
    end
    seq[-1]
end



def triangular_word?(str)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    dic = {}
    alphabet.each_char.with_index do |c,i|
        dic[c] = i + 1
    end
    str_sum = 0
    str.each_char do |c|
        str_sum += dic[c]
    end
    (1..str_sum).each do |i|
        if (i*(i+1))/2 == str_sum
            return true
        end
    end
    false
end

def consecutive_collapse(arr)
    pos = 0
    while pos < arr.length
        if pos + 1 < arr.length
            if arr[pos] == arr[pos+1] + 1 || arr[pos] == arr[pos+1] - 1
                arr.delete_at(pos+1)
                arr.delete_at(pos)
                if pos != 0   #如果当前删除位置之前还有数字，要考虑上一个数字会不会等于下一个
                    pos -= 1
                end
            else
                pos += 1
            end
        else
            pos += 1
        end
    end
    arr
end

def pretentious_primes(arr,nth)
    ans = arr.map do |num|
        if nth > 0
            count = 0
            temp = num
            while count < nth
                temp += 1
                if prime?(temp)
                    count += 1
                end
            end
        else     
            count = 0
            temp = num
            while count < -nth
                temp -= 1
                if temp < 2
                    temp = nil
                    break
                end
                if prime?(temp)
                    count += 1
                end
            end
        end
        temp
    end
    ans
end