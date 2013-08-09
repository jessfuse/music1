class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :fund_sender_id
      t.integer :fund_receiver_id

      t.timestamps
    end
  end
end
