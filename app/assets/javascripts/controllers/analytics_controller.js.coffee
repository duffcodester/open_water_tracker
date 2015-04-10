@comsatrack.controller 'AnalyticsCtrl', [
  '$scope'
  'Analytics'

  @AnalyticsCtrl = ($scope, Analytics) ->
    Analytics.data()
    .$promise.then (data) ->
      swimmerCount2014 = data.total_swims_2014
      uniqueSwimmers2014 = data.unique_swimmers_2014
      swimmerCount2015 = data.total_swims_2015
      uniqueSwimmers2015 = data.unique_swimmers_2015

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
          swimmerCount2015
          swimmerCount2015
          uniqueSwimmers2015
          uniqueSwimmers2015
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
