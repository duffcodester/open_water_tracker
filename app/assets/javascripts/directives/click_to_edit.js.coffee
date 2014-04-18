 @comsatrack.directive "clickToEdit", ->
  editorTemplate = "<div class=\"click-to-edit\">" + "<div ng-hide=\"view.editorEnabled\">" + "{{value}} " + "<a ng-click=\"enableEditor()\">Add Phone</a>" + "</div>" + "<div ng-show=\"view.editorEnabled\">" + "<input ng-model=\"view.editableValue\">" + "<a href=\"#\" ng-click=\"save()\">Save</a>" + " or " + "<a ng-click=\"disableEditor()\">cancel</a>." + "</div>" + "</div>"
  restrict: "A"
  replace: true
  template: editorTemplate
  scope:
    value: "=clickToEdit"

  controller: ($scope) ->
    $scope.view =
      editableValue: $scope.value
      editorEnabled: false

    $scope.enableEditor = ->
      $scope.view.editorEnabled = true
      $scope.view.editableValue = $scope.value
      return

    $scope.disableEditor = ->
      $scope.view.editorEnabled = false
      return

    $scope.save = ->
      $scope.value = $scope.view.editableValue
      $scope.disableEditor()
      return

    return

