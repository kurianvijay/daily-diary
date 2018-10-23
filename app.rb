require 'sinatra/base'
require './lib/entry'

class DailyDiaryApp < Sinatra::Base


  get '/' do
    @entries = Entry.all
    erb :entries
  end


  get '/entry' do
    erb :entry
  end

  post '/add-entry' do
    Entry.create(title: params['title'], body: params['body'])
    redirect '/'
  end

end
