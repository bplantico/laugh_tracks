# app/controllers/comedians_controller.rb

class ComediansController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @average_age = Comedian.average_age(params[:age])
    @cities = Comedian.cities

    if params[:age] == nil
      @cities = Comedian.cities
      @comedians = Comedian.all
    else
      @cities = Comedian.cities(params[:age])
      @comedians = Comedian.by_age(params[:age])
    end
  end

  def new
    @comedian = Comedian.new
  end

  def create
    comedian = Comedian.new(comedian_params)
    comedian.save
    redirect_to action: 'index'
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city)
  end

end
