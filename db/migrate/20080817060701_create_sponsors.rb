class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :homepage
      t.string :level
      t.string :logo_url

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
