;(function ($, window, document) {
	var defaults = {
		textString: '', // 展示数据
		paraList: [], // 分段定位数据
		id: '', // 判定dom ID
		highlightList: [], // 高亮部分列表
		spanClass: '', // span标签class
		then: function () {
		}
	};

	var DocView = function (options) {
		this.options = Object.assign(defaults, options);
		this.textString = this.options.textString;
		this.paraList = this.options.paraList;
		this.highlightList = this.options.highlightList;
		this.id = this.options.id;
		this.spanClass = this.options.spanClass;
		this.init();
	};

	
	DocView.prototype = {

		// 组件初始化'
		init: function () {
			// 生成时间轴盒子html
			this.textBoxRender();
		},

		// 渲染文本框
		textBoxRender: function (){
			var htmlCode = this.htmlGenerator(this.textString, this.paraList, this.highlightList, this.spanClass);
			this.appendHtml(this.id, htmlCode);
		},

		// html生成器
		htmlGenerator: function (text, paraLoc, highlightList, spanClass){
			function createspan(value) {
				var span = "<span class='"+ spanClass +" textContent'>" + value + "</span>";
				return span;
			}
			
			var h_index = 0, h_length = highlightList.length;
			
			var html = '';
			$.each(paraLoc, function (index, item) {
				html += '<div class="para-box ' + index + '">'; //" data-index="' + index + '"
				html += '&emsp;&emsp;';
				
				var para_pos = item; 
				var para_end = paraLoc[index+1];
				
				while(h_index <h_length ){
					var h_item = highlightList[h_index];
					if((h_item.start >= para_pos) && (h_item.start < para_end)){
						html += text.substring(para_pos, h_item.start );
						para_pos = h_item.start + h_item.length;
						html += createspan(text.substring(h_item.start, para_pos));
						h_index +=1;
					}else{
						break;
					}
				}
				if(para_pos < para_end){
					html += text.substring(para_pos, para_end);
				}
				
				html += '</div>';
			});
			
			return html;
		},

		appendHtml: function (node, html) {
			$(node).empty().append(html);
		},
	};

	window.oDocView = DocView;
})(jQuery, window, document);