class BookingsController < ApplicationController
    # GET /flights/new
  def new
    @booking = Booking.new
  end

  # POST /flights
  # POST /flights.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to flights_path, notice: 'Booking was successfully done.' }
        format.json { render :show, status: :created, location: flights_path }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
        params.require(:booking).permit(:flight_id, :passanger_id)
    end

end
