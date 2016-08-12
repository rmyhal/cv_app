class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :jobs, dependent: :destroy
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :languages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true
  has_attached_file :avatar,
                    :styles => {
                        :small => "150x150#",
                        :large => "242x200#"
                    }
  validates :name, presence: true,
            length: {minimum: 5}
  validates :general_info, presence: true,
            length: {minimum: 10}
  validates :avatar, presence: true
  validates :interests,
            length: {minimum: 5}
  validates :user_id, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def to_param
    [id, name.parameterize].join('-')
  end
end
