class UsersController < ApplicationController
  def create
   @user = User.new
   if @user.valid?
    @user.save
    return redirect_to root_path
   else
    render 'devise/registrations/new'
   end
  end
end
