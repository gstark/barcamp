class AddUrlToTalk < ActiveRecord::Migration
  def self.up
    add_column :talks, :url, :string
  end

  def self.down
  end
end
