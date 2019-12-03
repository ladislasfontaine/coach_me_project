class UsersController < ApplicationController

  def welcome

  end



  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit
    @user = User.find(params[:id])

  end


  def update
    @user = User.find(params[:id])
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birth_date: params[:birth_date], phone_number: params[:phone_number], address: params[:address], city: params[:city], zip_code: params[:zip_code], description: params[:description], objective: params[:objective])
    redirect_to @user
  end

  def update
    @user = User.find(params[:id])
    if ![:avatar].nil?
      @user.avatar.purge
      @user.avatar.attach(params[:avatar])
      redirect_to(user_path(@user))
    end # end if
  end

end
