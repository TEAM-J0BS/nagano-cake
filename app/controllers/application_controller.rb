class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  
  def search
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct:true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:last_name,
                                             :first_name,
                                             :last_name_kana,
                                             :first_name_kana,
                                             :address,
                                             :postcode,
                                             :phone_number,
                                             :is_deleted
                                             ])
  end
end
