class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :date_from
      t.string :date_to
      t.string :level
      t.text :description
      t.string :place
      t.belongs_to :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
