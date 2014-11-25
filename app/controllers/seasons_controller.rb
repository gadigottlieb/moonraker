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
    @season.games.create(game_params)
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
    params.require(:season).permit(:year, :wins, :losses, :runs_scored, :runs_allowed, :description)
  end

  def game_params
    params.require(:game).permit(:opponent, :home_score, :opponent_score,
    :win_result, :date, :home_first_inning, :home_second_inning, :home_third_inning,
    :home_fourth_inning, :home_fifth_inning, :home_sixth_inning, :home_seventh_inning,
    :home_ninth_inning, :opponent_first_inning, :opponent_second_inning,
    :opponent_third_inning, :opponent_fourth_inning, :opponent_fifth_inning,
    :opponent_sixth_inning, :opponent_seventh_inning, :opponent_eigth_inning,
    :opponent_ninth_inning)
  end

end
