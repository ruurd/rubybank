class UserDecorator < Draper::Decorator
  delegate_all

  def name
    user.email
  end

end