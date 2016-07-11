class Resume < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => {
                        :small => "180x180>"
                    }
  validates :name, presence: true,
            length: {minimum: 5}
  validates :general_info, presence: true,
            length: {minimum: 10}
  validates :avatar, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
end
