def reverser(str,&prc)
    ans = ""
    ans << prc.call(str.reverse)
end

def word_changer(str,&prc)
    ans = []
    words = str.split(" ")
    words.each do |w|
        ans << prc.call(w)
    end
    ans.join(" ")
end

def greater_proc_value(num,prc1,prc2)
    ans1 = prc1.call(num)
    ans2 = prc2.call(num)
    [ans1,ans2].max
end

def and_selector(arr,prc1,prc2)
    ans = []
    arr.each do |n|
        if prc1.call(n) && prc2.call(n)
            ans << n
        end
    end
    ans
end

def alternating_mapper(arr,prc1,prc2)
    ans = []
    arr.each_with_index do |a,idx|
        if idx % 2 == 0
            ans << prc1.call(a)
        else
            ans << prc2.call(a)
        end
    end
    ans
end
