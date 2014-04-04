module SwimRecordsHelper
  SWIMRECORDS_PARAMS = [:swimmer_id,
                        :check_in,
                        :check_out,
                        :check_in_user_id,
                        :check_out_user_id,
                        :completed,
                        :id
                       ]

  def swim_record_params
    params.require(:swim_record).permit(SWIMRECORDS_PARAMS)
  end
end

