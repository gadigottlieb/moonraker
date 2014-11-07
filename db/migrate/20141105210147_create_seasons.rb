class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer   :year
      t.integer   :wins
      t.integer   :losses
      t.integer   :runs_scored
      t.integer   :runs_allowed
      t.string    :percentage
    end
  end
end
