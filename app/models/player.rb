class Player < ActiveRecord::Base
  has_and_belongs_to_many :seasons
  has_and_belongs_to_many :games
  has_many :statistics

  def name
    "#{first_name} #{last_name}"
  end

  def full_birthday(date)
    month = Date::MONTHNAMES[date.month]
    day = date.day
    year = date.year
    month.to_s + " " + day.to_s + ", " + year.to_s
  end

  def shorten_birthday(date)
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

  def total_games(season = nil)
    if season
      total_games ||= statistics.where(season_id: season).count
    else
      total_plate_appearance ||= statistics.count
    end
  end

  def total_plate_appearance(season = nil)
    if season
      total_plate_appearance ||= statistics.where(season_id: season).sum(:plate_appearance)
    else
      total_plate_appearance ||= statistics.sum(:plate_appearance)
    end
  end

  def total_runs(season = nil)
    if season
      total_runs ||= statistics.where(season_id: season).sum(:runs)
    else
      total_runs ||= statistics.sum(:runs)
    end
  end

  def total_hits(season = nil)
    if season
      total_hits ||= statistics.where(season_id: season).sum(:hits)
    else
      total_hits ||= statistics.sum(:hits)
    end
  end

  def total_doubles(season = nil)
    if season
      total_doubles ||= statistics.where(season_id: season).sum(:doubles)
    else
      total_doubles ||= statistics.sum(:doubles)
    end
  end

  def total_triples(season = nil)
    if season
      total_triples ||= statistics.where(season_id: season).sum(:triples)
    else
      total_triples ||= statistics.sum(:triples)
    end
  end

  def total_homers(season = nil)
    if season
      total_homers ||= statistics.where(season_id: season).sum(:homers)
    else
      total_homers ||= statistics.sum(:homers)
    end

  end

  def total_rbis(season = nil)
    if season
      total_rbis ||= statistics.where(season_id: season).sum(:rbis)
    else
      total_rbis ||= statistics.sum(:rbis)
    end
  end

  def total_walks(season = nil)
    if season
      total_walks ||= statistics.where(season_id: season).sum(:walks)
    else
      total_walks ||= statistics.sum(:walks)
    end
  end

  def total_strikeouts(season = nil)
    if season
      total_strikeouts ||= statistics.where(season_id: season).sum(:strikeouts)
    else
      total_strikeouts ||= statistics.sum(:strikeouts)
    end
  end

  def total_sac_fly(season = nil)
    if season
      total_sac_fly ||= statistics.where(season_id: season).sum(:sac_fly)
    else
      total_sac_fly ||= statistics.sum(:sac_fly)
    end
  end

  def total_at_bats(season = nil)
    if season
      total_at_bats ||= statistics.where(season_id: season).sum(:plate_appearance) - (statistics.where(season_id: season).sum(:walks) + statistics.where(season_id: season).sum(:sac_fly))
    else
      total_at_bats ||= statistics.sum(:plate_appearance) - (statistics.sum(:walks) + statistics.sum(:sac_fly))
    end
  end

  def season_batting_avg(season = nil)
    if season
      string = (statistics.where(season_id: season).sum(:hits).to_f / (statistics.where(season_id: season).sum(:plate_appearance) - (statistics.where(season_id: season).sum(:walks) + statistics.where(season_id: season).sum(:sac_fly))).to_f).round(3)
      sprintf('%.3f', string)
    else
      string = (total_hits.to_f / total_at_bats.to_f).round(3)
      sprintf('%.3f', string)
    end
  end

  def total_bases(season = nil)
    if season
      hits = statistics.where(season_id: season).sum(:hits)
      doubles = statistics.where(season_id: season).sum(:doubles)
      triples = statistics.where(season_id: season).sum(:triples)
      homers = statistics.where(season_id: season).sum(:homers)
      singles = (hits - (doubles + triples + homers))
      @total_bases = singles + (2 * doubles) + (3 * triples) + (4 * homers)
    else
      hits = statistics.sum(:hits)
      doubles = statistics.sum(:doubles)
      triples = statistics.sum(:triples)
      homers = statistics.sum(:homers)
      singles = (hits - (doubles + triples + homers))
      @total_bases = singles + (2 * doubles) + (3 * triples) + (4 * homers)
    end
  end

  def on_base_pct(season = nil)
    if season
      season_hits = statistics.where(season_id: season).sum(:hits)
      season_walks = statistics.where(season_id: season).sum(:walks)
      season_sac_fly = statistics.where(season_id: season).sum(:sac_fly)
      season_at_bats = statistics.where(season_id: season).sum(:plate_appearance) - (statistics.where(season_id: season).sum(:walks) + statistics.where(season_id: season).sum(:sac_fly))
      @on_base_pct = ((season_hits.to_f + season_walks.to_f) / (season_at_bats.to_f + season_walks.to_f + season_sac_fly.to_f)).round(3)
      sprintf('%.3f', @on_base_pct)
    else
      hits = statistics.sum(:hits)
      walks = statistics.sum(:walks)
      sac_fly = statistics.sum(:sac_fly)
      at_bats = statistics.sum(:plate_appearance) - (statistics.sum(:walks) + statistics.sum(:sac_fly))
      @on_base_pct = ((hits.to_f + walks.to_f) / (at_bats.to_f + walks.to_f + sac_fly.to_f)).round(3)
      sprintf('%.3f', @on_base_pct)
    end
  end

  def slugging_pct(season = nil)
    if season
      at_bats = statistics.where(season_id: season).sum(:plate_appearance) - (statistics.where(season_id: season).sum(:walks) + statistics.where(season_id: season).sum(:sac_fly))
      @slugging_pct = (@total_bases.to_f / at_bats.to_f).round(3)
      sprintf('%.3f', @slugging_pct)
    else
      at_bats = statistics.sum(:plate_appearance) - (statistics.sum(:walks) + statistics.sum(:sac_fly))
      @slugging_pct = (@total_bases.to_f / at_bats.to_f).round(3)
      sprintf('%.3f', @slugging_pct)
    end
  end

   def on_base_plus_slg
     @on_base_plus_slug = @slugging_pct + @on_base_pct
     sprintf('%.3f', @on_base_plus_slug)
   end

end
