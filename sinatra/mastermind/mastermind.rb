require './game.rb'
require 'json'
require 'sinatra'
require 'sinatra/reloader' if development?

game = Game.new(1)
colorset = game.colorset
code = game.setCode()
round = 0
guessAndFeedback = Hash.new
isWinner = false
msg = "s"

get '/' do       
  guessCode = params['guessCode']
  gnfk = gnfv = [] 
  if !guessCode.nil? && !guessCode.empty? 
    if(guessCode.casecmp('restart') == 0 || round == 13 || isWinner)
      game = Game.new(1)
      colorset = game.colorset
      code = game.setCode()
      round = 0
      msg = "s"
      isWinner = false
      guessAndFeedback = Hash.new
    else    
      round += 1    
      guessCode = guessCode.split(",")      
      guessAndFeedback[guessCode] = game.verify(guessCode) 
      puts code            
      if (guessCode == code)
        isWinner = true         
        msg = "You won"
      elsif round == 12
        msg = "You lost"
      end
    end    
  end  
  gnfk = to_json guessAndFeedback.keys
  gnfv = to_json guessAndFeedback.values  
  erb :index, :locals => { :round => round, :code => code, :rbcolorset => colorset, :gnfk => gnfk, :gnfv => gnfv, :msg => msg}
end

def to_json string
  JSON.dump string
end

def from_json string
  data = JSON.load string
end