module Admin::DashboardHelper
  def agent_name
    if current_user.try(:name).present?
      current_user.name
    elsif current_user.try(:email).present?
      current_user.email
    else
      'Ohne Namen'
    end
  end


  def agent_avatar
    if current_user.present?
      current_user.avatar.thumb
    else
      asset_path("default_avatar_thumb.png")
    end
  end

  def is_active? controller
    "active" if controller?(controller) && action?("index", "show", "new", "edit")
  end


  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

end
