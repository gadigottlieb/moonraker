class Statistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :season
  belongs_to :game

  def player_name(id)
    "#{Player.find(id).last_name},  #{Player.find(id).first_name[0]} #{Player.find(id).primary_position}"
  end

  def at_bats(stat)
    game_plate_appearance = stat.plate_appearance
    game_walks = stat.walks
    game_sac_fly = stat.sac_fly
    @at_bats = game_plate_appearance - (game_walks + game_sac_fly)
  end

  def batting_avg(hits)
    string = (hits.to_f / @at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end

  def total_bases(singles, doubles, triples, homers)
    singles = hits - (doubles + triples + homers)
    singles + (2 * doubles) + (3 * triples) + (4 * homers)
  end

  def on_base_pct(hits, walks, at_bats, sac_fly)
    string = (hits.to_f + walks.to_f) / (at_bats.to_f + walks.to_f + sac_fly.to_f)
    sprintf('%.3f', string)
  end

  def slugging_pct(total_bases, at_bats)
    string = (total_bases.to_f / at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end


end
