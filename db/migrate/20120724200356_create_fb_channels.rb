class CreateFbChannels < ActiveRecord::Migration
  def change
    create_table :fb_channels do |t|

      t.timestamps
    end
  end
end
