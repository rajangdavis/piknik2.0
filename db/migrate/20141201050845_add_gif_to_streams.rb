class AddGifToStreams < ActiveRecord::Migration
  def change
  	add_column :streams, :gif, :binary
  end
end
