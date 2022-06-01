
    def average(num1,num2)
        (num1.to_f + num2.to_f) / 2              #integer / float
    end

    def average_array(array)
        array.sum / array.size.to_f              #int f
    end

    def repeat(string,num)
        ans = ""
        num.times do
            ans += string
        end
        ans
    end

    def yell(string)
        string.upcase + "!"
    end

    def alternating_case(sentence)
        words = sentence.split(" ")
        ans = []
        (0...words.length).each do |i|
            if i % 2 == 0
                ans << words[i].upcase
            else
                ans << words[i].downcase
            end
        end
        ans.join(" ")
    end
