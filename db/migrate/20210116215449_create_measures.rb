class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.string :title
      t.string :unit
      t.string :video

      t.timestamps
    end
  end
end
