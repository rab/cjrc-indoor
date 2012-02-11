class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :race
      t.belongs_to :entry
      t.integer :erg
      t.string :score

      t.timestamps
    end
    add_index :assignments, :race_id
    add_index :assignments, :entry_id
  end
end
