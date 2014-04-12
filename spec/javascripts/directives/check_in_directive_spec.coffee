describe 'Check In', ->
  scope = element = $httpBackend = undefined
  template = "<button class='btn-xs btn-success'>Check In</button>"

  beforeEach angular.mock.module('comsatrack')

  beforeEach inject((_$httpBackend_, $rootScope, $compile) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/check_in').respond template
    scope = $rootScope.$new()
    scope.swimmer = 'swimmer'
  )

  # Passes in scope around function into function
  compileDirective = =>
    inject ($compile) ->
      html = $compile("<check-in></check-in>") scope
      element = html.find('button')

    scope.$digest()

  it 'should work', ->
    compileDirective()
    $httpBackend.flush()
    console.log(scope)
    expect(scope.test).toEqual 'foo'
