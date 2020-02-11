Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
function OnUse()
	Say("使用萝卜大礼盒可以获得<color=yellow>十个红萝卜<color>，你要使用吗？",2,
			"我要使用/give_hongluobo10",
			"先不使用/end_say"
	)
end

function give_hongluobo10()
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then		--空间/负重判断
		Talk(1,"","请确认您的背包有足够的负重和空间！")
		return
	end
	if DelItem(2,1,1095,1) == 1 then
		AddItem(2,1,1090,10)
	else
		Say("请确认你身上有萝卜大礼盒！",0)
	end
end

function end_say()
end