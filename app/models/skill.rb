class Skill < ActiveRecord::Base
  belongs_to :resume
  def change_color(color)
    @darker_color = color
    change = @darker_color[2,3].to_i
    change += 20
    @darker_color[2,3] = change.to_s
    return @darker_color
  end
end
