;(function ($, window, document) {
	var defaults = {
		oriNode: '', // 源节点
		destNode: '', // 目标节点
        bidirection: false, // 是否双向可用
        relationship: function(a){ // 匹配函数
			var _ = [];
			_.push(a);
		    return _;
        },
		afterclick: function(a){
			return 0;
		}
	};

	var EventClicker = function (options) {
		this.options = Object.assign(defaults, options);
		this.oriNode = this.options.oriNode;
		this.destNode = this.options.destNode;
		this.relationship = this.options.relationship;
		this.afterclick = this.options.afterclick;
		this.bidirection = this.options.bidirection;
		this.init();
	};

	EventClicker.prototype = {

		// 组件初始化'
		init: function () {
			// 生成时间轴盒子html
			this.clickMaker();
		},

		// 点击事件
		clickMaker: function (){
		    var self = this;
			$('.'+this.oriNode).click( function(res){
			    $('.'+self.oriNode).removeClass('active');
			    $('.'+self.destNode).removeClass('active');
			    var index = $(this).attr('data-index');
			    var destIndex = self.relationship(index);
			    $('.'+self.oriNode+'[data-index=\''+index+'\']').addClass('active');
                $.each(destIndex, function(index, item){
					$('.'+self.destNode+'[data-index=\''+index+'\']').addClass('active').addClass(item.toString());
                });
                $('.active:not(.cx-time-bottom)').each(function(){
                    	$(this)[0].scrollIntoViewIfNeeded();
                });
                self.afterclick();
            });
			if(this.bidirection){
			    $('.'+this.destNode).click( function(res){
                    $('.'+self.oriNode).removeClass('active');
                    $('.'+self.destNode).removeClass('active');
                    var index = $(this).attr('data-index');
                    var destIndex = self.relationship(index);
                   	$('.'+self.destNode+'[data-index=\''+index+'\']').addClass('active');
                    $.each(destIndex, function(index, item){
                    	$('.'+self.oriNode+'[data-index=\''+index+'\']').addClass('active');
					});
                    $('.active').each(function(){
                    	$(this)[0].scrollIntoViewIfNeeded();
					});
					self.afterclick();
                });
            }
		},

	};

	window.oEventClicker = EventClicker;
})(jQuery, window, document);

function pop(){
	$(function () { $("[data-toggle='popover']").popover(); });
}