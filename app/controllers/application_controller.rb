class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_slides
    @slide_announcements = Announcement.where('slideshow = ?', true)
    @slide_works = Work.where('slideshow = ?', true)
    @slides = @slide_works + @slide_announcements
  end
  
end