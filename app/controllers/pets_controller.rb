class PetsController < ApplicationController

  def index
  end

  def new
    @pet = Pet.find(params[:id])
    @options = {'height'=>'300', 'width'=>'300'}.to_json
    @partial = "/pets/update"
    render "shared/lightbox"
  end

  def create
    Pet.create(params[:pet])
    redirect_to '/profiles'
  end

  def update
    Pet.find(params[:id]).update_attributes(params[:pet])
    redirect_to '/profiles'
  end

  def destroy
    if !params[:accepted]
      @yes_path = "/pets/destroy?id=#{params[:id]}&accepted=true"
      @partial = "/shared/are_you_sure"
      render "shared/lightbox"
    else
      pet = Pet.find(params[:id])
      pet.destroy
      redirect_to "/profiles"
    end
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @options = {'height'=>'300', 'width'=>'300'}.to_json
    @partial = "/pets/show"
    render "shared/lightbox"
  end

end
