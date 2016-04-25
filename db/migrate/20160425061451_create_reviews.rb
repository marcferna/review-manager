class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :app, index: true, foreign_key: true
      t.string :uid
      t.string :title
      t.text :text
      t.integer :rating
      t.string :version
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
