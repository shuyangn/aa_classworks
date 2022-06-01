
def element_count(arr)
    ans = {}
    arr.each do |i|
        ans[i] = ans.fetch(i,0) + 1
    end
    ans
end

def char_replace!(str,hash)
    str.each_char.with_index do |c,i|
        if hash.has_key?(c)
            str[i] = hash[c]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|m,n| m * n}
end
