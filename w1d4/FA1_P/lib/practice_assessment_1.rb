# Define your methods here. 

def first_letter_vowel_count(str)
    words = str.split(" ")
    words.count {|word| "aeiou".include?(word[0].downcase)}
end

def count_true(arr,prc)
    arr.count {|n| prc.call(n)}
end

def procformation(arr,prc1,prc2,prc3)
    ans = arr.map do |n|
        if prc1.call(n)
            prc2.call(n)
        else
            prc3.call(n)
        end
    end
    ans
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(str)
    words = str.split(" ")
    ans = words.map do |word|
        if "aeiou".include?(word[0].downcase) || "aeiou".include?(word[-1].downcase)
            word
        else
            word.reverse
        end
    end
    ans.join(" ")
end

def hash_missing_keys(hash,*args)
    ans = args.select {|arg| !hash.has_key?(arg)}
    ans
end