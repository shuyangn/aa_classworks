
    def hipsterfy(word)
        vowel = "aeiou"
        (0..(word.length-1)).reverse_each do |i|
            if vowel.include?(word[i].downcase)
                word[i]=""
                return word
            end
        end
        word
    end

    def vowel_counts(string)
        ans = {}
        vowel = "aeiou"
        string.each_char do |c|
            c = c.downcase
            if vowel.include?(c)
                ans[c] = ans.fetch(c,0) + 1
            end
        end
        ans
    end

    def caesar_cipher(message,num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        (0...message.length).each do |i|
            if alphabet.include?(message[i])
                (0...alphabet.length).each do |j|
                    if alphabet[j] == message[i]
                        message[i] = alphabet[(j+num) % alphabet.length]
                        break
                    end
                end
            end
        end
        message
    end
