/* ========================================================================
 * Bootstrap: tab.js v3.0.3
 * http://getbootstrap.com/javascript/#tabs
 * ========================================================================
 * Copyright 2013 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================================== */
+function($){"use strict";var Tab=function(element){this.element=$(element)};Tab.prototype.show=function(){var $this=this.element,$ul=$this.closest("ul:not(.dropdown-menu)"),selector=$this.data("target");if(selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),!$this.parent("li").hasClass("active")){var previous=$ul.find(".active:last a")[0],e=$.Event("show.bs.tab",{relatedTarget:previous});if($this.trigger(e),!e.isDefaultPrevented()){var $target=$(selector);this.activate($this.parent("li"),$ul),this.activate($target,$target.parent(),function(){$this.trigger({type:"shown.bs.tab",relatedTarget:previous})})}}},Tab.prototype.activate=function(element,container,callback){function next(){$active.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),element.addClass("active"),transition?(element[0].offsetWidth,element.addClass("in")):element.removeClass("fade"),element.parent(".dropdown-menu")&&element.closest("li.dropdown").addClass("active"),callback&&callback()}var $active=container.find("> .active"),transition=callback&&$.support.transition&&$active.hasClass("fade");transition?$active.one($.support.transition.end,next).emulateTransitionEnd(150):next(),$active.removeClass("in")};var old=$.fn.tab;$.fn.tab=function(option){return this.each(function(){var $this=$(this),data=$this.data("bs.tab");data||$this.data("bs.tab",data=new Tab(this)),"string"==typeof option&&data[option]()})},$.fn.tab.Constructor=Tab,$.fn.tab.noConflict=function(){return $.fn.tab=old,this},$(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault(),$(this).tab("show")})}(jQuery);