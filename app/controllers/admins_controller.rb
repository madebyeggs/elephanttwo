class AdminsController < ApplicationController
  before_action :authenticate_user!
  
  def artists
    @artists = Artist.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @artists}
    end
  end
  
  def placements
    @works = Work.search(params[:search]).rank(:row_order).all
    #     UN-BLOCK FOR CSV EXPORT - WILL MAKE SEARCH STOP WORKING THOUGH
    #     respond_to do |format|
    #       format.html
    #       format.csv { send_data @works.to_csv }
    #     end
  end
  
  def releases
    @releases = Release.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @releases}
    end
  end
  
  def announcements
    @announcements = Announcement.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @announcements}
    end
  end
  
  def slideshow
    define_slides
    @slides = @slide_works + @slide_announcements
    respond_to do |format|
      format.html
      format.json {render :json => @slides}
    end
  end
  
end