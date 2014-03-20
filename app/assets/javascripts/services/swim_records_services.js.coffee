@weowepro.factory 'SwimRecords', ['$resource',
  ($resource) ->
    $resource('/swim_records.json', {}, { index: { method: 'GET', isArray: true}})
]
