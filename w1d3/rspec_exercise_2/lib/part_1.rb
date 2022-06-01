def partition(arr,num)
    ans = [[],[]]
    arr.each do |n|
        if n < num
            ans[0] << n
        else
            ans[1] << n
        end
    end
    ans
end

def merge(hash1,hash2)
    hash = {}
    hash1.each do |key,value|
        hash[key] = value
    end
    hash2.each do |key,value|
        hash[key] = value
    end
    hash
end

def censor(sen,arr)
    words = sen.split(" ")
    vowel = "aeiou"
    words.each_with_index do |w,i|   #for array, can also use map
        if arr.include?(w.downcase)
            w.each_char.with_index do |c,j|
                if vowel.include?(c.downcase)
                    w[j] = "*"
                end
            end
            words[i] = w
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    i = 0
    while 2**i <= num
        if 2**i == num
            return true
        end
        i += 1
    end
    return false
end
