/* ========================================================================
 * Bootstrap: dropdown.js v3.0.3
 * http://getbootstrap.com/javascript/#dropdowns
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
+function($){"use strict";function clearMenus(){$(backdrop).remove(),$(toggle).each(function(e){var $parent=getParent($(this));$parent.hasClass("open")&&($parent.trigger(e=$.Event("hide.bs.dropdown")),e.isDefaultPrevented()||$parent.removeClass("open").trigger("hidden.bs.dropdown"))})}function getParent($this){var selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&/#/.test(selector)&&selector.replace(/.*(?=#[^\s]*$)/,""));var $parent=selector&&$(selector);return $parent&&$parent.length?$parent:$this.parent()}var backdrop=".dropdown-backdrop",toggle="[data-toggle=dropdown]",Dropdown=function(element){$(element).on("click.bs.dropdown",this.toggle)};Dropdown.prototype.toggle=function(e){var $this=$(this);if(!$this.is(".disabled, :disabled")){var $parent=getParent($this),isActive=$parent.hasClass("open");if(clearMenus(),!isActive){if("ontouchstart"in document.documentElement&&!$parent.closest(".navbar-nav").length&&$('<div class="dropdown-backdrop"/>').insertAfter($(this)).on("click",clearMenus),$parent.trigger(e=$.Event("show.bs.dropdown")),e.isDefaultPrevented())return;$parent.toggleClass("open").trigger("shown.bs.dropdown"),$this.focus()}return!1}},Dropdown.prototype.keydown=function(e){if(/(38|40|27)/.test(e.keyCode)){var $this=$(this);if(e.preventDefault(),e.stopPropagation(),!$this.is(".disabled, :disabled")){var $parent=getParent($this),isActive=$parent.hasClass("open");if(!isActive||isActive&&27==e.keyCode)return 27==e.which&&$parent.find(toggle).focus(),$this.click();var $items=$("[role=menu] li:not(.divider):visible a",$parent);if($items.length){var index=$items.index($items.filter(":focus"));38==e.keyCode&&index>0&&index--,40==e.keyCode&&index<$items.length-1&&index++,~index||(index=0),$items.eq(index).focus()}}}};var old=$.fn.dropdown;$.fn.dropdown=function(option){return this.each(function(){var $this=$(this),data=$this.data("bs.dropdown");data||$this.data("bs.dropdown",data=new Dropdown(this)),"string"==typeof option&&data[option].call($this)})},$.fn.dropdown.Constructor=Dropdown,$.fn.dropdown.noConflict=function(){return $.fn.dropdown=old,this},$(document).on("click.bs.dropdown.data-api",clearMenus).on("click.bs.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("click.bs.dropdown.data-api",toggle,Dropdown.prototype.toggle).on("keydown.bs.dropdown.data-api",toggle+", [role=menu]",Dropdown.prototype.keydown)}(jQuery);