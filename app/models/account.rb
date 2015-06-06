class Account < ActiveRecord::Base
  belongs_to :user
  has_many :mutations

  monetize :initial_balance_cents, :allow_nil => false, :numericality => {
                                     :greater_than_or_equal_to => 0
                                 }
  monetize :balance_cents, :allow_nil => false, :numericality => {
                             :greater_than_or_equal_to => 0
                         }
  monetize :received_cents
  monetize :paid_cents

  # Calculate the balance
  def balance_cents
    initial_balance_cents + mutations.sum(:amount_cents)
  end

  # Calculate total received
  def received_cents
    mutations.reception.sum(:amount_cents)
  end

  # Calculate total paid
  def paid_cents
    mutations.payment.sum(:amount_cents)
  end

  # Make answers searchable
  def self.search(search)
    if search
      where('iban LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
