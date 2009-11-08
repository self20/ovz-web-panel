# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def translate(key, options = {})
    I18n.translate(key, options)
  end
  alias :t :translate
  
end