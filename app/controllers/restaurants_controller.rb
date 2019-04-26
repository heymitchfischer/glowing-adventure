class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params(params))

    respond_to do |format|
      if @restaurant.save
        format.html do
          flash[:success] = "Restaurant Account Created!"
          redirect_to "/restaurants"
        end
      else
        p @restaurant.errors.any?
        format.html {render 'new'}
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update(restaurant_params(params))
        format.html do
          flash[:success] = "Restaurant successfully updated."
          redirect_to "/restaurants/#{@restaurant.id}"
        end
      else
        format.html {render 'edit'}
      end
    end 
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to "/restaurants"
  end


  private
    def restaurant_params(params)
      params.require(:restaurant).permit(:name)
    end
end
