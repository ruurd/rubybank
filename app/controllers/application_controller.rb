class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, skip validating the authenticity token
  protect_from_forgery with: :exception
  respond_to :html

  # Prevent unauthorized access by raising an exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # Change locale
  def change_locale
    if Settings.translations.application.include?(params[:new_locale])
      I18n.locale = params[:new_locale]
      if request.referrer
        uri = request.referer.dup
        route = Rails.application.routes.recognize_path(uri)
        route[:locale] = params[:new_locale]
        redirect_to(url_for(route))
      else
        redirect_to(root_path)
      end
    end
  end

  # Set locale
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || locale_from_tld || I18n.default_locale
    session[:locale] = I18n.locale
  end

  private

  # Determine locale from tld
  def locale_from_tld
    parsed_locale = request.host.split('.').last
    Settings.translations.application.include?(parsed_locale.to_sym) ? parsed_locale : nil
  end

  # Determine sort direction, asc per default
  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end

  # Determine sort column and direction
  def sort_specification
    sort_column + ' ' + sort_direction
  end
end
