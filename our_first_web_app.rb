# encoding: utf-8
require 'sinatra'

get '/' do
  puts params
  'Hello, please add /my-name-is/[your name] to the browser url.'
end

get '/my-name-is/:name' do
  "Hello, #{params[:name]}!"
end

get '/:sender/send/:amount/:currency/to/:receiver' do
  amount = params[:amount].to_f
  if amount <= 0
    return "You need to specify a number more than 0!"
  end
  
  amount = sprintf( "%0.02f", amount)
   
  if params[:currency].downcase == 'usd'
    currency = '$'
  elsif params[:currency].downcase == 'eur'
    currency = '€'
  elsif params[:currency].downcase == 'rub'
    currency = '₱'
  elsif params[:currency].downcase == 'uah'
    currency = '₴'
  else
    currency = params[:currency]
  end
  
  "You, #{params[:sender]}, just sent #{currency}#{amount} to #{params[:receiver]}!"
end
