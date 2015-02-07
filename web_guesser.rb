require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM ||= rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)

  erb :index, :locals => {:secret_num => SECRET_NUM, :message => message }
end

def check_guess(guess)
  if guess > (SECRET_NUM + 5)
    message = "way too high"
  elsif guess > SECRET_NUM
    message = "too high"
  elsif guess < (SECRET_NUM - 5)
    message = "way too low"
  elsif guess < SECRET_NUM
    message = "too low"
  elsif guess ==SECRET_NUM
    message = "CORRECT! The secret number is #{SECRET_NUM}"
  end

end
