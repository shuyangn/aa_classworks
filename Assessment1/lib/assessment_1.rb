# Define your methods here.
def string_map!(string,&prc)
    string.each_char.with_index {|c,i| string[i] = prc.call(c)}
    string
end

def three?(array,&prc)
    array.count {|a| prc.call(a)} == 3
end

def nand_select(array,prc1,prc2)
    array.select {|a| !(prc1.call(a) && prc2.call(a))}
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k,v|
        sum += v.sum
    end
    sum
end

def abbreviate(sentence)
    words = sentence.split(" ")
    ans = []
    words.each do |word|
        if word.length > 4
            temp = ""
            word.each_char do |c|
                if !"aeiouAEIOU".include?(c)
                    temp += c
                end
            end
            ans << temp
        else
            ans << word
        end
    end
    ans.join(" ")
end

def hash_selector(hash, *args)
    if args.empty?
        return hash
    end
    hash.select {|k,v| args.include?(k)}
end