module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :mi,
                    :last_name,
                    :usms_number,
                    :lmsc,
                    :phone_number,
                    :phone_added,
                    :id,
                    :swimmer_checked_in,
                    :reviewed_waiver,
                    :reviewed_waiver_date
                   ]

  def swimmer_params
    params.require(:swimmer).permit(SWIMMER_PARAMS)
  end
end
