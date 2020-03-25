@comsatrack.controller 'AnalyticsCtrl', [
  '$scope'
  'Analytics'

  @AnalyticsCtrl = ($scope, Analytics) ->
    Analytics.data()
    .$promise.then (data) ->

      chart = {}
      chart.type = 'ColumnChart'
      chart.data = [
        [
          'Year'
          'Total Swims'
          { role: 'annotation' }
          'Unique Swimmers'
          { role: 'annotation' }
        ]
      ]

      for yearData in data
        chart.data.push [
          yearData.year.toString()
          yearData.total_swims
          yearData.total_swims
          yearData.unique_swimmers
          yearData.unique_swimmers
        ]

      chart.options =
        titleTextStyle: {color: '#797575' }
        displayExactValues: true
        is3D: true
        legend: { position: 'bottom', textStyle: {color: '#797575' } }
        colors: ['#4A148C', '#AB47BC']
        hAxis: { textStyle: {color: '#797575' } }
        vAxis: { textStyle: {color: '#797575'} }
        annotations: { textStyle: { color: '#797575' } }

      $scope.chart = chart
]
