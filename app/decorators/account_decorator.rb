class AccountDecorator < Draper::Decorator
  delegate_all

  def user_name
    user.email
  end

end
