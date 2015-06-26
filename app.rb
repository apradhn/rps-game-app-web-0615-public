require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    # Your app code goes here
    @user_play = params["play"]
    game = RPSGame.new(@user_play.to_sym)
    @computer_play = game.computer_play
    if game.tied?
      @game_result = "Tie Game!"
    elsif game.won?
      @game_result = "You Win!"
    elsif game.lost?
      @game_result = "You Lose!"
    end
    erb :rps_game
  end
end
