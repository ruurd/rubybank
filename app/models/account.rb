class Account < ActiveRecord::Base
  belongs_to :user
  has_many :mutations

  monetize :initial_balance

  # Make answers searchable
  def self.search(search)
    if search
      where('iban LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
