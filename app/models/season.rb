class Season < ActiveRecord::Base
  has_many :games
  has_many :statistics, through: :players
  has_and_belongs_to_many :players

  def percentage(wins, losses)
    string = (wins.to_f / (losses+wins).to_f).round(3)
    sprintf('%.3f', string)
  end

  def season_plate_appearances(all_stats, all_seasons, player)
    array = []
    all_seasons.map do |season|
      all_stats.map do |stat|
         if stat.season_id == season.id && stat.player_id == player.id
          array.push(stat.plate_appearance)
        end
      end
    end
    @season_player_plate_appearances = array.inject(:+)
  end

  def season_runs(all_stats, all_seasons, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.runs)
      end
    end
    @season_player_runs = array.inject(:+)
  end

  def season_player_hits(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.hits)
      end
    end
    @season_player_hits = array.inject(:+)
  end

  def season_player_doubles(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.doubles)
      end
    end
    @season_player_doubles = array.inject(:+)
  end

  def season_player_triples(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.triples)
      end
    end
    @season_player_triples = array.inject(:+)
  end

  def season_player_homers(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.homers)
      end
    end
    @season_player_homers = array.inject(:+)
  end

  def season_player_rbis(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.rbis)
      end
    end
    @season_player_rbis = array.inject(:+)
  end

  def season_player_walks(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.walks)
      end
    end
    @season_player_walks = array.inject(:+)
  end

  def season_player_strikeouts(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.strikeouts)
      end
    end
    @season_player_strikeouts = array.inject(:+)
  end

  def season_player_sac_fly(all_stats, season, player)
    array = []
    all_stats.map do |stat|
      if stat.season_id == season.id && stat.player_id == player.id
        array.push(stat.sac_fly)
      end
    end
    @season_player_sac_fly = array.inject(:+)
  end

  def season_at_bats(plate_appearance, walks, sac_fly)
    @total_at_bats = plate_appearance - (walks + sac_fly)
  end

  def season_batting_avg
    string = (@total_hits.to_f / @total_at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end

  def total_bases
    singles = @total_hits - (@total_doubles + @total_triples + @total_homers)
    @total_bases = singles + (2 * @total_doubles) + (3 * @total_triples) + (4 * @total_homers)
  end

  def on_base_pct
    @on_base_pct = ((@total_hits.to_f + @total_walks.to_f) / (@total_at_bats.to_f + @total_walks.to_f + @total_sac_fly.to_f)).round(3)
    sprintf('%.3f', @on_base_pct)
  end

  def slugging_pct
    @slugging_pct = (@total_bases.to_f / @total_at_bats.to_f).round(3)
    sprintf('%.3f', @slugging_pct)
  end

  def on_base_plus_slg
    @on_base_plus_slug = @slugging_pct + @on_base_pct
    sprintf('%.3f', @on_base_plus_slug)
  end

end
