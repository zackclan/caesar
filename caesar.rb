require 'sinatra'
require 'sinatra/reloader'
word = ''

get '/' do
    input = params["word"]
    shift = params["shift"].to_i
    if input != nil
        word = convertToNumbers(input,shift)
    end 

    erb :index, :locals => {:word => word}
end
def convertToNumbers(string, shift)
    numerals = ("a".."z").to_a
    arr = string.downcase.split('')
    new_array = []
    arr.each do |i|
        if (i =~ /[a-z]/)
            numValue = (numerals.index(i)+shift)
            if numValue < 27
                new_array.push(numerals[numValue])
            else numValue = numValue - 26
                new_array.push(numerals[numValue])
            end
        elsif (i =~ /[+]/)
            new_array.push(' ')
        else
            new_array.push(i)
        end    
    end
    word = new_array.join('')
end
