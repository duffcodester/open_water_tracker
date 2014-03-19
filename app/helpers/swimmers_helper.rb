module SwimmersHelper
  SWIMMER_PARAMS = [:first_name,
                    :last_name,
                    :usms_number,
                    :lmsc,
                   ]

  def swimmer_params
    params.require(:swimmer).permit(:first_name, :last_name, :usms_number, :lmsc)
  end
end
