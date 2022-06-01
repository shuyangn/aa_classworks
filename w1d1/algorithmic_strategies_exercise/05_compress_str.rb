# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    prev = str[0]
    count = 1
    ans = ""
    (1...str.length).each do |i|
        if str[i] == prev
            count += 1
        else
            if count == 1
                ans += prev
            else
                ans = ans + count.to_s + prev
            end
            prev = str[i]
            count = 1
        end
    end
    if count != 1
        ans = ans + count.to_s + prev
    else
        ans += prev
    end
    ans
end
aaabbc
prev = c
count = 1
ans "" + 3 + a ="3a2b" + c



p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
