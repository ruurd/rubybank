class CreateMutations < ActiveRecord::Migration
  def up
    create_table :mutations do |t|
      t.integer :account_id, null: false
      t.integer :from_account_id, null: false
      t.string :comment
      t.monetize :amount, null: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :mutations
  end
end
