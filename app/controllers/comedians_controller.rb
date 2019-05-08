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

    # I would change the order of the iVar assignment above so that the average age and cities reflect only the comedians on the page (in case of filtering). It would look like this:
    # if params[:age] == nil
    #   @comedians = Comedian.all
    # else
    #   @comedians = Comedian.by_page(params[:age])
    # end
    # @average_age = @comedians.average_age(params[:age])
    # @cities = @comedians.cities
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
