def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|a| a.sum > 0}
end

def aba_translate(str)
    vowel = "aeiou"
    ans = ""
    str.each_char do |c|
        if vowel.include?(c)
            ans << c + "b" + c
        else
            ans << c
        end
    end
    ans
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end