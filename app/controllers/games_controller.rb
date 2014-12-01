class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @players = @game.players
    @players.each do |player|
      @player = player
    end
  end

  def new
    @season = Season.find(params[:season_id])
    @game = Game.new(season: @season)
  end

  def create
    @season = Season.find(params[:season_id])
    @game = Game.create(game_params)
    if @game.save
      redirect_to season_game_path(game: @game.id, season: @game.season_id)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    @season = Season.find(@game.season_id)
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    if @game.save
      redirect_to season_game_path(game: @game.id, season: @game.season_id)
    else
      render :edit
    end
  end

  private
  def game_params
    game_params.require(:game).permit(:opponent, :opponent_score, :home_score, statistics_attributes: [:played, :plate_appearance, :runs, :hits, :doubles, :triples, :homers, :rbis, :walks, :hit_by_pitch, :strikeouts, :sac_fly, :player_id ])
  end
end
