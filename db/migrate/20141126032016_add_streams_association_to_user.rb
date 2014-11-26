class AddStreamsAssociationToUser < ActiveRecord::Migration
 def self.up
    add_column :streams, :user_id, :integer
    add_index 'streams', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :streams, :user_id
  end
end
