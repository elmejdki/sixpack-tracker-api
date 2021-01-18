class AddNewFieldToMeasure < ActiveRecord::Migration[6.1]
  def change
    add_column :measures, :image_url, :string
  end
end
