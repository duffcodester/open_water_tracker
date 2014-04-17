module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :middle_initial,
                    :last_name,
                    :usms_number,
                    :lmsc,
                    :phone_number,
                    :phone_added,
                    :id
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
