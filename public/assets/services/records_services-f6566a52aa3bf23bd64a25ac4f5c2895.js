(function(){this.comsatrack.factory("Records",["$resource",function($resource){return $resource("/records.json",{},{index:{method:"GET",isArray:!0}})}])}).call(this);