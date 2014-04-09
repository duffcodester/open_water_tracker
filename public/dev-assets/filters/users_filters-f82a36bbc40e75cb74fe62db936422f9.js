(function() {
  this.comsatrackFilters.filter('age', function() {
    return function(input) {
      var age, birthDate, m, today;
      if (!input) {
        return '';
      }
      today = new Date();
      birthDate = new Date(input);
      age = today.getFullYear() - birthDate.getFullYear();
      m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      return age;
    };
  }).filter('booleanToWords', function() {
    return function(input) {
      if (input) {
        return 'Yes';
      } else {
        return 'No';
      }
    };
  });

}).call(this);
