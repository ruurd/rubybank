class AccountDecorator < Draper::Decorator
  delegate_all

  def user_name
    user.email
  end

  def balance
    initial_balance + mutations.sum(:amount)
  end

end
