class ApplicationController < Sinatra::Base

  get '/' do
    {message: "This is the root route try another route ex: '/all' '/one/:id' '/first'"}.to_json
  end
  get '/first' do
    game = Game.first
    game.to_json
  end
  get '/all' do
    games = Game.all
    games.to_json
  end
  get '/one/:id' do
    games = Game.find(params[:id])
    games.to_json
  end

  post '/create' do
    data = JSON.parse request.body.read
    newGame = Game.create(title: data['title'],genre: data['genre'], platform: data['platform'], price: data['price'])
    newGame.to_json
  end

end
