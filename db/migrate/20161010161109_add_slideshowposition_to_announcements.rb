class AddSlideshowpositionToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :slideshowposition, :integer
  end
end
