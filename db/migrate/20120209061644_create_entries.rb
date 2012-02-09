class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string     :last_name
      t.string     :first_name
      t.string     :address
      t.string     :phone
      t.string     :email

      t.string     :score
      t.string     :affiliation
      t.belongs_to :event
      t.boolean    :lightweight, default: false, null: false
      t.integer    :age
      t.date       :dob
      t.string     :responsible_party
      t.boolean    :waiver,      default: false, null: false
      t.datetime   :registered_at
      t.timestamps
    end
    add_index :entries, :event_id
  end
end
