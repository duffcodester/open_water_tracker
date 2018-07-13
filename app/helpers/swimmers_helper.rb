module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :phone_number,
                    :id,
                    :swimmer_checked_in,
                    :waiver_received]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
