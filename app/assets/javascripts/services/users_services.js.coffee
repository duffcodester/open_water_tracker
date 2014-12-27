@comsatrack.factory 'Users', [
  '$resource'
  ($resource) ->
    $resource('/users/:id.json',
      id: '@id',
    ,
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
