module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :usms_number,
                    :lmsc,
                    :phone_number,
                    :phone_added,
                    :id,
                    :in_state,
                    :swimmer_checked_in
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
