class TransfersController < ApplicationController
  def new
    @transfer = Transfer.new
    end

  def create
    @transfer = Transfer.new(transfer_params)

    from_account = Account.find(@transfer.from_account_id).decorate
    to_account = Account.find(@transfer.to_account_id).decorate

    if (from_account.id != to_account.id)
      amount = BigDecimal.new(@transfer.amount)
      correlation = Rubybank::Utilities::generate_correlation_code(16)
      if from_account.balance > amount
        add_mutation = Mutation.new(
            account: to_account,
            correlation_code: correlation,
            from_account: from_account,
            comment: @transfer.comment,
            amount: amount
        )
        sub_mutation = Mutation.new(
            account: from_account,
            correlation_code: correlation,
            from_account: to_account,
            comment: @transfer.comment,
            amount: amount
        )
        Mutation.transaction do
          add_mutation.save!
          sub_mutation.save!
        end
        redirect_to from_account, notice: 'Transfer successfully executed.'
      else
        render action: 'new', notice: 'Balance is not enough to transfer this amount'
      end
    else
      render action: 'new', notice: 'You cannot transfer money to the same account'
    end
  end

  private
  def transfer_params
    params.require(:transfer).permit(:from_account_id, :to_account_id, :comment, :amount)
  end


end