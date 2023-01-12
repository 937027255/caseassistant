;(function ($, window, document) {
	var defaults = {
		textString: '', // 展示数据
		paraList: [], // 默认空时间线数据
		id: '', // 判定dom ID
		highlightList: [], // 高亮部分列表
		spanLabel: '', // span标签class
		then: function () {
		}
	};

	var ParaText = function (options) {
		this.options = Object.assign(defaults, options);
		this.textString = this.options.textString;
		this.paraList = this.options.paraList;
		this.highlightList = this.options.highlightList;
		this.id = this.options.id;
		this.spanLabel = this.options.spanLabel;
		this.init();
	};

	ParaText.prototype = {

		// 组件初始化'
		init: function () {
			// 生成时间轴盒子html
			this.textBoxRender();
		},

		// 渲染文本框
		textBoxRender: function (){
			var htmlCode = this.htmlGenerator(this.textString, this.paraList);
			var htmlCode = this.highlightGenerator(htmlCode, this.textString, this.highlightList, this.spanLabel);
			this.appendHtml(this.id, htmlCode);
		},

		// html生成器
		htmlGenerator: function (text, paraLoc){
			var html = '';
			$.each(paraLoc, function (index, item) {
				html += '<div class="para-box ' + index + '">'; //" data-index="' + index + '"
				html += '&emsp;&emsp;';
				html += text.substring(item, paraLoc[index+1]);
				html += '</div>';
			});
			return html;
		},

		// 文本高亮生成器
		highlightGenerator: function(inputString, oriTextString, highlightList, spanClass ) {

			//生成替换的span，根据value生成,起诉书
			function createspan(value, i, dataIndex) {
				var span = "<span " + "class=" + "\""+ spanClass +" textContent\"" + "data-index=\"" + dataIndex + "\">" + value + "</span>";
				span += '<button type="button" class="'+spanClass+' btn btn-default" data-index="'+dataIndex+'">';
				span += '<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>';
				span += '</button>';
				return span;
			};

			$.each(highlightList, function(index, item){
			   var str = oriTextString.substring(item.content[0], item.content[1]);
			   var span = createspan(str, index, item.no);
			   inputString = inputString.replace(str, span);
			});
			return inputString;
		},

		appendHtml: function (node, html) {
			$(node).empty().append(html);
		},
	};

	window.oParaText = ParaText;
})(jQuery, window, document);