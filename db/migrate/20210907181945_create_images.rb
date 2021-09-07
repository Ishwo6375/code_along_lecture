class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.integer :views, default: 0
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
