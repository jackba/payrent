class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :require_admin
  
  def index
  	@users=User.all
  end

  def show
  end

  def new
  	@user=User.new
  end

	def create
		@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @unit, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password )
  end
      
end
