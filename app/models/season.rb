class Season < ActiveRecord::Base
  has_many :games
  has_many :statistics, through: :players
  has_and_belongs_to_many :players

  validates_presence_of :year, :wins, :losses
  validates_uniqueness_of :year

  def percentage(wins, losses)
    string = (wins.to_f / (losses+wins).to_f).round(3)
    sprintf('%.3f', string)
  end

  def team_plate_appearances(season = nil)
    season ? statistics.where(season_id: season).sum(:plate_appearance) : statistics.sum(:plate_appearance)
  end

  def team_at_bats(season = nil)
    if season
      plate_appearance = statistics.where(season_id: season).sum(:plate_appearance)
      walks = statistics.where(season_id: season).sum(:walks)
      sac_fly = statistics.where(season_id: season).sum(:sac_fly)
      @total_at_bats = plate_appearance - (walks + sac_fly)
    else
      plate_appearance = statistics.sum(:plate_appearance)
      walks = statistics.sum(:walks)
      sac_fly = statistics.sum(:sac_fly)
      @total_at_bats = plate_appearance - (walks + sac_fly)
    end
  end

  def team_runs(season = nil)
    season ? @team_runs = statistics.where(season_id: season).sum(:runs) : @team_runs = statistics.sum(:runs)
  end

  def team_hits(season = nil)
    season ? @total_hits = statistics.where(season_id: season).sum(:hits) : @total_hits = statistics.sum(:hits)
  end

  def team_doubles(season = nil)
    season ?  @total_doubles = statistics.where(season_id: season).sum(:doubles) : @total_doubles = statistics.sum(:doubles)
  end

  def team_triples(season = nil)
    season ? @total_triples = statistics.where(season_id: season).sum(:triples) : @total_triples = statistics.sum(:triples)
  end

  def team_homers(season = nil)
    season ? @total_homers = statistics.where(season_id: season).sum(:homers) : @total_homers = statistics.sum(:homers)
  end

  def team_rbis(season = nil)
    season ? @total_rbis = statistics.where(season_id: season).sum(:rbis) : @total_rbis = statistics.sum(:rbis)
  end

  def team_walks(season = nil)
    season ? @total_walks = statistics.where(season_id: season).sum(:walks) : @total_walks = statistics.sum(:walks)
  end

  def team_strikeouts(season = nil)
    season ? @total_strikeouts = statistics.where(season_id: season).sum(:strikeouts) : @total_strikeouts = statistics.sum(:strikeouts)
  end

  def team_sac_fly(season = nil)
    season ? @total_sac_flys = statistics.where(season_id: season).sum(:sac_fly) : @total_sac_flys = statistics.sum(:sac_fly)
  end

  def total_bases(season)
    singles = (@total_hits - (@total_doubles + @total_triples + @total_homers))
    @total_bases = singles + (2 * @total_doubles) + (3 * @total_triples) + (4 * @total_homers)
  end

  def team_batting_avg
    string = (@total_hits.to_f / @total_at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end

  def team_on_base_pct
    @on_base_pct = ((@total_hits.to_f + @total_walks.to_f) / (@total_at_bats.to_f + @total_walks.to_f + @total_sac_fly.to_f)).round(3)
    sprintf('%.3f', @on_base_pct)
  end

  def team_slugging_pct
    @slugging_pct = (@total_bases.to_f / @total_at_bats.to_f).round(3)
    sprintf('%.3f', @slugging_pct)
  end

  def team_on_base_plus_slg
    @on_base_plus_slug = @slugging_pct + @on_base_pct
    sprintf('%.3f', @on_base_plus_slug)
  end



end
