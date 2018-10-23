require 'sinatra/base'

class DailyDiaryApp < Sinatra::Base


  get '/' do
    erb :entries
  end


  get '/entry' do
    erb :entry
  end

  post '/add-entry' do
    # title = params['title']
    # body = params['body']
    # Diary.create(title: title, body: body)
    redirect '/'
  end

end
