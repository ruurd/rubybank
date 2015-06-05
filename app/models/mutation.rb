class Mutation < ActiveRecord::Base
  belongs_to :account
  belongs_to :from_account, class_name: Account

  monetize :amount

  # Make answers searchable
  def self.search(search)
    if search
      where('from_account LIKE :srch', srch: "%#{search}%")
    else
      all
    end
  end

end
