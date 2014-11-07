class PlayersController < ApplicationController

  def index
    @players = Player.all
    @seasons = Season.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to player_path(@player)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      redirect_to players_path
    else
      redirect_to player_path
    end
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :number, :primary_position, :secondary_position, :bats, :throws, :photo, :description)
  end

end
