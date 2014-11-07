class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string      :opponent
      t.integer     :home_score
      t.integer     :opponent_score
      t.boolean     :win_result
      t.date        :date
      t.belongs_to  :season
    end
  end
end
