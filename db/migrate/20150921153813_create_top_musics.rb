class CreateTopMusics < ActiveRecord::Migration
  def change
    create_table :top_musics do |t|
      t.string :name
      t.string :picture
      t.string :title

      t.timestamps null: false
    end
  end
end
