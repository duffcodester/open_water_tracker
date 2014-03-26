module AnalyticsHelper
  ANALYTIC_PARAMS = [:start_date,
                     :end_date,
                    ]

  def analytic_params
    params.require(:analytic).permit(ANALYTIC_PARAMS)
  end
end
