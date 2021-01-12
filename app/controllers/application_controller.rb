class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if resource.admin
			redirect_to user_index_path
		else
			redirect_to  user_path(resource)
		end
	end

	def admin_user
		if current_user.present? && current_user.admin
			return true
		else
			redirect_to root_path
	    end
	end

	protected

 	def configure_permitted_parameters
	    attributes = [:name, :image, :mobile,address_attributes: [:id, :address_line, :street, :landmark, :city,:state, :pincode ]]
	    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
	    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
	end
end
