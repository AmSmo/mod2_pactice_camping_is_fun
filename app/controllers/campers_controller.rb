class CampersController < ApplicationController
  before_action :find_camper, only: [:show, :edit, :update]
  before_action :new_camper, only: [:new, :create]
  
  def index
    @campers = Camper.all
  end

  def show

  end

  def new
     if flash[:params]
            @camper.update(flash[:params])
      end
  end

  def create
    @camper.update(camper_params)
    if @camper.valid?
        redirect_to camper_path(@camper)
    else
        flash[:errors] = @camper.errors.full_messages
        flash[:params] = camper_params
        redirect_to new_camper_path
    end
  end

  private

  def find_camper
    @camper = Camper.find(params[:id])
  end

  def new_camper
    @camper = Camper.new
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
end
