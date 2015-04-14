@comsatrack.factory 'Analytics', [
  '$resource'
  ($resource) ->
    $resource('/api/analytics/:id.json', id: '@id',
      data:
        method: 'GET'
        cache: true
    )
]
