module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end

  def random_video
    videos=[
      'timelapse1.mov',
      'earth_night_rotate_1080.mov',
      'timelapse2.mov',
      'timelapse3.mov',
      'timelapse4.mp4']
    i=Random.new
    video_output=<<-HTML
      <source src="../#{videos[i.rand(0..4)]}" type="video/mp4">
    HTML
    video_output.html_safe
  end
end
