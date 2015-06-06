class Mutation < ActiveRecord::Base
  belongs_to :account
  belongs_to :from_account, class_name: Account

  monetize :amount_cents

  # OK this $%^&*( sucks because I think this is
  # PostgreSQL specific.
  scope :payment, -> {where('amount_cents < 0')}
  scope :reception, -> {where('amount_cents > 0')}

  # Make answers searchable
  def self.search(search)
    if search
      where('from_account LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
