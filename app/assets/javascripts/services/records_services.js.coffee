@comsatrack.factory 'Records', ['$resource',
  ($resource) ->
    $resource('/records.json', {}, { index: { method: 'GET', isArray: true}})
]
