class SlidesController < ApplicationController
  
  def index
    define_slides
    set_meta_tags :og => {
      :url => "#{@currentUrl}",
      :title    => 'Elephant Music | News',
      :description => 'Unique Music to Picture'
    }
    set_meta_tags twitter: {
      card: "summary_large_image",
      site: "",
      title: "Elephant Music | News",
      description: "Unique Music to Picture"
    }
  end
  
  def show
    @slide = Announcement.find_by_slug(params[:id]) || Artist.find_by_slug(params[:id]) || Work.find_by_slug(params[:id]) || Release.find_by_slug(params[:id])
    set_meta_tags og: {
      url: "#{@currentUrl}",
      image: "#{@slide.fb_image}",
      title: "#{@slide.slide_title}",
      description: "#{@slide.description}",
      type: "musician"
    }
    set_meta_tags twitter: {
      card: "summary_large_image",
      site: "",
      title: "#{@slide.slide_title}",
      description: "#{@slide.description}",
      image: "#{@slide.fb_image}"
    }
    render :show, flush: true
  end
  
end