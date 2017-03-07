class SlidesController < ApplicationController

  def show
    slider=current_user.id
    slidee=params[:slidee]
    @group=Group.create_slide(slider, slidee)
    @slide = Slide.start_slide(slider, slidee, @group)
    @message=Message.new
  end
end
