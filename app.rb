require 'sinatra/base'
require './lib/entry'

class DailyDiaryApp < Sinatra::Base


  get '/' do
    @entries = Entry.all
    erb :entries_list
  end


  get '/new-entry' do
    erb :entry_form
  end

  post '/insert-entry' do
    Entry.create(title: params['title'], body: params['body'])
    redirect '/'
  end

  get '/read' do
    @entry = Entry.get(params['id'])
    erb :entry_detail
  end

end
