module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :phone_number,
                    :phone_added,
                    :id,
                    :swimmer_checked_in,
                    :waiver_received,
                    :waiver_received_on
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
