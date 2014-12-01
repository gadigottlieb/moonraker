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

  def team_at_bats(game = nil)
    plate_appearances = statistics.where(game_id: game).sum(:plate_appearance)
    walks = statistics.where(game_id: game).sum(:walks)
    sac_fly = statistics.where(game_id: game).sum(:sac_fly)
    @at_bats = plate_appearances - (walks + sac_fly)
  end

  def team_runs(game = nil)
    game ? statistics.where(game_id: game).sum(:runs) : statistics.sum(:runs)
  end

  def team_hits(game = nil)
    @hits = game ? statistics.where(game_id: game).sum(:hits) : statistics.sum(:hits)
  end

  def team_rbis(game = nil)
    game ? statistics.where(game_id: game).sum(:rbis) : statistics.sum(:rbis)
  end

  def team_walks(game = nil)
    game ? statistics.where(game_id: game).sum(:walks) : statistics.sum(:walks)
  end

  def team_strikeouts(game = nil)
    game ? statistics.where(game_id: game).sum(:strikeouts) : statistics.sum(:strikeouts)
  end

  def batting_avg
    string = (@hits.to_f / @at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end
  def game_doubles(game)
    doubles_array = []
    game_stats = statistics.where(game_id: game).where("doubles > 0")
    game_stats.map do |stat|
      if stat.doubles > 1
        doubles_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]} #{stat.doubles};")
      else stat.doubles = 1
        doubles_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]};")
      end
    end
  doubles_array
  end

  def game_triples(game)
    triples_array = []
    game_stats = statistics.where(game_id: game).where("triples > 0")
    game_stats.each do |stat|
      if stat.triples > 1
        triples_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]} #{stat.triples};")
      else stat.triples = 1
        triples_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]};")
      end
    end
  triples_array
  end

  def game_homers(game)
    homers_array = []
    game_stats = statistics.where(game_id: game).where("homers > 0")
    game_stats.each do |stat|
      if stat.homers > 1
        homers_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]} #{stat.homers};")
      else stat.homers = 1
        homers_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]};")
      end
    end
  homers_array
  end

  def game_sac_fly(game)
    sac_fly_array = []
    game_stats = statistics.where(game_id: game).where("sac_fly > 0")
    game_stats.each do |stat|
      if stat.sac_fly > 1
        sac_fly_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]} #{stat.sac_fly};")
      else stat.sac_fly = 1
        sac_fly_array.push("#{Player.find(stat.player_id).last_name}, #{Player.find(stat.player_id).first_name[0]};")
      end
    end
  sac_fly_array
  end
end
