class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.string :client
      t.text :description
      t.text :technologies
      t.string :role
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
