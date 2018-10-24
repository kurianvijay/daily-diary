require 'sinatra/base'
require './lib/entry'

class DailyDiaryApp < Sinatra::Base


  get '/' do
    @entries = Entry.all
    erb :entries_list
  end

  get '/new-entry' do
    @entry = Entry.new(id: nil, title: nil, body: nil)
    @action = '/insert-entry'
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

  get '/delete' do
    Entry.delete(params['id'])
    redirect '/'
  end

  get '/update-entry' do
    @entry = Entry.get(params['id'])
    @action = "/update?id=#{@entry.id}"
    erb :entry_form
  end

  post '/update' do
    @entry = Entry.update(id: params['id'], title: params['title'], body: params['body'])
    redirect "/read?id=#{@entry.id}"
  end

  post '/save-comment'do
    erb :entry_detail
  end

end
