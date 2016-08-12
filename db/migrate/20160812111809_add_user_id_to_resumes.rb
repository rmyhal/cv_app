class AddUserIdToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :user_id, :integer
  end
end
