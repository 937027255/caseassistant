;(function ($, window, document) {
	var defaults = {
		id: '', // 判定dom ID
		index: 0, //默认当前选中
		width: '40px',
		then: function () {

		}
	};

	// TODO: 笔录选择轴运动效果有bug

	var BiluAxis = function (options) {
		this.options = Object.assign(defaults, options);
		this.id = this.options.id;
		this.width = this.options.width;//($('#biluTab').width()-80)/this.options.data.length+'px';
		this.init();
	};

	BiluAxis.prototype = {

		// 组件初始化
		init: function () {
			// 生成时间轴盒子html
			this.setTimeBox();
		},

		// 生成时间轴盒子html
		setTimeBox: function () {
			var id = "#" + this.id;
			var html = '<span><</span> <div class="bilu-line-box"> <ul></ul></div><span>></span>';
			$(id).empty().append(html);
			// 生成时间轴html
			this.setTimeAxisHtml();
			var self = this;
			// 向左移动
			$(id + '>span:first').on('click', function () {
				self.timeAxisMove(-1);
			});
			//向右移动
			$(id + '>span:last').on('click', function () {
				self.timeAxisMove(1);
			});
		},

		// 生成时间轴html
		setTimeAxisHtml: function () {
			var list = this.options.data || [];
			var html = '';
			var self = this;
			$.each(list, function (index, item) {
				html += '<li class="cx-round-box cx-round-box'+index+'">';
				html += '<div class="cx-time-round" data-index="'+index+'"></div>';
				html += '<div class="cx-time-bottom"'+' id="button'+index+'" data-index="'+index+'">'+'笔录'+(index+1)+'</div>';
				html += '</li>';
				if(index != list.length - 1){
					html += '<li class="cx-time-line" style="width: '+ self.width +'"></li>';
				}
			});

			var cls = "#" + this.id + ' ul';
			$(cls).empty().append(html);
			$(cls + ' .cx-time-round').on('click', function () {
				self.options.index = $(this).data('index');
				self.timeAxisMove(0); //点击某一点
			})
			$(cls + ' .button').on('click', function () {
				self.add(0); //点击某一点
			})
			this.firstLoad = true;
			this.timeAxisMove(0);//初始选中
		},
		add: function (num)  {
			this.options.index = 3
			$('.cx-round-box' + this.options.index).addClass('cx-time-active1');
			this.firstLoad = false;
		},
		//点击连边移动选中时间节点
		timeAxisMove: function (num) {
			var list = this.options.data || [];
			this.options.index += num;
			if (this.options.index < 0) {
				this.options.index = list.length - 1;
			}
			if (this.options.index > list.length - 1) {
				this.options.index = 0;
			}
			this.timeAxisRoll();
			this.timeAxisActive(this.options.index);

			// 切换笔录后渲染新的笔录文本
			var activateIndex = this.options.index;
			var param = {
				textString: list[activateIndex].attach_doc_text.original_str, // 展示数据
				paraList: list[activateIndex].attach_doc_text.para_loc, // 默认空时间线数据
				id: '#bilu', // 判定dom ID
				highlightList: list[activateIndex].attach_doc_fact, // 高亮部分列表
				spanLabel: 'biluFact' // span标签Class
			};
			var textBoxClass = new oParaText(param);
			var oBiluEventClicker = null;
			// 绑定新的点击事件
			var param = {
				oriNode: 'biluFact.textContent', // 源节点
				destNode: 'qisuFact', // 目标节点
				relationship: function (a) {
					var destList = analyzingData.relationship
					var ansList = {};
					$.each(destList, function (indexRow, itemRow) {
						if (itemRow[Number(a)] != '0') {
							ansList[indexRow] = 1;
						}
					});
					return ansList;
				},
				bidirection: false // 是否双向
			};
			oBiluEventClicker = new oEventClicker(param);
			$(function () {
				var index = $('.qisuFact.active').attr('data-index');
				if(index == undefined) return true;

				function relation(a) {
					var destList = analyzingData.relationship[a];
					var ansList = {};
					$.each(destList, function (index, item) {  // 映射函数
						if (item != '0') {
							ansList[index] = item;
						}
						;
					});
					return ansList;
				};

				var destIndex = relation(index);
				$.each(destIndex, function (index, item) {
					$('.biluFact[data-index=\'' + index + '\']').addClass('type'+item.toString()).addClass('active');
				});
				$('.active:not(.cx-time-bottom)').each(function () {
					$(this)[0].scrollIntoViewIfNeeded();
				});

			   $('.biluFact.btn.active').each(function (index, item) {
					$(this).attr("data-toggle", "popover");
					$(this).attr("data-trigger", "hover");
					$(this).attr("data-placement", "top");
					if($(this).hasClass("type1")){
						$(this).attr("data-content", "完全匹配");
					}else if($(this).hasClass("type2")){
						$(this).attr("data-content", "人物不匹配");
					}else if($(this).hasClass("type3")){
						$(this).attr("data-content", "地点不匹配");
					};
			   });
			   pop();
			});
		},

		//选中节点左右滚动
		timeAxisRoll: function (){
			var list = this.options.data || [];

			var width = parseInt(this.width) + 12;
			var firstIndex = this.options.index - 1 < 0?0:this.options.index - 1;
			var roll = -(firstIndex* width);
			var widthBox = $('.bilu-line-box').width();//时间轴宽度盒子总宽度
			var widthBox1 = Math.abs(list.length * width); //实际总宽度
			if(widthBox > widthBox1){
				return
			}
			var i = parseInt(widthBox/width);//显示时间轴条数

			if(this.options.index + i >= list.length){
				roll =  -((list.length - 1 - i) * width);
			}

			var cla = "#" + this.id + ' ul li';
			$(cla).stop(['clearQueue'], ['gotoEnd']).animate({
				'left': roll + 'px'
			});
		},

		// 前后滑动点击事件
		timeAxisActive: function (num) {
			if(!this.firstLoad){
				var list = this.options.data || [];
				var data = list[this.options.index];
				this.options.then(data);
			} // 首次加载不执行回调
			$('.cx-round-box').removeClass('cx-time-active');
			$('.cx-round-box' + this.options.index).addClass('cx-time-active');
			this.firstLoad = false;
		}
	};
	window.oBiluAxios = BiluAxis;
})(jQuery, window, document);