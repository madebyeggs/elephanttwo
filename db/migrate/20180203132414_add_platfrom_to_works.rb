class AddPlatfromToWorks < ActiveRecord::Migration
  def change
    add_column :works, :platform, :string
  end
end
