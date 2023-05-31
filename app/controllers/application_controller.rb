class ApplicationController < Sinatra::Base
  require 'pry'
  set :default_content_type, 'application/json'

  get '/developers' do
    developers = Developer.includes(:games)
    developers.to_json(include: :games)
  end

  get '/developers/:id' do
    developers = Developer.find(params[:id])
    developers.to_json(include: :games)
  end

  post '/developers' do
    developer = Developer.create(
      developer: params[:developer]
    )
    developer.to_json(include: :games)
  end

  delete '/developers/:id' do
    dev = Developer.find(params[:id])
    if dev
      dev.destroy
      { message: 'Dev successfully deleted' }.to_json
    else
      { error: 'Dev not found' }.to_json
    end
  end 


  get '/games' do
    games = Game.includes(:developer)
    games.to_json(include: :developer)
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(include: :developer)
  end

  post '/games' do
    developer = Developer.find_or_create_by(developer: params[:developer])
    game = developer.games.create(
      name: params[:name],
      genre: params[:genre],
      
      price: params[:price]
    )
    game.to_json(include: :developer)
  end

  patch '/games/:id' do
    game = Game.find(params[:id])
    developer = Developer.find_or_create_by(developer: params[:developer])

    game.update(
      name: params[:name],
      genre: params[:genre],
      developer_id: developer.id,
      price: params[:price]
    )
    # binding.pry
    game.to_json(include: :developer)
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
