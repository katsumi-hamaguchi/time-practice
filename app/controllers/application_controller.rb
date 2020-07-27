class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource) #サインインした時の移動先の指定（商品一覧ページ）
    case resource
    when User
    user_path(current_user.id)
    when Admin
    admin_root_path
    end
  end #ユーザーと管理者のログイン後の移動ページをそれぞれ指定

  def after_sign_out_path_for(resource) #サインアウト後の移動先の指定（トップページ指定）
    root_path(resource)
  end
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    elsif resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    else
      super
    end
  end
end
