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
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.garden = Garden.find(params[:garden_id])
    @booking.booker_id = current_user.id
    @booking.date = DateTime.now.to_date
    @booking.save

#    @booking.garden = @garden
#    @booking.booker_id = current_user
    redirect_to root_path
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
