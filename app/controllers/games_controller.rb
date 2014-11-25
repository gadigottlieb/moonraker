class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @players = @game.players
    @players.each do |player|
      @player = player
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

end
