class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #`true` を返す場合に実行

  def after_sign_in_path_for(resource)
    case resource #`resource` のクラスが `Admin` の場合は `admin_path`
      when Admin
        admin_path
      when Customer #`Customer` の場合は `root_path` を返します。
        root_path
    end
  end

  def after_sign_out_path_for(admin) #`admin` は不要なので無視
    new_admin_session_path
  end
end
