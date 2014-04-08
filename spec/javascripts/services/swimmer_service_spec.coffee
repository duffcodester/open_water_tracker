describe 'Swimmers', ->
  $httpBackend = undefined

  beforeEach angular.mock.module('comsatrack')

  beforeEach inject((_$httpBackend_, $resource) ->
    $httpBackend = _$httpBackend_

    $httpBackend.expectGET('/swimmers.json').respond []
    # $httpBackend.expectPUT('/swimmers/1.json').respond 'foo'

    resource = $resource Swimmers
  )

  it 'should set the certification names and users on scope', ->
    swimmers = Swimmers.index()

    $httpBackend.flush()
