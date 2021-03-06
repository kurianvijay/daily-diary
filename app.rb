require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './database_setup'
require './lib/entry'
require './lib/comment'
require './lib/tag'
require './lib/entry_tag'
require './lib/user'

class DailyDiaryApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @entries = Entry.all
    @tags = Tag.all
    @user = User.find(session[:user_id])
    erb :entries_list
  end

  get '/filter' do
    @entries = Entry.filter_by_tag(params['tag_id'])
    @tags = Tag.all
    erb :entries_list
  end

  get '/new-entry' do
    @entry = Entry.new(id: nil, title: nil, body: nil)
    @url = URI::encode("/new-entry")
    @header = 'New Entry'
    @action = '/insert-entry'
    @tags = Tag.all
    erb :entry_form
  end

  post '/insert-entry' do
    entry = Entry.create(title: params['title'], body: params['body'])
    tags = params.select{ |param| param.start_with?('tag') }.map{|z| z[1].to_i}
    EntryTag.update(entry.id, tags)
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
    @url = URI::encode("/update-entry?id=#{params['id']}")
    @action = "/update?id=#{@entry.id}"
    @header = 'Update Entry'
    @tags = Tag.all
    erb :entry_form
  end

  post '/update' do
    @entry = Entry.update(id: params['id'], title: params['title'], body: params['body'])
    tags = params.select{ |param| param.start_with?('tag') }.map{|z| z[1].to_i}
    EntryTag.update(@entry.id, tags)
    redirect "/read?id=#{@entry.id}"
  end

  post '/save-comment'do
    Comment.create(params['body'], params['entry_id'])
    redirect "/read?id=#{params['entry_id']}"
  end

  get '/create-tag' do
    @tag = Tag.new(id: nil, name: nil)
    params['redirect'].nil? ? redirect = URI::encode('/') : redirect = params['redirect']
    @action = "/insert-tag?redirect=#{redirect}"
    erb :tag_form
  end

  get '/tags' do
    @tags = Tag.all
    erb :tags_list
  end

  post '/insert-tag' do
    Tag.create(name: params['name'])
    redirect params['redirect']
  end

  get'/user_registration' do
    erb :user_registration
  end

  post '/register_user' do
    user = User.create(
      first_name: params['first_name'],
      last_name: params['last_name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/session/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/session/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

end
