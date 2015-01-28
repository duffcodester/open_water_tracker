@comsatrackFilters.filter 'booleanToWords', ->
  (input) ->
    if input then 'Yes' else 'No'

.filter 'unique', [
  '$parse'
  ($parse) ->
    'use strict'
    return (items, filterOn) ->
      return items  if filterOn is false
      if (filterOn or angular.isUndefined(filterOn)) and angular.isArray(items)
        newItems = []
        get = (if angular.isString(filterOn) then $parse(filterOn) else (item) ->
          item
        )
        extractValueToCompare = (item) ->
          (if angular.isObject(item) then get(item) else item)

        angular.forEach items, (item) ->
          isDuplicate = false
          i = 0

          while i < newItems.length
            if angular.equals(extractValueToCompare(newItems[i]), extractValueToCompare(item))
              isDuplicate = true
              break
            i++
          newItems.push item  unless isDuplicate
          return

        items = newItems
      items
]
