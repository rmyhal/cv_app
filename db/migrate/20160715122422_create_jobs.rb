class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :date_from
      t.string :date_to
      t.string :firm
      t.string :position
      t.string :place
      t.belongs_to :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
