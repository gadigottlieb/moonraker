class Game < ActiveRecord::Base
  belongs_to :season
  has_and_belongs_to_many :players
  has_many :statistics, through: :players  
end
