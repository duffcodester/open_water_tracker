@comsatrack.factory 'SwimRecords', [
  '$resource'
  ($resource) ->
    $resource('/api/swim_records/:id.json',
      id: '@id',
    ,
      index:
        method: 'GET'
        isArray: true
        cache: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
