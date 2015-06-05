class AddCorrelationCodeToMutations < ActiveRecord::Migration
  def up
    add_column :mutations, :correlation_code, :string, limit: 16, null: false, default: 'xxx'
  end

  def down
    remove_column :mutations, :correlation_code
  end
end
