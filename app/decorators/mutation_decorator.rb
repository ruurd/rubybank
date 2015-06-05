class MutationDecorator < Draper::Decorator
  delegate_all

  def from_iban
    from_account.iban
  end

  def balance
    mutations.sum(:amount)
  end

end