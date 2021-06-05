class AddRatepointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :imposter_rate, :float, null: false, default: 1500.0
    add_column :users, :crew_rate, :float, null: false, default: 1500.0
  end
end
