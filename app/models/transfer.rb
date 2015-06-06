class Transfer
  include ActiveModel::Model

  attr_accessor :correlation_code, :from_account_id, :to_account_id, :comment, :amount
end
