module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :phone_number,
                    :phone_added,
                    :id,
                    :swimmer_checked_in,
                    :deleted_at,
                    :email,
                    :emergency_first,
                    :emergency_last,
                    :emergency_phone,
                    :date_of_birth
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
