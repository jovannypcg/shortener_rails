class CreateShortLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :short_links do |t|
      t.string :slug
      t.string :destination
      t.integer :visits

      t.timestamps
    end
  end
end
