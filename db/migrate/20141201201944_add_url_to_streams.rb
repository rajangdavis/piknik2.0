class AddUrlToStreams < ActiveRecord::Migration
  def change
  	add_column :streams, :url, :string
  end
end
