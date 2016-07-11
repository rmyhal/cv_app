class AddAttachmentAvatarToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :resumes, :avatar
  end
end
