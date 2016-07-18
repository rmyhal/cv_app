class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.text :general_info
      t.string :interests

      t.timestamps null: false
    end
  end
end
