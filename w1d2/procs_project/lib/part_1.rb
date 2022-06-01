def my_map(arr,&prc)
    ans = []
    arr.each do |s|
        ans << prc.call(s)
    end
    ans
end

def my_select(arr,&prc)
    ans = []
    arr.each do |n|
        if prc.call(n)
            ans << n
        end
    end
    ans
end

def my_count(arr,&prc)
    count = 0
    arr.each do |i|
        if prc.call(i)
            count += 1
        end
    end
    count
end

def my_any?(arr,&prc)
    arr.each do |i|
        if prc.call(i)
            return true
        end
    end
    false
end

def my_all?(arr,&prc)
    arr.each do |i|
        if !prc.call(i)
            return false
        end
    end
    true
end

def my_none?(arr,&prc)
    arr.each do |i|
        if prc.call(i)
            return false
        end
    end
    true
end