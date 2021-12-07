# frozen_string_literal: true

require 'sinatra'
require 'ohm'
Ohm.redis = Redic.new('redis://127.0.0.1:6379')

post '/set' do
  status 201 if Ohm.redis.call 'SET', params[:key], params[:value]
end

get '/get' do
  Ohm.redis.call 'GET', params[:key]
end
