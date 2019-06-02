@comsatrack.factory 'Swimmers', [
  '$resource'
  ($resource) ->
    $resource('/api/swimmers/:id.json',
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
        isArray: true

      destroy:
        method: 'DELETE'
    )
]
