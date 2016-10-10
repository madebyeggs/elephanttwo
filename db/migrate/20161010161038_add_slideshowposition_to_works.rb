class AddSlideshowpositionToWorks < ActiveRecord::Migration
  def change
    add_column :works, :slideshowposition, :integer
  end
end
