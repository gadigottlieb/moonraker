class CreatePlayersSeasons < ActiveRecord::Migration
  def change
    create_table :players_seasons do |t|
      t.belongs_to    :player
      t.belongs_to    :season
    end
  end
end
