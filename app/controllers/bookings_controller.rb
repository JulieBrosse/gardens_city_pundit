class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update ]
  before_action :set_booking_format, only: [:destroy ]


  def index
  end

  def my_bookings
    @bookings = BookingPolicy::Scope.new(current_user, Booking).scope.where(booker_id: current_user.id)
  end

  def show
    if params[:id] == current_user.id.to_s
      @booking = Booking.find(params[:garden_id])
    elsif
      @booking = Booking.find(params[:id])
    else
      @booking = Booking.find(params[:garden_id])
    end
    authorize @booking
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @garden = Garden.find params[:garden_id]
    @booking = @garden.bookings.build(date: DateTime.now.to_date)
    @booking.booker_id = current_user.id.to_i
    authorize @booking
    if @booking.save
      redirect_to garden_booking_path( current_user, @booking)
    end
  end

  def update
  end

  def edit
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_booking_format
    @booking = Booking.find(params[:format])
  end
  def booking_params
    params.require(:booking).permit(:garden_id, :booker_id, :date)
  end
end
