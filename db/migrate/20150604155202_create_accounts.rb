class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.integer :user_id
      t.string :iban, limit: 18, null: false
      t.string :comment, limit: 20, null: false
      t.money :initial_balance, null: false, default: 0
      t.timestamps null: false
    end
  end

  def down
    drop_table :accounts
  end
end
