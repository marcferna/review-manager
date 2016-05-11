class CreateOrganization < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.timestamps null: false
    end

    add_reference :users, :organization, index: true, foreign_key: true
    add_reference :apps, :organization, index: true, foreign_key: true
    remove_reference :apps, :user, index: true, foreign_key: true
  end
end
