class Game < ActiveRecord::Base
  has_many :players
  belongs_to :season
end
