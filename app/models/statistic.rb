class Statistic < ActiveRecord::Base
  belongs_to :player

  def batting_avg(hits, at_bats)
    string = (hits.to_f / at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end

  def total_bases(singles, doubles, triples, homers)
    singles = hits - (doubles + triples + homers)
    singles + (2 * doubles) + (3 * triples) + (4 * homers)
  end

  def slugging_pct(total_bases, at_bats)
    string = (total_bases.to_f / at_bats.to_f).round(3)
    sprintf('%.3f', string)
  end

  def on_base_pct(hits, walks, at_bats, sac_fly)
    string = (hits.to_f + walks.to_f) / (at_bats.to_f + walks.to_f + sac_fly.to_f)
    sprintf('%.3f', string)
  end

  def check_for_doubles(doubles)
    doubles > 0 ? "2B: #{doubles}" : ""
  end

  def check_for_triples(triples)
    doubles > 0 ? "3B: #{triples}" : ""
  end

  def check_for_homers(homers)
    doubles > 0 ? "HR: #{homers}" : ""
  end

  def check_for_rbis(rbis)
    doubles > 0 ? "RBI: #{rbis}" : ""
  end

  def check_for_sf(sac_fly)
    doubles > 0 ? "SF: #{sac_fly}" : ""
  end

  def season_stats(array)
    array.each do |stat|
      stat
    end
  end

end
