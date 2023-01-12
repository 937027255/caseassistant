;(function ($, window, document) {
	var defaults = {
		data: [], // 展示数据
		id: '', // 判定dom ID
		props: [], // 数据反显key
		index: 0, //默认当前选中
		sort: '', // 正序just，反序back, 其他表示不排序
		sortKey: '', //排序的参数key //为空时表示不排序
		activeColor: '#26a69a', // 默认颜色
		then: function () {

		}
	};

	var TimeAxis = function (options) {
		this.options = Object.assign(defaults, options);
		this.props = this.options.props;
		this.id = this.options.id;
		this.init();
	};

	TimeAxis.prototype = {

		// 组件初始化
		init: function () {
			// 生成时间轴盒子html
			this.setTimeBox();
		},

		// 生成时间轴盒子html
		setTimeBox: function () {
			var id = "#" + this.id;
			var html = '<ul class="cx-time-box"></ul>';
			$(id).empty().append(html);
			// 生成时间轴html
			this.setTimeAxisHtml();

			var self = this;
		},


		// 生成时间轴html
		setTimeAxisHtml: function () {
			var list = this.options.data || [];
			var html = '';
			var self = this;
			$.each(list, function (index, item) {
				html += '<li>';
				html += '<div class="cx-main-box cx-main-box'+index+' back'+index+'" data-index="'+index+'">';
				$.each(self.props, function(i, key){
					if(item[key]){
						html += '<div class="fact '+key+'">'+self.formatChange(key,item[key])+'</div>';
					}
				});
				html += '</div>';
				html += '</li>';
			});
			var cls = "#" + this.id + ' ul';
			$(cls).empty().append(html);
			//
			// // 节点绑定点击事件
			// $(cls + ' .cx-main-box').click(function (res) {
			// 	self.options.index = $(this).data('index');
			//
			// 	// 点击事件回调
			// 	var data = list[self.options.index];
			// 	self.options.then(data);
			//
			// 	// 选择节点颜色
			// 	self.activeColor();
			// })
			//
			// // 选择节点颜色
			// this.activeColor();
		},

		// 节点颜色
		activeColor () {
			var clsAll = '#' + this.id + ' .cx-main-box';
			$(clsAll).css({
				'background': '#b2dfdb',
				'color': '#000'
			});
			$(clsAll).removeClass('active');

			var cls = clsAll + this.options.index;

			$(cls).css({
				'background': this.options.activeColor,
				'color': '#fff'
			});
			$(cls).addClass('active');
		},


		//数据格式化事件
		formatChange: function (key, val) {
			// 判断是否包含format 方法
			if(typeof(this.options.format) == "function"){
				return this.options.format(key, val);
			}
			return val;
		}
	};
	window.oTimeAxios = TimeAxis;
})(jQuery, window, document);