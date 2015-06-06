# Transfers
class TransfersController < ApplicationController

  # Instantiate a transfer and show the form
  def new
    @transfer = Transfer.new
    end

  # Instantiate a transfer from the params passed then create the
  # necessary Mutation instances to update the database and transfer
  # the money between accounts
  def create
    @transfer = Transfer.new(transfer_params)

    from_account = Account.find(@transfer.from_account_id)
    to_account = Account.find(@transfer.to_account_id)

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
            amount: -amount
        )

        # Save them in one transaction then redirect
        Mutation.transaction do
          add_mutation.save!
          sub_mutation.save!
        end
        redirect_to from_account, notice: 'Transfer successfully executed.'
      else
        flash.notice = 'Balance is not enough to transfer this amount'
        render action: 'new'
      end
    else
      flash.notice = 'You cannot transfer money to the same account'
      render action: 'new'
    end
  end

  private
  def transfer_params
    params.require(:transfer).permit(:from_account_id, :to_account_id, :comment, :amount)
  end
end
