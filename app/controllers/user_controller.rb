class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index]	
  def index
  	@users  = User.all.order('created_at desc')
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@address = @user.address || @user.build_address
  end

  def update
  	@user = User.find_by_id(params[:id])
	if @user.update user_params
		notice = "Successfully added."
	else
		notice = "Something went wrong."
	end
	return redirect_to root_path, notice: notice
  end

  private
  def user_params
    params.require(:user).permit(:name,:mobile,:email,:password,:password_confirmation,:image,address_attributes: [:id, :address_line, :street, :landmark, :city,:state, :pincode ])
  end
end

