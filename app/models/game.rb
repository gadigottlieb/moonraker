class Game < ActiveRecord::Base
  has_many :players
  belongs_to :season

  def record(win_result)
    wins = 0
    losses = 0
    win_result == true ? wins += 1 : losses += 1
  end
end
