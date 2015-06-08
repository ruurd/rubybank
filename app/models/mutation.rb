class Mutation < ActiveRecord::Base
  belongs_to :account
  belongs_to :from_account, class_name: Account

  monetize :amount_cents_cents, :allow_nil => false, :numericality => {
                                  :greater_than_or_equal_to => 0
                              }


  # OK this $%^&*( sucks because I think this is
  # PostgreSQL specific.
  scope :payment, -> { where('amount_cents < 0') }
  scope :reception, -> { where('amount_cents > 0') }

  # Make answers searchable
  def self.search(search)
    if search
      where('from_account LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
