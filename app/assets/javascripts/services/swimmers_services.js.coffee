@comsatrack.factory 'Swimmers', [
  '$resource'
  ($resource) ->
    $resource('/swimmers/:id.json?in_state=:inState',
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
