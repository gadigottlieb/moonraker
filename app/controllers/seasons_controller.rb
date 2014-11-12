class SeasonsController < ApplicationController

  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
    @games = @season.games
    @players = @season.players
  end

  def new
    @season = Season.new
    @years = 1980..2100
    @players = Player.all
    @seasons_players = @season.players
  end

  def create
    @season = Season.create(season_params)
    if @season.save
      redirect_to season_path(@season)
    else
      render :new
    end
  end

  def edit
    @season = Season.find(params[:id])
    @years = 1980..2100
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
      redirect_to season_path(@season)
    else
      render :edit
    end
  end

  def destroy
    @season = Season.find(params[:id])
    if @season.destroy
      redirect_to seasons_path
    else
      redirect_to season_path
    end
  end

  def add_players_to_season
    players_added = params["players"].values
  end

  private
  def season_params
    params.require(:season).permit(:year, :wins, :losses, :runs_scored, :runs_allowed, :percentage, :description)
  end

end
