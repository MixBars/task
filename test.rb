# frozen_string_literal: true

require 'sinatra'
require 'ohm'
require 'json'
Ohm.redis = Redic.new('redis://127.0.0.1:6379')

post '/set' do
  request.body.rewind
  data = JSON.parse request.body.read
  status 201 if Ohm.redis.call 'SET', data['key'], data['value']
end

get '/get' do
  Ohm.redis.call 'GET', params[:key]
end
