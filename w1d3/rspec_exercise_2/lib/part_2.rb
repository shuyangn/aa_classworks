def palindrome?(str)
    left = 0
    right = str.length - 1
    while left < right
        if str[left] != str[right]
            return false
        end
        left += 1
        right -= 1
    end
    return true
end

def substrings(str)
    ans = []
    str.each_char.with_index do |c,i|
        j = i
        while j < str.length
            ans << str[i..j]
            j += 1
        end
    end
    ans
end

def palindrome_substrings(str)
    substr = substrings(str)
    substr.select {|s| palindrome?(s) && s.length > 1}
end
