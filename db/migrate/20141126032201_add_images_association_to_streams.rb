class AddImagesAssociationToStreams < ActiveRecord::Migration
  def self.up
    add_column :images, :stream_id, :integer
    add_index 'images', ['stream_id'], :name => 'index_stream_id'
  end

  def self.down
    remove_column :images, :stream_id
  end
end
