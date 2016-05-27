@comsatrack.controller 'AnalyticsCtrl', [
  '$scope'
  'Analytics'

  @AnalyticsCtrl = ($scope, Analytics) ->
    Analytics.data()
    .$promise.then (data) ->
      swimmerCount2016 = data.total_swims_2016
      uniqueSwimmers2016 = data.unique_swimmers_2016

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
          '2014'
          5481
          '5481'
          772
          '772'
        ]
        [
          '2015'
          1979
          '1979'
          417
          '417'
        ]
        [
          '2016'
          swimmerCount2016
          swimmerCount2016
          uniqueSwimmers2016
          uniqueSwimmers2016
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
