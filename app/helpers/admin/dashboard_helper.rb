module Admin::DashboardHelper
  def agent_name
    if current_user.try(:name).present?
      current_user.name
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
end
