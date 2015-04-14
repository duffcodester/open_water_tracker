@comsatrack.factory 'Users', [
  '$resource'
  ($resource) ->
    $resource('/api/users/:id.json',
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
