class Game < ActiveRecord::Base
  belongs_to :season
  has_and_belongs_to_many :players
  has_many :statistics, through: :players

  def team_hits(single_game)
    array = []
    team_hits = single_game.statistics.map do |stat|
      if stat.game_id == single_game.id
        array.push(stat.hits)
      end
    end
      @team_hits = array.inject(:+)
  end

  def form_date(date)
    month = Date::MONTHNAMES[date.month]
    day = date.day
    year = date.year
    month.to_s + " " + day.to_s + ", " + year.to_s
  end

  def check_game_stats(game_array)
    @doubles = []
    @triples = []
    @homers = []
    # rbis = []
    # sf = []
    game_array.statistics.map do |stat|
      if stat.game_id == game_array.id
        if stat.homers > 1
          @homers.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0] + " " + stat.homers.to_s)
        elsif stat.homers == 1
          @homers.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0])
          @homers.each do |homer|
            puts "HR: #{homer}"
          end
        elsif stat.doubles > 1
          @doubles.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0] + " " + stat.doubles.to_s)
        elsif stat.doubles == 1
          @doubles.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0])
        elsif stat.triples > 1
          @triples.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0] + " " + stat.triples.to_s)
        elsif stat.triples > 1
          @triples.push(Player.find(stat.player_id).last_name + ", " + Player.find(stat.player_id).first_name[0])
        end
        # @doubles
        # @triples
      end
    end
  end
end
