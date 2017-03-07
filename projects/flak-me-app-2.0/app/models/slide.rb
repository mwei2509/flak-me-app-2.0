class Slide < ApplicationRecord
  has_many :messages
  belongs_to :group

  belongs_to :user_1, :foreign_key => "slider", :class_name => "User"
  belongs_to :user_2, :foreign_key => "slidee", :class_name => "User"

  def self.sort_users(slider, slidee)
    id_array=[]
    id_array << slider.to_i
    id_array << slidee.to_i
    sorted=id_array.sort
    return {slider: sorted[0], slidee: sorted[1]}
  end

  def self.get_replies(slider, slidee)
    slide_id=Slide.find_by(sort_users(slider,slidee))
    Message.joins(:user).where(group_id: group_id)
  end

  def self.get_slide(slider, slidee)
    Slide.find_by(sort_users(slider,slidee))
  end

  def self.start_slide(slider, slidee, group)
    params=sort_users(slider,slidee)
    params[:group_id]=group.id
    Slide.find_or_create_by(params)
  end
end
