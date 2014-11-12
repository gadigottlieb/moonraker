class Season < ActiveRecord::Base
  has_many :games
  has_and_belongs_to_many :players

  def percentage(wins, losses)
    (wins.to_f / (losses+wins).to_f).round(3)
  end
end
