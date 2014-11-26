class Game < ActiveRecord::Base
  belongs_to :season
  has_and_belongs_to_many :players
  has_many :statistics, through: :players

  accepts_nested_attributes_for :statistics
  def format_date(date)
    month = Date::MONTHNAMES[date.month]
    day = date.day
    year = date.year
    month.to_s + " " + day.to_s + ", " + year.to_s
  end

end
