class ApplicationController < ActionController::Base
	  #before_action :authenticate_user!
	    protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :check_this
     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :about)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :about,:image)}
          end

               

     #####This is used for the fetch the image url in locals#### 
          def check_this
               ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
          end


end
