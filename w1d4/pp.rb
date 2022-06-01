def some?(arr,&prc)
    arr.any?(&prc)
end

def exactly?(arr,n,&prc)
    arr.count(&prc) == n
end

def filter_out(arr,&prc)
    arr.delete_if(&prc)
end

def at_least?(arr,n,&prc)
    arr.count(&prc) >= n
end

def every?(arr,&prc)
    arr.all?(&prc)
end

def at_most?(arr,n,&prc)
    arr.count(&prc) <= n
end

def first_index(arr,&prc)
    arr.each_with_index  do |a,i| 
        return i if prc.call(a)
    end
    nil
end

def xnor_select(arr,prc1,prc2)
    arr.select {|a| (prc1.call(a)&&prc2.call(a)) || (!prc1.call(a)&&!prc2.call(a))}
end


def filter_out!(arr,&prc)           
    arr.uniq.each do |el| 
        #arr.uniq 相当于copy了一份arr，不是arr的inplace change
        arr.delete(el) if prc.call(el) 

    end
end


arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []





def multi_map(arr,n=1,&prc)
    ans = []
    arr.each do |a| 
        n.times {a = prc.call(a)}
        ans << a
    end
    ans
end

def proctition(arr,&prc)
    part1 = []
    part2 = []
    arr.each do |a|
        if prc.call(a)
            part1 << a
        else
            part2 << a
        end
    end
    [part1,part2].flatten
end

def selected_map!(arr,prc1,prc2)
    arr.each_with_index do |a,i|
        if prc1.call(a)
            arr[i] = prc2.call(a)
        end
    end
    nil
end

def chain_map(val,arr)
    arr.each do |p|
        val = p.call(val)
    end
    val
end

def proc_suffix(s,hash)
    words = s.split(" ")
    res = []
    words.each do |word|
        trans = word
        hash.each do |key,value|
            trans = trans + value if key.call(word)
        end
        res << trans
    end
    res.join(" ")
end

def proctition_platinum(arr,*prc)
    hash = {}
    prc.each_with_index {|p,i| hash[i+1] = []}
    arr.each do |a|
        prc.each_with_index do |p,i|
            if p.call(a)
                hash[i+1] << a
                break
            end
        end
    end
    hash
end

def procipher(sentence,hash)
    words = sentence.split(" ")
    res = []
    words.each do |word|
        temp = word
        hash.each do |key,value|
            if key.call(word)
                temp = value.call(temp)
            end
        end
        res << temp
    end
    res.join(" ")
end

def picky_procipher(sentence,hash)
    words = sentence.split(" ")
    res = []
    words.each do |word|
        temp = word
        hash.each do |key,value|
            if key.call(word)
                temp = value.call(temp)
                break
            end
        end
        res << temp
    end
    res.join(" ")
end


