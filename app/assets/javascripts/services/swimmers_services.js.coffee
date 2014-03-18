@weowepro.factory 'Swimmers', ['$resource',
  ($resource) ->
    $resource('/swimmers.json', {}, { index: { method: 'GET', isArray: true}})
]
