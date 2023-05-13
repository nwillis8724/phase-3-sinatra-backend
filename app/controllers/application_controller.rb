class ApplicationController < Sinatra::Base
  require 'pry'
  set :default_content_type, 'application/json'

  get '/developers' do
    developers = Developer.includes(:games)
    developers.to_json(include: :games)
  end

  post '/developers' do
    developer = Developer.create(
      developer: params[:developer]
    )
    developer.to_json
  end


  get '/games' do
    games = Game.includes(:developer)
    games.to_json(include: :developer)
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end

  post '/games' do
    developer = Developer.find_or_create_by(developer: params[:developer])
    game = Game.create(
      name: params[:name],
      genre: params[:genre],
      developer_id: developer.id,
      price: params[:price]
    )
    game.developer = developer
    game.to_json
  end

  patch '/games' do
    game = Game.find_by(name: params[:name])
    developer = Developer.find_by(developer: params[:developer_name])
    game.update(
      name: params[:name],
      genre: params[:genre],
      developer_id: developer.id,
      price: params[:price]
    )
  end

  delete '/games/:id' do
    game = Game.find(params[:id])
    if game
      game.destroy
      { message: 'Game successfully deleted' }.to_json
    else
      { error: 'Game not found' }.to_json
    end
  end

end
