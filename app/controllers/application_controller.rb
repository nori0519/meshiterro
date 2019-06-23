class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
 	#deviseを利用する機能が実行される前にconfigure_permittes_parametersが実行される
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #nameのデータ操作を許可するアクションメソッドが指定されている。（protected:呼び出されたほかのコントローラからも参照ができるストロングパラメータ）
end

