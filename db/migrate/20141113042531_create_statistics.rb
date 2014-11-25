class CreateStatistics < ActiveRecord::Migration
  def change
    create_table   :statistics do |t|
      t.boolean    :played
      t.integer    :plate_appearance
      t.integer    :runs
      t.integer    :hits
      t.integer    :doubles
      t.integer    :triples
      t.integer    :homers
      t.integer    :rbis
      t.integer    :walks
      t.integer    :hit_by_pitch
      t.integer    :strikeouts
      t.integer    :sac_fly
      t.belongs_to :player
      t.belongs_to :game
      t.belongs_to :season
    end
  end
end
