(function() {
  describe('Swimmers', function() {
    var $httpBackend;
    $httpBackend = void 0;
    beforeEach(angular.mock.module('comsatrack'));
    beforeEach(inject(function(_$httpBackend_, $resource) {
      var resource;
      $httpBackend = _$httpBackend_;
      $httpBackend.expectGET('/swimmers.json').respond([]);
      return resource = $resource(Swimmers);
    }));
    return it('should set the certification names and users on scope', function() {
      var swimmers;
      swimmers = Swimmers.index();
      return $httpBackend.flush();
    });
  });

}).call(this);
