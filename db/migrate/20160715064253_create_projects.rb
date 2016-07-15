class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :date_from
      t.string :date_to
      t.string :client
      t.text :description
      t.text :technologies
      t.string :role
      t.belongs_to :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
