class Skill < ActiveRecord::Base
  belongs_to :resume

  validates :percent, :numericality => { :only_integer => true }
  validates :percent, :numericality => { :less_than_or_equal_to => 100}

  def change_color(color)
    red = color[1,2].to_i(16) + 20
    green1 = color[3]
    green2 = color[4]
    green = (green1 + green2).to_i(16) + 20
    blue1 = color[5]
    blue2 = color[6]
    blue = (blue1 + blue2).to_i(16) + 20
    rgb = "rgb(#{red},#{green},#{blue})"
    return rgb
  end
end
