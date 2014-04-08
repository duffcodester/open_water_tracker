@comsatrack.factory 'SwimRecords', [
  '$resource'
  ($resource) ->
    $resource('/swim_records/:id.json', {id: '@id'},
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
