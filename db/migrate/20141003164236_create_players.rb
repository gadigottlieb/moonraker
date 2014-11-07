class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string     :first_name
      t.string     :last_name
      t.integer    :number
      t.string     :primary_position
      t.string     :secondary_position
      t.string     :position_description
      t.string     :bats
      t.string     :throws
      t.string     :photo
      t.text       :description
      t.string     :height
      t.integer    :weight
      t.date       :birthday
    end
  end
end
