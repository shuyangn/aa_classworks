def duos(str)
    count = 0
    (0...str.length-1).each do |i|
        if str[i] == str[i+1]
            count += 1
        end
    end
    count
end

def sentence_swap(sentence,hash)
    words = sentence.split(" ")
    alt = words.map do |word| 
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    alt.join(" ")
end

def hash_mapped(hash,prc1,&prc2)
    new_hash = {} 
    hash.map do |k,h|
        new_hash[prc2.call(k)] = prc1.call(h)
    end
    new_hash
end

def counted_characters(str)
    hash = Hash.new(0)   #类似于hash.fetch(key,0)
    str.each_char do |c|
        hash[c] += 1
    end
    hash
        .select {|k,v| v > 2}
        .keys
end

def triplet_true(str)
    count = 0
    (0...str.length-2).each do |i|
        if str[i] == str[i+1] && str[i+1] == str[i+2]
            count += 1
        end
    end
    count > 0
end

def energetic_encoding(str,hash)
    words = str.split(" ")
    new = words.map do |word|
        temp = ""
        word.each_char do |c|
            if hash.has_key?(c)
                temp << hash[c]
            else
                temp << "?"
            end
        end
        temp
    end
    new.join(" ")
end

def uncompress(str)
    ans = ""
    (0...str.length).step(2).each do |i|
        str[i+1].to_i.times {ans << str[i]}
    end
    ans
end

def conjunct_select(array,*prcs)
    new = []
    i= 0
    while i < array.length
        allpass = true
        prcs.each do |prc|
            if !prc.call(array[i])
                allpass = false
                break
            end
        end
        if allpass == true
            new << array[i]
        end
        i += 1
    end
    new
end
def conjunct_select(array,*prcs)    #简便版
    array.select {|arr| prcs.all? {|prc| prc.call(arr)}}
end

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    ans = []
    ans = words.map do |word|
        if word.length < 3
            word
        else
            if "aeiou".include?(word[0].downcase)
                word + "yay"
            else
                i = -1
                word.each_char.with_index do |c,idx|
                    if "aeiou".include?(c.downcase)
                        i = idx
                        break
                    end
                end
                if i != -1
                    word[i...word.length] + word[0...i] + "ay"
                else
                    word
                end
            end
        end
    end
    ans.join(" ").capitalize
end

def reverberate(sentence)
    words = sentence.split(" ")
    ans = []
    ans = words.map do |word|
        if word.length < 3
            word
        else
            if "aeiou".include?(word[-1].downcase)
                word + word
            else
                i = -1
                (0...word.length).reverse_each do |idx|
                    if "aeiou".include?(word[idx].downcase)
                        i = idx
                        break
                    end
                end
                if i != -1
                    word + word[i...word.length] 
                else
                    word
                end
            end
        end
    end
    ans[0] = ans[0].capitalize
    ans.join(" ")
end

def disjunct_select(array,*prcs)
    array.select {|arr| prcs.any?{|prc| prc.call(arr)}}
end

def alternating_vowel(sentence)
    words = sentence.split(" ")
    new = []
    words.each_with_index do |word,i|
        if i % 2 == 0
            word.each_char.with_index do |c,j|
                if "aeiouAEIOU".include?(c)
                    word = word[0...j] + word[j+1...word.length]
                    break
                end
            end
            new << word
        else
            (0...word.length).reverse_each do |j|
                if "aeiouAEIOU".include?(word[j])
                    word = word[0...j] + word[j+1...word.length]
                    break
                end
            end
            new << word
        end
    end
    new.join(" ")
end

def silly_talk(sentence)
    words = sentence.split(" ")
    new = words.map do |word|
        if "aeiouAEIOU".include?(word[-1])
            word + word[-1]
        else
            temp = ""
            word.each_char do |c|
                if "aeiouAEIOU".include?(c)
                    temp += c + "b" + c.downcase
                else
                    temp += c
                end
            end
            temp
        end
    end
    new[0] = new[0].capitalize
    new.join(" ")
end

def compress(string)
    ans = ""
    prev = ""
    count = 0
    string.each_char.with_index do |c,i|
        if i == 0
            if string.length <= 1
                ans = c
            else
                prev = c
                count = 1
            end
            next
        end
        if prev == c
            count += 1
            if i == string.length - 1
                ans += (count > 1 ? c + count.to_s : c)
            end
        else
            ans += (count > 1 ? prev + count.to_s : prev)
            prev = c
            count = 1
            if i == string.length - 1
                ans += c
            end
        end
    end
    ans
end

def compress(string)            #清晰逻辑版
    compressed = ''
    i = 0
    while i < string.length
        char = string[i]
        count = 1
        i += 1
        while char == string[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end
    compressed
end
