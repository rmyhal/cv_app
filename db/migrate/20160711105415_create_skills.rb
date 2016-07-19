class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :section
      t.string :title
      t.string :percent
      t.string :color
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
