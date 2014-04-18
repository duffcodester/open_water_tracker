 @comsatrack.directive "clickToEdit", ->
  restrict: "A"
  replace: true
  templateUrl: '/click_to_edit'
  scope:
    swimmer: "=clickToEdit"

  controller: ($scope) ->
    $scope.view =
      editableValue: $scope.swimmer
      editorEnabled: false

    $scope.enableEditor = ->
      $scope.view.editorEnabled = true
      $scope.view.editableValue = $scope.swimmer
      return

    $scope.disableEditor = ->
      $scope.view.editorEnabled = false
      return

    $scope.save = ->
      $scope.swimmer = $scope.view.editableValue
      $scope.disableEditor()

      return

    return
