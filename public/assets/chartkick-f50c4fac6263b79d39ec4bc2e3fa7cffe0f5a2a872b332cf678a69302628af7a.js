!function(t,e){if("object"==typeof exports&&"object"==typeof module)module.exports=e();else if("function"==typeof define&&define.amd)define([],e);else{var n=e();for(var o in n)("object"==typeof exports?exports:t)[o]=n[o]}}("undefined"!=typeof self?self:this,function(){return function(t){function e(o){if(n[o])return n[o].exports;var i=n[o]={i:o,l:!1,exports:{}};return t[o].call(i.exports,i,i.exports,e),i.l=!0,i.exports}var n={};return e.m=t,e.c=n,e.d=function(t,n,o){e.o(t,n)||Object.defineProperty(t,n,{configurable:!1,enumerable:!0,get:o})},e.n=function(t){var n=t&&t.__esModule?function(){return t["default"]}:function(){return t};return e.d(n,"a",n),n},e.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},e.p="",e(e.s=1)}([function(t,e){"use strict";function n(t){return"[object Array]"===Object.prototype.toString.call(t)}function o(t){return t instanceof Function}function i(t){return!o(t)&&t instanceof Object}function r(t,e){var o=void 0;for(o in e)i(e[o])||n(e[o])?(i(e[o])&&!i(t[o])&&(t[o]={}),n(e[o])&&!n(t[o])&&(t[o]=[]),r(t[o],e[o])):e[o]!==undefined&&(t[o]=e[o])}function a(t,e){var n={};return r(n,t),r(n,e),n}function s(t){var e=void 0,n=void 0,o=void 0,i=void 0,r=void 0,a=void 0,s=void 0,l=void 0,u=void 0,c=void 0,d=void 0;return"[object Date]"===(c=Object.prototype.toString.call(t))?t:"[object String]"===c&&(o=t.match(_))?(d=parseInt(o[1],10),a=parseInt(o[3],10)-1,e=parseInt(o[5],10),n=parseInt(o[7],10),r=o[9]?parseInt(o[9],10):0,u=o[11]?parseInt(o[11],10):0,i=o[12]?1e3*parseFloat(S+o[12].slice(1)):0,l=Date.UTC(d,a,e,n,r,u,i),o[13]&&o[14]&&(s=60*o[15],o[17]&&(s+=parseInt(o[17],10)),l-=60*(s*="-"===o[14]?-1:1)*1e3),new Date(l)):void 0}function l(t){var e=void 0,n=void 0,o=void 0;for(e=0;e<t.length;e++)for(o=t[e].data,n=0;n<o.length;n++)if(o[n][1]<0)return!0;return!1}function u(t){return""+t}function c(t){return parseFloat(t)}function d(t){var e=void 0,n=void 0,o=void 0,i=void 0;if("object"!==(void 0===t?"undefined":C(t)))if("number"==typeof t)t=new Date(1e3*t);else{if(e=(t=u(t)).match(k))return n=parseInt(e[1],10),o=parseInt(e[3],10)-1,i=parseInt(e[5],10),new Date(n,o,i);t=s(t.replace(/ /,"T").replace(" ","").replace("UTC","Z"))||new Date(t)}return t}function f(t){if(!n(t)){var e=[],o=void 0;for(o in t)t.hasOwnProperty(o)&&e.push([o,t[o]]);t=e}return t}function p(t,e,n,o,i,r,s,u){return function(c,d,f){var p=c.data,h=a({},t);return h=a(h,f||{}),(c.hideLegend||"legend"in d)&&e(h,d.legend,c.hideLegend),d.title&&n(h,d.title),"min"in d?o(h,d.min):l(p)||o(h,0),d.max&&i(h,d.max),"stacked"in d&&r(h,d.stacked),d.colors&&(h.colors=d.colors),d.xtitle&&s(h,d.xtitle),d.ytitle&&u(h,d.ytitle),h=a(h,d.library||{})}}function h(t,e){return t[0].getTime()-e[0].getTime()}function g(t,e){return t[0]-e[0]}function v(t,e){return t-e}function m(t){return 0===t.getMilliseconds()&&0===t.getSeconds()}function y(t){return m(t)&&0===t.getMinutes()}function z(t){return y(t)&&0===t.getHours()}function M(t,e){return z(t)&&t.getDay()===e}function b(t){return z(t)&&1===t.getDate()}function x(t){return b(t)&&0===t.getMonth()}function w(t){return!isNaN(d(t))&&u(t).length>=6}function A(t,e,n){if(t=t||"",n.prefix&&(e<0&&(e*=-1,t+="-"),t+=n.prefix),n.thousands||n.decimal){var o=(e=u(e)).split(".");e=o[0],n.thousands&&(e=e.replace(/\B(?=(\d{3})+(?!\d))/g,n.thousands)),o.length>1&&(e+=(n.decimal||".")+o[1])}return t+e+(n.suffix||"")}Object.defineProperty(e,"__esModule",{value:!0});var C="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},k=/^(\d\d\d\d)(-)?(\d\d)(-)?(\d\d)$/i,_=/(\d\d\d\d)(-)?(\d\d)(-)?(\d\d)(T)?(\d\d)(:)?(\d\d)?(:)?(\d\d)?([.,]\d+)?($|Z|([+-])(\d\d)(:)?(\d\d)?)/i,S=String(1.5).charAt(1);e.formatValue=A,e.jsOptionsFunc=p,e.merge=a,e.isArray=n,e.isFunction=o,e.toStr=u,e.toFloat=c,e.toDate=d,e.toArr=f,e.sortByTime=h,e.sortByNumberSeries=g,e.sortByNumber=v,e.isMinute=m,e.isHour=y,e.isDay=z,e.isWeek=M,e.isMonth=b,e.isYear=x,e.isDate=w},function(t,e,n){"use strict";function o(t){return t&&t.__esModule?t:{"default":t}}function i(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}function r(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):t.__proto__=e)}function a(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function s(t,e){document.body.innerText?t.innerText=e:t.textContent=e}function l(t,e){s(t,"Error Loading Chart: "+e),t.style.color="#ff0000"}function u(t,e,n){P.push([t,e,n]),c()}function c(){if(L<I){var t=P.shift();t&&(L++,f(t[0],t[1],t[2]),c())}}function d(){L--,c()}function f(t,e,n){p(e,n,function(e,n,o){var i="string"==typeof o?o:o.message;l(t,i)})}function p(t,e,n){var o=window.jQuery||window.Zepto||window.$;if(o)o.ajax({dataType:"json",url:t,success:e,error:n,complete:d});else{var i=new XMLHttpRequest;i.open("GET",t,!0),i.setRequestHeader("Content-Type","application/json"),i.onload=function(){d(),200===i.status?e(JSON.parse(i.responseText),i.statusText,i):n(i,"error",i.statusText)},i.send()}}function h(t){try{t.__render()}catch(e){throw l(t.element,e.message),e}}function g(t,e){"string"==typeof e?u(t.element,e,function(e){t.rawData=e,h(t)}):(t.rawData=e,h(t))}function v(t){var e=t.element,n=document.createElement("a");n.download=!0===t.options.download?"chart.png":t.options.download,n.style.position="absolute",n.style.top="20px",n.style.right="20px",n.style.zIndex=1e3,n.style.lineHeight="20px",n.target="_blank";var o=document.createElement("img");o.alt="Download",o.style.border="none",o.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAABCFBMVEUAAADMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMywEsqxAAAAV3RSTlMAAQIDBggJCgsMDQ4PERQaHB0eISIjJCouLzE0OTo/QUJHSUpLTU5PUllhYmltcHh5foWLjI+SlaCio6atr7S1t7m6vsHHyM7R2tze5Obo7fHz9ff5+/1hlxK2AAAA30lEQVQYGUXBhVYCQQBA0TdYWAt2d3d3YWAHyur7/z9xgD16Lw0DW+XKx+1GgX+FRzM3HWQWrHl5N/oapW5RPe0PkBu+UYeICvozTWZVK23Ao04B79oJrOsJDOoxkZoQPWgX29pHpCZEk7rEvQYiNSFq1UMqvlCjJkRBS1R8hb00Vb/TajtBL7nTHE1X1vyMQF732dQhyF2o6SAwrzP06iUQzvwsArlnzcOdrgBhJyHa1QOgO9U1GsKuvjUTjavliZYQ8nNPapG6sap/3nrIdJ6bOWzmX/fy0XVpfzZP3S8OJT3g9EEiJwAAAABJRU5ErkJggg==",n.appendChild(o),e.style.position="relative",t.downloadAttached=!0,m(e,"mouseover",function(o){var i=o.relatedTarget;(!i||i!==this&&!y(this,i)&&t.options.download)&&(n.href=t.toImage(),e.appendChild(n))}),m(e,"mouseout",function(t){var e=t.relatedTarget;e&&(e===this||y(this,e))||n.parentNode&&n.parentNode.removeChild(n)})}function m(t,e,n){t.addEventListener?t.addEventListener(e,n,!1):t.attachEvent("on"+e,function(){return n.call(t,window.event)})}function y(t,e){if(t===e)return!1;for(;e&&e!==t;)e=e.parentNode;return e===t}function z(t){-1===E.indexOf(t)&&E.push(t)}function M(){"Chart"in window&&z(D["default"]),"Highcharts"in window&&z(T["default"]),window.google&&(window.google.setOnLoadCallback||window.google.charts)&&z(j["default"])}function b(t,e){if("PieChart"===e||"GeoChart"===e||"Timeline"===e)return 0===t.length;for(var n=0;n<t.length;n++)if(t[n].data.length>0)return!1;return!0}function x(t,e){e.options.messages&&e.options.messages.empty&&b(e.data,t)?s(e.element,e.options.messages.empty):(w(t,e),e.options.download&&!e.downloadAttached&&"chartjs"===e.adapter&&v(e))}function w(t,e){var n=void 0,o=void 0,i=void 0,r=void 0;for(i="render"+t,r=e.options.adapter,M(),n=0;n<E.length;n++)if(o=E[n],(!r||r===o.name)&&(0,F.isFunction)(o[i]))return e.adapter=o.name,o[i](e);throw E.length>0?new Error("No charting library found for "+t):new Error("No charting libraries found - be sure to include one before your charts")}function A(t){var e=void 0,n=void 0,o=void 0;for(e=0;e<t.length;e++)for(o=(0,F.toArr)(t[e].data),n=0;n<o.length;n++)if(!(0,F.isDate)(o[n][0]))return!0;return!1}function C(t){var e=[],n=void 0,o=void 0;for(n=0;n<t.length;n++){var i={};for(o in t[n])t[n].hasOwnProperty(o)&&(i[o]=t[n][o]);e.push(i)}return e}function k(t,e){var n=void 0,o=t.options,i=t.rawData;for(!(0,F.isArray)(i)||"object"!==O(i[0])||(0,F.isArray)(i[0])?(i=[{name:o.label||"Value",data:i}],t.hideLegend=!0):t.hideLegend=!1,null!==o.discrete&&o.discrete!==undefined||"bubble"===e||"number"===e?t.discrete=o.discrete:t.discrete=A(i),t.discrete&&(e="string"),t.options.xtype&&(e=t.options.xtype),i=C(i),n=0;n<i.length;n++)i[n].data=N((0,F.toArr)(i[n].data),e);return i}function _(t){var e=(0,F.toArr)(t.rawData),n=void 0;for(n=0;n<e.length;n++)e[n]=[(0,F.toStr)(e[n][0]),(0,F.toFloat)(e[n][1])];return e}Object.defineProperty(e,"__esModule",{value:!0}),e.Chartkick=undefined;var S=function(){function t(t,e){for(var n=0;n<e.length;n++){var o=e[n];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(t,o.key,o)}}return function(e,n,o){return n&&t(e.prototype,n),o&&t(e,o),e}}(),O="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},D=o(n(2)),T=o(n(3)),j=o(n(4)),F=n(0),B=window.Chartkick||{},E=[],P=[],L=0,I=4,H=function(t,e){return t="number"===e?(0,F.toFloat)(t):"datetime"===e?(0,F.toDate)(t):(0,F.toStr)(t)},N=function(t,e){var n=[],o=void 0,i=void 0;for(i=0;i<t.length;i++)"bubble"===e?n.push([(0,F.toFloat)(t[i][0]),(0,F.toFloat)(t[i][1]),(0,F.toFloat)(t[i][2])]):(o=H(t[i][0],e),n.push([o,(0,F.toFloat)(t[i][1])]));return"datetime"===e?n.sort(F.sortByTime):"number"===e&&n.sort(F.sortByNumberSeries),n},R=function(){function t(e,n,o){a(this,t);var i=void 0;if("string"==typeof e&&(i=e,!(e=document.getElementById(e))))throw new Error("No element with id "+i);this.element=e,this.options=(0,F.merge)(Z.options,o||{}),this.dataSource=n,Z.charts[e.id]=this,g(this,n),this.options.refresh&&this.startRefresh()}return S(t,[{key:"getElement",value:function(){return this.element}},{key:"getDataSource",value:function(){return this.dataSource}},{key:"getData",value:function(){return this.data}},{key:"getOptions",value:function(){return this.options}},{key:"getChartObject",value:function(){return this.chart}},{key:"getAdapter",value:function(){return this.adapter}},{key:"updateData",value:function(t,e){this.dataSource=t,e&&this.__updateOptions(e),g(this,t)}},{key:"setOptions",value:function(t){this.__updateOptions(t),this.redraw()}},{key:"redraw",value:function(){g(this,this.rawData)}},{key:"refreshData",value:function(){if("string"==typeof this.dataSource){var t=-1===this.dataSource.indexOf("?")?"?":"&";g(this,this.dataSource+t+"_="+(new Date).getTime())}}},{key:"startRefresh",value:function(){var t=this,e=this.options.refresh;if(!this.intervalId){if(!e)throw new Error("No refresh interval");this.intervalId=setInterval(function(){t.refreshData()},1e3*e)}}},{key:"stopRefresh",value:function(){this.intervalId&&(clearInterval(this.intervalId),this.intervalId=null)}},{key:"toImage",value:function(){return"chartjs"===this.adapter?this.chart.toBase64Image():null}},{key:"__updateOptions",value:function(t){var e=t.refresh&&t.refresh!==this.options.refresh;this.options=(0,F.merge)(Z.options,t),e&&(this.stopRefresh(),this.startRefresh())}},{key:"__render",value:function(){this.data=this.__processData(),x(this.constructor.name,this)}}]),t}(),W=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"datetime")}}]),t}(),V=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return _(this)}}]),t}(),Q=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"string")}}]),t}(),U=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"string")}}]),t}(),J=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"datetime")}}]),t}(),G=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return _(this)}}]),t}(),Y=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"number")}}]),t}(),K=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){return k(this,"bubble")}}]),t}(),X=function(){function t(){return a(this,t),i(this,(t.__proto__||Object.getPrototypeOf(t)).apply(this,arguments))}return r(t,R),S(t,[{key:"__processData",value:function(){var t=void 0,e=this.rawData;for(t=0;t<e.length;t++)e[t][1]=(0,F.toDate)(e[t][1]),e[t][2]=(0,F.toDate)(e[t][2]);return e}}]),t}(),Z=e.Chartkick={LineChart:W,PieChart:V,ColumnChart:Q,BarChart:U,AreaChart:J,GeoChart:G,ScatterChart:Y,BubbleChart:K,Timeline:X,charts:{},configure:function(t){for(var e in t)t.hasOwnProperty(e)&&(Z.config[e]=t[e])},eachChart:function(t){for(var e in Z.charts)Z.charts.hasOwnProperty(e)&&t(Z.charts[e])},config:B,options:{},adapters:E}},function(t,e,n){"use strict";function o(t){var e=void 0,n=void 0,o=void 0;for(e=0;e<t.length;e++)for(o=t[e].data,n=0;n<o.length;n++)if(0!=o[n][1])return!1;return!0}Object.defineProperty(e,"__esModule",{value:!0});var i=n(0),r={maintainAspectRatio:!1,animation:!1,tooltips:{displayColors:!1,callbacks:{}},legend:{},title:{fontSize:20,fontColor:"#333"}},a={scales:{yAxes:[{ticks:{maxTicksLimit:4},scaleLabel:{fontSize:16,fontColor:"#333"}}],xAxes:[{gridLines:{drawOnChartArea:!1},scaleLabel:{fontSize:16,fontColor:"#333"},time:{},ticks:{}}]}},s=["#3366CC","#DC3912","#FF9900","#109618","#990099","#3B3EAC","#0099C6","#DD4477","#66AA00","#B82E2E","#316395","#994499","#22AA99","#AAAA11","#6633CC","#E67300","#8B0707","#329262","#5574A6","#651067"],l=function(t,e,n){e!==undefined?(t.legend.display=!!e,e&&!0!==e&&(t.legend.position=e)):n&&(t.legend.display=!1)},u=function(t,e){t.title.display=!0,t.title.text=e},c=function(t,e){null!==e&&(t.scales.yAxes[0].ticks.min=(0,i.toFloat)(e))},d=function(t,e){t.scales.yAxes[0].ticks.max=(0,i.toFloat)(e)},f=function(t,e){null!==e&&(t.scales.xAxes[0].ticks.min=(0,i.toFloat)(e))},p=function(t,e){t.scales.xAxes[0].ticks.max=(0,i.toFloat)(e)},h=function(t,e){t.scales.xAxes[0].stacked=!!e,t.scales.yAxes[0].stacked=!!e},g=function(t,e){t.scales.xAxes[0].scaleLabel.display=!0,t.scales.xAxes[0].scaleLabel.labelString=e},v=function(t,e){t.scales.yAxes[0].scaleLabel.display=!0,t.scales.yAxes[0].scaleLabel.labelString=e},m=function(t,e,n,o){t.chart?t.chart.destroy():t.element.innerHTML="<canvas></canvas>";var i=t.element.getElementsByTagName("CANVAS")[0];t.chart=new window.Chart(i,{type:e,data:n,options:o})},y=function(t,e){var n=/^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(t);return n?"rgba("+parseInt(n[1],16)+", "+parseInt(n[2],16)+", "+parseInt(n[3],16)+", "+e+")":t},z=function(t,e,n){var o=Math.ceil(t.element.offsetWidth/4/e.labels.length);o>25&&(o=25),n.scales.xAxes[0].ticks.callback=function(t){return(t=(0,i.toStr)(t)).length>o?t.substring(0,o-2)+"...":t}},M=function(t,e,n){var o={prefix:t.options.prefix,suffix:t.options.suffix,thousands:t.options.thousands,decimal:t.options.decimal};if(o.prefix||o.suffix||o.thousands||o.decimal){if("pie"!==n){var r=e.scales.yAxes;"bar"===n&&(r=e.scales.xAxes),r[0].ticks.callback||(r[0].ticks.callback=function(t){return(0,i.formatValue)("",t,o)})}if(!e.tooltips.callbacks.label)if("pie"!==n){var a="bar"===n?"xLabel":"yLabel";e.tooltips.callbacks.label=function(t,e){var n=e.datasets[t.datasetIndex].label||"";return n&&(n+=": "),(0,i.formatValue)(n,t[a],o)}}else e.tooltips.callbacks.label=function(t,e){var n=e.labels[t.index],r=": ";return(0,i.isArray)(n)?(n=n.slice())[0]+=r:n+=r,(0,i.formatValue)(n,e.datasets[t.datasetIndex].data[t.index],o)}}},b=(0,i.jsOptionsFunc)((0,i.merge)(r,a),l,u,c,d,h,g,v),x=function(t,e,n){var o=[],r=[],a=t.options.colors||s,l=!0,u=!0,c=void 0,d=!0,f=!0,p=!0,h=!0,g=("line"===n||"area"===n)&&!t.discrete,v=t.data,m=[],z=void 0,M=void 0,b=void 0,x=void 0,w=void 0,A=[];for(z=0;z<v.length;z++)for(b=v[z],M=0;M<b.data.length;M++)x=b.data[M],A[w=g?x[0].getTime():x[0]]||(A[w]=new Array(v.length)),A[w][z]=(0,i.toFloat)(x[1]),-1===m.indexOf(w)&&m.push(w);(g||"number"===t.options.xtype)&&m.sort(i.sortByNumber);var C=[];for(M=0;M<v.length;M++)C.push([]);var k=void 0,_=void 0;for(_=0;_<m.length;_++)for(z=m[_],g?(k=new Date((0,i.toFloat)(z)),l=l&&(0,i.isDay)(k),c||(c=k.getDay()),u=u&&(0,i.isWeek)(k,c),d=d&&(0,i.isMonth)(k),f=f&&(0,i.isYear)(k),p=p&&(0,i.isHour)(k),h=h&&(0,i.isMinute)(k)):k=z,r.push(k),M=0;M<v.length;M++)C[M].push(A[z][M]===undefined?null:A[z][M]);for(z=0;z<v.length;z++){var S=(b=v[z]).color||a[z],O="line"!==n?y(S,.5):S,D={label:b.name,data:C[z],fill:"area"===n,borderColor:S,backgroundColor:O,pointBackgroundColor:S,borderWidth:2};b.stack&&(D.stack=b.stack),!1===t.options.curve&&(D.lineTension=0),!1===t.options.points&&(D.pointRadius=0,D.pointHitRadius=5),o.push((0,i.merge)(D,b.library||{}))}if(g&&r.length>0){var T=r[0].getTime(),j=r[0].getTime();for(z=1;z<r.length;z++)(k=r[z].getTime())<T&&(T=k),k>j&&(j=k);var F=(j-T)/864e5;if(!e.scales.xAxes[0].time.unit){var B=void 0;if(f||F>3650?(e.scales.xAxes[0].time.unit="year",B=365):d||F>300?(e.scales.xAxes[0].time.unit="month",B=30):l||F>10?(e.scales.xAxes[0].time.unit="day",B=1):p||F>.5?(e.scales.xAxes[0].time.displayFormats={hour:"MMM D, h a"},e.scales.xAxes[0].time.unit="hour",B=1/24):h&&(e.scales.xAxes[0].time.displayFormats={minute:"h:mm a"},e.scales.xAxes[0].time.unit="minute",B=1/24/60),B&&F>0){var E=Math.ceil(F/B/(t.element.offsetWidth/100));u&&1===B&&(E=7*Math.ceil(E/7)),e.scales.xAxes[0].time.unitStepSize=E}}e.scales.xAxes[0].time.tooltipFormat||(l?e.scales.xAxes[0].time.tooltipFormat="ll":p?e.scales.xAxes[0].time.tooltipFormat="MMM D, h a":h&&(e.scales.xAxes[0].time.tooltipFormat="h:mm a"))}return{labels:r,datasets:o}},w=function(t,e){if("number"===t.options.xtype)return S(t,e,!0);var n={};!t.options.max&&o(t.data)&&(n.max=1);var r=b(t,(0,i.merge)(n,t.options));M(t,r,e);var a=x(t,r,e||"line");r.scales.xAxes[0].type=t.discrete?"category":"time",m(t,"line",a,r)},A=function(t){var e=(0,i.merge)({},r);t.options.donut&&(e.cutoutPercentage=50),"legend"in t.options&&l(e,t.options.legend),t.options.title&&u(e,t.options.title),e=(0,i.merge)(e,t.options.library||{}),M(t,e,"pie");for(var n=[],o=[],a=0;a<t.data.length;a++){var c=t.data[a];n.push(c[0]),o.push(c[1])}var d={labels:n,datasets:[{data:o,backgroundColor:t.options.colors||s}]};m(t,"pie",d,e)},C=function(t,e){var n=void 0;n="bar"===e?(0,i.jsOptionsFunc)((0,i.merge)(r,a),l,u,f,p,h,g,v)(t,t.options):b(t,t.options),M(t,n,e);var o=x(t,n,"column");"bar"!==e&&z(t,o,n),m(t,"bar"===e?"horizontalBar":"bar",o,n)},k=function(t){w(t,"area")},_=function(t){C(t,"bar")},S=function(t,e,n){e=e||"line";var o=b(t,t.options);n||M(t,o,e);for(var r=t.options.colors||s,a=[],l=t.data,u=0;u<l.length;u++){for(var c=l[u],d=[],f=0;f<c.data.length;f++){var p={x:(0,i.toFloat)(c.data[f][0]),y:(0,i.toFloat)(c.data[f][1])};"bubble"===e&&(p.r=(0,i.toFloat)(c.data[f][2])),d.push(p)}var h=c.color||r[u],g="area"===e?y(h,.5):h;a.push({label:c.name,showLine:n||!1,data:d,borderColor:h,backgroundColor:g,pointBackgroundColor:h,fill:"area"===e})}"area"===e&&(e="line");var v={datasets:a};o.scales.xAxes[0].type="linear",o.scales.xAxes[0].position="bottom",m(t,e,v,o)},O=function(t){S(t,"bubble")};e["default"]={name:"chartjs",renderLineChart:w,renderPieChart:A,renderColumnChart:C,renderBarChart:_,renderAreaChart:k,renderScatterChart:S,renderBubbleChart:O}},function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=n(0),i={chart:{},xAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},yAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},title:{text:null},credits:{enabled:!1},legend:{borderWidth:0},tooltip:{style:{fontSize:"12px"}},plotOptions:{areaspline:{},series:{marker:{}}}},r=function(t,e,n){e!==undefined?(t.legend.enabled=!!e,e&&!0!==e&&("top"===e||"bottom"===e?t.legend.verticalAlign=e:(t.legend.layout="vertical",t.legend.verticalAlign="middle",t.legend.align=e))):n&&(t.legend.enabled=!1)},a=function(t,e){t.title.text=e},s=function(t,e){t.yAxis.min=e},l=function(t,e){t.yAxis.max=e},u=function(t,e){t.plotOptions.series.stacking=e?"normal":null},c=function(t,e){t.xAxis.title.text=e},d=function(t,e){t.yAxis.title.text=e},f=(0,o.jsOptionsFunc)(i,r,a,s,l,u,c,d),p=function(t,e,n){t.chart&&t.chart.destroy(),n.chart.renderTo=t.element.id,n.series=e,t.chart=new window.Highcharts.Chart(n)},h=function(t,e,n){var i={prefix:t.options.prefix,suffix:t.options.suffix,thousands:t.options.thousands,decimal:t.options.decimal};(i.prefix||i.suffix||i.thousands||i.decimal)&&("pie"===n||e.yAxis.labels.formatter||(e.yAxis.labels.formatter=function(){return(0,o.formatValue)("",this.value,i)}),e.tooltip.pointFormatter||(e.tooltip.pointFormatter=function(){return'<span style="color:'+this.color+">\u25cf</span> "+(0,o.formatValue)(this.series.name+": <b>",this.y,i)+"</b><br/>"}))},g=function(t,e){var n={};"areaspline"===(e=e||"spline")&&(n={plotOptions:{areaspline:{stacking:"normal"},area:{stacking:"normal"},series:{marker:{enabled:!1}}}}),!1===t.options.curve&&("areaspline"===e?e="area":"spline"===e&&(e="line"));var o=f(t,t.options,n),i=void 0,r=void 0,a=void 0;o.xAxis.type=t.discrete?"category":"datetime",o.chart.type||(o.chart.type=e),h(t,o,e);var s=t.data;for(r=0;r<s.length;r++){if(i=s[r].data,!t.discrete)for(a=0;a<i.length;a++)i[a][0]=i[a][0].getTime();s[r].marker={symbol:"circle"},!1===t.options.points&&(s[r].marker.enabled=!1)}p(t,s,o)},v=function(t){var e=f(t,t.options,{});e.chart.type="scatter",p(t,t.data,e)},m=function(t){var e=(0,o.merge)(i,{});t.options.colors&&(e.colors=t.options.colors),t.options.donut&&(e.plotOptions={pie:{innerSize:"50%"}}),"legend"in t.options&&r(e,t.options.legend),t.options.title&&a(e,t.options.title);var n=(0,o.merge)(e,t.options.library||{});h(t,n,"pie");var s=[{type:"pie",name:t.options.label||"Value",data:t.data}];p(t,s,n)},y=function(t,e){e=e||"column";var n=t.data,i=f(t,t.options),r=void 0,a=void 0,s=void 0,l=void 0,u=[],c=[];for(i.chart.type=e,h(t,i,e),r=0;r<n.length;r++)for(s=n[r],a=0;a<s.data.length;a++)u[(l=s.data[a])[0]]||(u[l[0]]=new Array(n.length),c.push(l[0])),u[l[0]][r]=l[1];"number"===t.options.xtype&&c.sort(o.sortByNumber),i.xAxis.categories=c;var d=[],g=void 0;for(r=0;r<n.length;r++){for(l=[],a=0;a<c.length;a++)l.push(u[c[a]][r]||0);g={name:n[r].name,data:l},n[r].stack&&(g.stack=n[r].stack),d.push(g)}p(t,d,i)},z=function(t){y(t,"bar")},M=function(t){g(t,"areaspline")};e["default"]={name:"highcharts",renderLineChart:g,renderPieChart:m,renderColumnChart:y,renderBarChart:z,renderAreaChart:M,renderScatterChart:v}},function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=n(0),i={},r=[],a=function(){for(var t=void 0,e=0;e<r.length;e++)t=r[e],window.google.visualization&&("corechart"===t.pack&&window.google.visualization.LineChart||"timeline"===t.pack&&window.google.visualization.Timeline)&&(t.callback(),r.splice(e,1),e--)},s=function(t,e){if(e||(e=t,t="corechart"),r.push({pack:t,callback:e}),i[t])a();else{i[t]=!0;var n={packages:[t],callback:a},o=window.Chartkick.config;o.language&&(n.language=o.language),"corechart"===t&&o.mapsApiKey&&(n.mapsApiKey=o.mapsApiKey),window.google.setOnLoadCallback?window.google.load("visualization","1",n):window.google.charts.load("current",n)}},l={chartArea:{},fontName:"'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif",pointSize:6,legend:{textStyle:{fontSize:12,color:"#444"},alignment:"center",position:"right"},curveType:"function",hAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},gridlines:{color:"transparent"},baselineColor:"#ccc",viewWindow:{}},vAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},baselineColor:"#ccc",viewWindow:{}},tooltip:{textStyle:{color:"#666",fontSize:12}}},u=function(t,e,n){if(e!==undefined){var o=void 0;o=e?!0===e?"right":e:"none",t.legend.position=o}else n&&(t.legend.position="none")},c=function(t,e){t.title=e,t.titleTextStyle={color:"#333",fontSize:"20px"}},d=function(t,e){t.vAxis.viewWindow.min=e},f=function(t,e){t.vAxis.viewWindow.max=e},p=function(t,e){t.hAxis.viewWindow.min=e},h=function(t,e){t.hAxis.viewWindow.max=e},g=function(t,e){t.isStacked=!!e},v=function(t,e){t.hAxis.title=e,t.hAxis.titleTextStyle.italic=!1},m=function(t,e){t.vAxis.title=e,t.vAxis.titleTextStyle.italic=!1},y=(0,o.jsOptionsFunc)(l,u,c,d,f,g,v,m),z=function(t,e,n){var i=void 0,r=void 0,a=void 0,s=void 0,l=void 0,u=[],c=[];for(i=0;i<t.length;i++)for(a=t[i],r=0;r<a.data.length;r++)s=a.data[r],u[l="datetime"===e?s[0].getTime():s[0]]||(u[l]=new Array(t.length),c.push(l)),u[l][i]=(0,o.toFloat)(s[1]);var d=[],f=!0,p=void 0;for(r=0;r<c.length;r++)i=c[r],"datetime"===e?(p=new Date((0,o.toFloat)(i)),f=f&&(0,o.isDay)(p)):p="number"===e?(0,o.toFloat)(i):i,d.push([p].concat(u[i]));if("datetime"===e?d.sort(o.sortByTime):"number"===e&&d.sort(o.sortByNumberSeries),"number"===n)for(d.sort(o.sortByNumberSeries),i=0;i<d.length;i++)d[i][0]=(0,o.toStr)(d[i][0]);var h=new window.google.visualization.DataTable;for(e="datetime"===e&&f?"date":e,h.addColumn(e,""),i=0;i<t.length;i++)h.addColumn("number",t[i].name);return h.addRows(d),h},M=function(t){window.attachEvent?window.attachEvent("onresize",t):window.addEventListener&&window.addEventListener("resize",t,!0),t()},b=function(t,e,n,o){t.chart&&t.chart.clearChart(),t.chart=new e(t.element),M(function(){t.chart.draw(n,o)})},x=function(t){s(function(){var e={};!1===t.options.curve&&(e.curveType="none"),!1===t.options.points&&(e.pointSize=0);var n=y(t,t.options,e),o=t.discrete?"string":"datetime";"number"===t.options.xtype&&(o="number");var i=z(t.data,o);b(t,window.google.visualization.LineChart,i,n)})},w=function(t){s(function(){var e={chartArea:{top:"10%",height:"80%"},legend:{}};t.options.colors&&(e.colors=t.options.colors),t.options.donut&&(e.pieHole=.5),"legend"in t.options&&u(e,t.options.legend),t.options.title&&c(e,t.options.title);var n=(0,o.merge)((0,o.merge)(l,e),t.options.library||{}),i=new window.google.visualization.DataTable;i.addColumn("string",""),i.addColumn("number","Value"),i.addRows(t.data),b(t,window.google.visualization.PieChart,i,n)})},A=function(t){s(function(){var e=y(t,t.options),n=z(t.data,"string",t.options.xtype);b(t,window.google.visualization.ColumnChart,n,e)})},C=function(t){s(function(){var e={hAxis:{gridlines:{color:"#ccc"}}},n=(0,o.jsOptionsFunc)(l,u,c,p,h,g,v,m)(t,t.options,e),i=z(t.data,"string",t.options.xtype);b(t,window.google.visualization.BarChart,i,n)})},k=function(t){s(function(){var e={isStacked:!0,pointSize:0,areaOpacity:.5},n=y(t,t.options,e),o=t.discrete?"string":"datetime";"number"===t.options.xtype&&(o="number");var i=z(t.data,o);b(t,window.google.visualization.AreaChart,i,n)})},_=function(t){s(function(){var e={legend:"none",colorAxis:{colors:t.options.colors||["#f6c7b6","#ce502d"]}},n=(0,o.merge)((0,o.merge)(l,e),t.options.library||{}),i=new window.google.visualization.DataTable;i.addColumn("string",""),i.addColumn("number",t.options.label||"Value"),i.addRows(t.data),b(t,window.google.visualization.GeoChart,i,n)})},S=function(t){s(function(){var e={},n=y(t,t.options,e),o=t.data,i=[],r=void 0,a=void 0,s=void 0,l=void 0;for(r=0;r<o.length;r++)for(l=o[r].data,a=0;a<l.length;a++){var u=new Array(o.length+1);u[0]=l[a][0],u[r+1]=l[a][1],i.push(u)}for((s=new window.google.visualization.DataTable).addColumn("number",""),r=0;r<o.length;r++)s.addColumn("number",o[r].name);s.addRows(i),b(t,window.google.visualization.ScatterChart,s,n)})},O=function(t){s("timeline",function(){var e={legend:"none"};t.options.colors&&(e.colors=t.options.colors);var n=(0,o.merge)((0,o.merge)(l,e),t.options.library||{}),i=new window.google.visualization.DataTable;i.addColumn({type:"string",id:"Name"}),i.addColumn({type:"date",id:"Start"}),i.addColumn({type:"date",id:"End"}),i.addRows(t.data),t.element.style.lineHeight="normal",b(t,window.google.visualization.Timeline,i,n)})};e["default"]={name:"google",renderLineChart:x,renderPieChart:w,renderColumnChart:A,renderBarChart:C,renderAreaChart:k,renderScatterChart:S,renderGeoChart:_,renderTimeline:O}}])});