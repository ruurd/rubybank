class MakeIbanUnique < ActiveRecord::Migration
  def up
    add_index :accounts, :iban, unique: true
  end

  def down
    remove_index :accounts, :iban
  end
end
