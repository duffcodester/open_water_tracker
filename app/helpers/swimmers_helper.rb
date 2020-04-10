module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :phone_number,
                    :phone_added,
                    :id,
                    :swimmer_checked_in,
                    :deleted_at
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
