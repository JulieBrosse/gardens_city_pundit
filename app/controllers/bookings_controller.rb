class BookingsController < ApplicationController
  def index
  end

  def my_bookings
    @bookings = BookingPolicy::Scope.new(current_user, Booking).scope.where(user: current_user)
  end

  def show
    @booking.garden = @garden
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @garden = Garden.find params[:garden_id]
    @booking = @garden.bookings.build(booker: current_user, owner: @garden.user)
    authorize @booking
    if @booking.save
      redirect_to @garden
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:garden_id, :booker_id, :date)
  end
end
