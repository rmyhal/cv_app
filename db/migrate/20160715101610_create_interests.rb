class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.text :name
      t.belongs_to :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
