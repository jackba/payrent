class UsersController < ApplicationController
before_action :require_admin, except: [:show, :index]

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

  private
  def user_params
  	params.require(:user).permit(:name, :email, :unit_id, :admin, :password )
  end
end
