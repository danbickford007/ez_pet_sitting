class ProfilesController < ApplicationController

  def index
    @user = User.find(session[:user])
    if @addresses = @user.addresses
      @partial = "/profiles/my_info.html"
    else
      @address = Address.new
      @partial = "/profiles/my_info_form.html.erb"
    end    
    if @user.pets && @user.pets.count > 0
      @pets = @user.pets
      @partial_2 = "/profiles/pets_list"
    else
      @partial_2 = "/profiles/no_pets"
    end
  end

  def new
    if params[:pet]
      @partial = "/profiles/new_pet"
    else
      @partial = "/profiles/new_address"
    end
    render "shared/lightbox"
  end

  def create_address
    Address.create(:street=>params[:street], :city=>params[:city], :user_id=>session[:user][:id])
    redirect_to "/profiles"
  end

  def create
    if params[:address]
      Address.create(params[:address].merge(:user_id=>session[:user][:id]))
    end
    if params[:pet]
      Pet.create(params[:pet].merge(:user_id=>session[:user][:id]))
    end
    redirect_to "/profiles"
  end

  def show
  end
end
