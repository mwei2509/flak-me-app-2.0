class SlidesController < ApplicationController

  def index
    @slides=Slide.find_slides(current_user.id)
  end

  def show
    slider=current_user.id
    slidee=params[:slidee]
    @slides=Slide.find_slides(current_user.id)
    @group=Group.create_slide(slider, slidee)
    @slide = Slide.start_slide(slider, slidee, @group)
    @message=Message.new
  end

end
