module SwimRecordsHelper
  SWIMRECORDS_PARAMS = [:swimmer_id,
                        :check_in,
                        :check_out,
                        :check_in_user_id,
                        :check_out_user_id,
                        :check_in_first_name,
                        :check_in_last_name,
                        :check_out_first_name,
                        :check_out_last_name,
                        :completed,
                        :id
                       ]

  def swim_record_params
    params.require(:swim_record).permit(SWIMRECORDS_PARAMS)
  end
end
