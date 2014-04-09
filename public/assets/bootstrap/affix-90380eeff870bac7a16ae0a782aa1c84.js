/* ========================================================================
 * Bootstrap: affix.js v3.0.3
 * http://getbootstrap.com/javascript/#affix
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
+function($){"use strict";var Affix=function(element,options){this.options=$.extend({},Affix.DEFAULTS,options),this.$window=$(window).on("scroll.bs.affix.data-api",$.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",$.proxy(this.checkPositionWithEventLoop,this)),this.$element=$(element),this.affixed=this.unpin=null,this.checkPosition()};Affix.RESET="affix affix-top affix-bottom",Affix.DEFAULTS={offset:0},Affix.prototype.checkPositionWithEventLoop=function(){setTimeout($.proxy(this.checkPosition,this),1)},Affix.prototype.checkPosition=function(){if(this.$element.is(":visible")){var scrollHeight=$(document).height(),scrollTop=this.$window.scrollTop(),position=this.$element.offset(),offset=this.options.offset,offsetTop=offset.top,offsetBottom=offset.bottom;"object"!=typeof offset&&(offsetBottom=offsetTop=offset),"function"==typeof offsetTop&&(offsetTop=offset.top()),"function"==typeof offsetBottom&&(offsetBottom=offset.bottom());var affix=null!=this.unpin&&scrollTop+this.unpin<=position.top?!1:null!=offsetBottom&&position.top+this.$element.height()>=scrollHeight-offsetBottom?"bottom":null!=offsetTop&&offsetTop>=scrollTop?"top":!1;this.affixed!==affix&&(this.unpin&&this.$element.css("top",""),this.affixed=affix,this.unpin="bottom"==affix?position.top-scrollTop:null,this.$element.removeClass(Affix.RESET).addClass("affix"+(affix?"-"+affix:"")),"bottom"==affix&&this.$element.offset({top:document.body.offsetHeight-offsetBottom-this.$element.height()}))}};var old=$.fn.affix;$.fn.affix=function(option){return this.each(function(){var $this=$(this),data=$this.data("bs.affix"),options="object"==typeof option&&option;data||$this.data("bs.affix",data=new Affix(this,options)),"string"==typeof option&&data[option]()})},$.fn.affix.Constructor=Affix,$.fn.affix.noConflict=function(){return $.fn.affix=old,this},$(window).on("load",function(){$('[data-spy="affix"]').each(function(){var $spy=$(this),data=$spy.data();data.offset=data.offset||{},data.offsetBottom&&(data.offset.bottom=data.offsetBottom),data.offsetTop&&(data.offset.top=data.offsetTop),$spy.affix(data)})})}(jQuery);