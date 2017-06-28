require 'pry'

require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name].reverse
    "#{@name}"
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num * @num}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase] * @num.to_i
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do

    @par = params.values.inject {|word1, word2| word1 + " " + word2} + "."
  end

  get '/:operation/:number1/:number2' do
    @op = params[:operation].downcase
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    case @op
    when "add"
      (@num1 + @num2).to_s
    when "subtract"
      "#{@num1 - @num2}"
    when "divide"
      "#{@num1 / @num2}"
    when "multiply"
      "#{@num1 * @num2}"
    else
      break
    end
  end


end
