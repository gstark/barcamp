class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :name
      t.text :description
      t.string :who
      t.integer :room_id
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
