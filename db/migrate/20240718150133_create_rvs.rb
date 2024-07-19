class CreateRvs < ActiveRecord::Migration
  def change
    create_table :rvs do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.text :description
      t.text :image_url
      t.float :daily_rate

      t.timestamps null: false
    end
  end
end
