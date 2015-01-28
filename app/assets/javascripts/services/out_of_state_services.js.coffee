@comsatrack.factory 'OutOfState', [
  '$resource'
  ($resource) ->
    $resource('/api/out_of_state/:id.json', id: '@id',
      data:
        method: 'GET'
        isArray: true
    )
]
