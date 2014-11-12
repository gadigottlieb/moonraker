class AddDescriptionToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :description, :text
  end
end
