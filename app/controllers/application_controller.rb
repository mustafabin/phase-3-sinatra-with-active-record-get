class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

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
    game = Game.find(params[:id])
    game.to_json
  end

  post '/create' do
    data = JSON.parse request.body.read
    newGame = Game.create(title: data['title'],genre: data['genre'], platform: data['platform'], price: data['price'])
    newGame.to_json
  end

  delete "/delete/:id" do
    game = Game.find(params[:id])
    game.destroy
    game.to_json
  end

  put "/update_price/:id" do
    data = JSON.parse request.body.read
    game = Game.find(params[:id])
    game.price = data['price']
    game.save
    game.to_json
  end
end
