class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
    	t.integer :creator_id
    	t.float :imposter_rate_average
    	t.float :crew_rate_average
    	t.boolean :imposter_win
      t.timestamps
    end
  end
end
