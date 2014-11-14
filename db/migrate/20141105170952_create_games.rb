class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string      :opponent
      t.integer     :home_score
      t.integer     :opponent_score
      t.boolean     :win_result
      t.date        :date
      t.integer     :home_first_inning
      t.integer     :home_second_inning
      t.integer     :home_third_inning
      t.integer     :home_fourth_inning
      t.integer     :home_fifth_inning
      t.integer     :home_sixth_inning
      t.integer     :home_seventh_inning
      t.integer     :home_eigth_inning
      t.integer     :home_ninth_inning
      t.integer     :opponent_first_inning
      t.integer     :opponent_second_inning
      t.integer     :opponent_third_inning
      t.integer     :opponent_fourth_inning
      t.integer     :opponent_fifth_inning
      t.integer     :opponent_sixth_inning
      t.integer     :opponent_seventh_inning
      t.integer     :opponent_eigth_inning
      t.integer     :opponent_ninth_inning
      t.belongs_to  :season
    end
  end
end
