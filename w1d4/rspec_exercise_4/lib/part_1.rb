
def my_reject(arr,&prc)
    arr.select {|n| !prc.call(n)}
end


def my_one?(arr,&prc)
    arr.count(&prc) == 1
end


def hash_select(hash,&prc)
    hash.delete_if{|key,value| !prc.call(key,value)}
end



def xor_select(arr,prc1,prc2)
    arr.select {|i| (prc1.call(i)&&!prc2.call(i)) || (!prc1.call(i)&&prc2.call(i))}
end



def proc_count(val,arr)
    arr.count {|prc| prc.call(val)}
end