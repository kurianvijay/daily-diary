require 'sinatra/base'
require './lib/entry'
require './lib/comment'
require './lib/tag'

class DailyDiaryApp < Sinatra::Base

  get '/' do
    @entries = Entry.all
    erb :entries_list
  end

  get '/new-entry' do
    @entry = Entry.new(id: nil, title: nil, body: nil)
    @header = 'New Entry'
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
    @header = 'Update Entry'
    erb :entry_form
  end

  post '/update' do
    @entry = Entry.update(id: params['id'], title: params['title'], body: params['body'])
    redirect "/read?id=#{@entry.id}"
  end

  post '/save-comment'do
    Comment.create(params['body'], params['entry_id'])
    redirect "/read?id=#{params['entry_id']}"
  end

  get '/create-tag' do
    # @tag = Tag.create(name: params['name'])
    @tag = Tag.new(id: nil, name: nil)
    @action = '/insert-tag'
    erb :tag_form
  end

  get '/tags' do
    @tags = Tag.all
    erb :tags_list
  end

  post '/insert-tag' do
    Tag.create(name: params['name'])
    redirect '/tags'
  end



end
