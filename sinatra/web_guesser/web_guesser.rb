require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
message = "Guess the number"
get '/' do
    guess = params["guess"]
    cheat = params["cheat"]
    message = check_guess(guess)
    erb :index, :locals => {:number => SECRET_NUMBER, :message => cheat}
end

def check_guess guess
    g = guess.to_i
    if g > 100
        message = "Too High!"          
    elsif g <= 0
        message = "Too Low!\n"  
    elsif g == SECRET_NUMBER
        message = "You got it right!"    
    end
    return message
end