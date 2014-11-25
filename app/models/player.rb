class Player < ActiveRecord::Base
  has_and_belongs_to_many :seasons
  has_and_belongs_to_many :games
  has_many :statistics

  def format_date(date)
    month = Date::MONTHNAMES[date.month]
    day = date.day
    year = date.year
    month[0..2].to_s + " " + day.to_s + ", " + year.to_s
  end

  def year(array)
    year = array.map do |attribute|
      attribute.season_id
    end
    @year = Season.find(year)[0]
  end

  def total_plate_appearance(array)
    total_plate_appearance = array.map do |attribute|
      attribute.plate_appearance
    end
    @total_plate_appearance = total_plate_appearance.inject(:+)
  end


  def total_runs(array)
    total_runs = array.map do |attribute|
      attribute.runs
    end
    @total_runs = total_runs.inject(:+)
  end

  def total_hits(array)
    total_hits = array.map do |attribute|
      attribute.hits
    end
    @total_hits = total_hits.inject(:+)
  end

  def total_doubles(array)
    total_doubles = array.map do |attribute|
      attribute.doubles
    end
    @total_doubles = total_doubles.inject(:+)
  end

  def total_triples(array)
    total_triples = array.map do |attribute|
      attribute.triples
    end
    @total_triples = total_triples.inject(:+)
  end

  def total_homers(array)
    total_homers = array.map do |attribute|
      attribute.homers
    end
    @total_homers = total_homers.inject(:+)
  end

  def total_rbis(array)
    total_rbis = array.map do |attribute|
      attribute.rbis
    end
    @total_rbis = total_rbis.inject(:+)
  end

  def total_walks(array)
    total_walks = array.map do |attribute|
      attribute.walks
    end
    @total_walks = total_walks.inject(:+)
  end

  def total_strikeouts(array)
    total_strikeouts = array.map do |attribute|
      attribute.strikeouts
    end
    @total_strikeouts = total_strikeouts.inject(:+)
  end

  def total_sac_fly(array)
    total_sac_fly = array.map do |attribute|
      attribute.sac_fly
    end
    @total_sac_fly = total_sac_fly.inject(:+)
  end

  def total_at_bats(plate_appearance, walks, sac_fly)
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
    all_seasons.map do |season|
      all_stats.map do |stat|
        if stat.season_id == season.id && stat.player_id == player.id
          array.push(stat.runs)
        end
      end
    end
    @season_player_runs = array.inject(:+)
  end

end
