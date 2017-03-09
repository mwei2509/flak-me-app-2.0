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

  def flash
    slider=current_user.id
    slidee=params[:slidee]
    @slides=Slide.find_slides(current_user.id)
    @group=Group.create_slide(slider, slidee)
    @slide = Slide.start_slide(slider, slidee, @group)
    @message=Message.new
    @flash=Flash.new
  end

  def sendflash
    body=params[:flash][:body]
    group_id=params[:group_id]
    user_id=current_user.id
    Flash.flashmessage(type: "flash", body: body, group_id: group_id, user_id: user_id)
  end
end
