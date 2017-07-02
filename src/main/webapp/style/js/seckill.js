/**
 * Created by user on 2017/4/5.
 */
//存放主要交互逻辑的js代码
//js模块化
var seckill = {
    //封装秒杀相关ajax的url
    URL:{

    },
    //验证手机号
    validatePhone:function (phone) {
        return phone && phone.length == 11 && isNaN(phone);
    },
    //详情页秒杀逻辑
    detail:{
        //详情页初始化
        init:function (params) {
            //手机验证和登录，计时交互
            //规划我们的交互流程
            //在cookie中查找手机号
            var killPhone = $.cookie('killPhone');
            var startTime = params['startTime'];
            var endTime = params['endTime'];
            var seckillId = params['seckillId'];
            //验证手机号
            if(!seckill.validatePhone(killPhone)){
                //绑定phone
                //控制输出
                var killPhoneModal = $('#killPhoneModal');
                killPhoneModal.modal({
                    show: true,    //显示弹出层
                    backdrop: 'static',  //禁止位置关闭，防止点击modal外关闭modal
                    keyboard: false      //关闭键盘事件，防止按ESC关闭modal
                });
                $('#killPhoneBtn').click(function () {
                    var inputPhone = $('killPhoneKey').val();
                    if(seckill.validatePhone(inputPhone)){
                        //刷新页面
                        window.location.reload();
                    }
                });
            }
        }
    },
}