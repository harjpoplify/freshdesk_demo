module ApplicationHelper
  def alert_or_notice alert_type
    alert_type == 'notice' ? 'alert-info' : 'alert-danger'
  end
end
