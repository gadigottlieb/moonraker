class Season < ActiveRecord::Base
  has_many :games
  has_many :statistics, through: :players
  has_and_belongs_to_many :players

  def percentage(wins, losses)
    string = (wins.to_f / (losses+wins).to_f).round(3)
    sprintf('%.3f', string)
  end
end
