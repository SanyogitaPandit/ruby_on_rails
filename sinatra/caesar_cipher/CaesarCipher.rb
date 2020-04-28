require 'sinatra'
require 'sinatra/reloader' if development?

def Caesar_Cipher(string, shiftFactor)

    return nil if string.nil?
    
	upCase = ('A'..'Z').to_a
	downCase = ('a'..'z').to_a
	
	encrypted = ""
          
        string.chars.map do |char|
            if(upCase.include?(char))
                encrypted += (((char.ord + shiftFactor - 65) % 26 ) + 65).chr
            elsif(downCase.include?(char))
                encrypted += (((char.ord + shiftFactor - 97) % 26) + 97).chr
            else
                encrypted += char
            end            
        end 
        
	encrypted
end

get '/' do
    str = params['str']
    shift = params['shift'].to_i    
    message = Caesar_Cipher(str, shift)
    erb :index, :locals => { :message => message }
end