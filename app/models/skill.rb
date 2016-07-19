class Skill < ActiveRecord::Base
  belongs_to :resume
  def change_color(color)
    red = color[1,2].to_i + 15
    green1 = color[3]
    green2 = color[4]
    green = "#{green1}#{green2}".to_i + 15
    blue = color[5,6].to_i + 15
    rgb = "##{red}#{green}#{blue}"
    return rgb
  end
end
