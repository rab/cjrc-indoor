class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.integer :position
      t.datetime :start_at

      t.timestamps
    end
  end
end
