@comsatrack.controller 'AnalyticsCtrl', [
  '$scope'
  'Analytics'

  @AnalyticsCtrl = ($scope, Analytics) ->
    Analytics.data()
    .$promise.then (data) ->
      swimmerCount2017 = data.total_swims_2017
      uniqueSwimmers2017 = data.unique_swimmers_2017

      chart1 = {}
      chart1.type = 'ColumnChart'
      chart1.data = [
        [
          'Year'
          'Total Swims'
          { role: 'annotation' }
          'Unique Swimmers'
          { role: 'annotation' }
        ]
        [
          '2017'
          swimmerCount2017
          swimmerCount2017
          uniqueSwimmers2017
          uniqueSwimmers2017
        ]
      ]

      chart1.options =
        titleTextStyle: {color: '#797575' }
        displayExactValues: true
        is3D: true
        legend: { position: 'bottom', textStyle: {color: '#797575' } }
        colors: ['#4A148C', '#AB47BC']
        hAxis: { textStyle: {color: '#797575' } }
        vAxis: { textStyle: {color: '#797575'} }
        annotations: { textStyle: { color: '#797575' } }

      $scope.chart = chart1
]
