class CreateSlackIntegrations < ActiveRecord::Migration
  def change
    create_table :slack_integrations do |t|
      t.references :organization, index: true, unique: true, foreign_key: true
      t.string :webhook_url
      t.string :channel
      t.boolean :active, default: false
      t.timestamps null: false
    end
  end
end
