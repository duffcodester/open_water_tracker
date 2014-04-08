@comsatrack.factory 'Swimmers', [
  '$resource'
  ($resource) ->
    $resource('/swimmers/:id.json', {id: '@id'},
      index:
        method: 'GET'
        isArray: true

      update:
        method: 'PUT'

      create:
        method: 'POST'
    )
]
