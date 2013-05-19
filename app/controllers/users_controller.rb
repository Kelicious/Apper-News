class UsersController < ApplicationController
  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notices] = ["Account created!"]
      redirect_to @user
    else
      emails_unentered = params[:user][:emails_attributes].select do |key, val|
        val['address'].blank?
      end.count
      (emails_unentered).times { @user.emails.build }
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
