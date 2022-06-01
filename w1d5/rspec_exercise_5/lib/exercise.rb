def zip(*arr)
    ans = []
    arr.each do |arr|
        if ans.length == 0
            arr.each_with_index do |item,i|
                ans << [item]
            end
        else
            arr.each_with_index do |item,i|
                ans[i] << item
            end
        end
    end
    ans
end
=begin
简便写法
def zip(*array)
    length = array.first.length
    (0...length).map do |i|
        array.map {|a| a[i]}
    end
end
=end



def prizz_proc(arr,prc1,prc2)
    arr.select {|i| (prc1.call(i)&&!prc2.call(i)) || (!prc1.call(i)&&prc2.call(i))}
end


def zany_zip(*arr)  #看怎么预留出长度  
    maxlen = arr.map(&:length).max
    (0...maxlen).map do |i|
        arr.map {|array| array[i]}
    end
end



def maximum(arr,&prc)
    ans = arr[0]
    arr.each do |item|
        ans = item if prc.call(item) >= prc.call(ans)
    end
    ans
end



def my_group_by(arr,&prc)
    hash = Hash.new {|h,k| h[k] = []}    #注意这一行！定义value全部为[]形式
    arr.each do |i|
        temp = prc.call(i)
        hash[temp] << i
    end
    hash
end




def max_tie_breaker(arr,prc1,&prc2)
    return nil if arr.empty?    #看这一行怎么判断empty
    ans = arr[0]
    val = prc2.call(ans)
    arr.each do |item|
        if prc2.call(item) > val
            val = prc2.call(item)
            ans = item
        end
        if prc2.call(item) == val && prc1.call(item) > prc1.call(ans)
            ans = item
        end
    end
    ans
end



def silly_syllables(sentence)
    words = sentence.split(" ")
    ans = words.map do |word|
        count = 0
        l = -1
        r = -1
        word.each_char.with_index do |c,i|
            if "aeiou".include?(c)
                count += 1
                if l == -1
                    l = i
                else
                    r = i
                end
            end
        end
        if count >= 2
            word[l..r]
        else
            word
        end
    end
    ans.join(" ")
end
            

