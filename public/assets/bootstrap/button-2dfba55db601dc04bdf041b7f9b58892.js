/* ========================================================================
 * Bootstrap: button.js v3.0.3
 * http://getbootstrap.com/javascript/#buttons
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
+function($){"use strict";var Button=function(element,options){this.$element=$(element),this.options=$.extend({},Button.DEFAULTS,options)};Button.DEFAULTS={loadingText:"loading..."},Button.prototype.setState=function(state){var d="disabled",$el=this.$element,val=$el.is("input")?"val":"html",data=$el.data();state+="Text",data.resetText||$el.data("resetText",$el[val]()),$el[val](data[state]||this.options[state]),setTimeout(function(){"loadingText"==state?$el.addClass(d).attr(d,d):$el.removeClass(d).removeAttr(d)},0)},Button.prototype.toggle=function(){var $parent=this.$element.closest('[data-toggle="buttons"]'),changed=!0;if($parent.length){var $input=this.$element.find("input");"radio"===$input.prop("type")&&($input.prop("checked")&&this.$element.hasClass("active")?changed=!1:$parent.find(".active").removeClass("active")),changed&&$input.prop("checked",!this.$element.hasClass("active")).trigger("change")}changed&&this.$element.toggleClass("active")};var old=$.fn.button;$.fn.button=function(option){return this.each(function(){var $this=$(this),data=$this.data("bs.button"),options="object"==typeof option&&option;data||$this.data("bs.button",data=new Button(this,options)),"toggle"==option?data.toggle():option&&data.setState(option)})},$.fn.button.Constructor=Button,$.fn.button.noConflict=function(){return $.fn.button=old,this},$(document).on("click.bs.button.data-api","[data-toggle^=button]",function(e){var $btn=$(e.target);$btn.hasClass("btn")||($btn=$btn.closest(".btn")),$btn.button("toggle"),e.preventDefault()})}(jQuery);