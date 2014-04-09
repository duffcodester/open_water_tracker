(function() {
  describe('Check In', function() {
    var $httpBackend, compileDirective, element, scope, template;
    scope = element = $httpBackend = void 0;
    template = "<button class='btn btn-success'>Check In</button>";
    beforeEach(angular.mock.module('comsatrack'));
    beforeEach(inject(function(_$httpBackend_, $rootScope, $compile) {
      $httpBackend = _$httpBackend_;
      $httpBackend.expectGET('/check_in').respond(template);
      scope = $rootScope.$new();
      return scope.swimmer = 'swimmer';
    }));
    compileDirective = (function(_this) {
      return function() {
        inject(function($compile) {
          var html;
          html = $compile("<check-in></check-in>")(scope);
          return element = html.find('button');
        });
        return scope.$digest();
      };
    })(this);
    return it('should work', function() {
      compileDirective();
      $httpBackend.flush();
      console.log(scope);
      return expect(scope.test).toEqual('foo');
    });
  });

}).call(this);
