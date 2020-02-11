--filename:yuanxiao_item.lua
--create date:2006-01-25
--author:yanjun
--describe:ÔªÏüµÀ¾ß½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\class\\ktabfile.lua")

tabLVEXP = new(KTabFile, "\\settings\\huodong_exp.txt");

function OnUse()
	local selTab = {
				"§ång ý/ok",
				"Ta ch­a muèn ¨n./cancel"
				}
	local yxleft = 10 - GetByte(GetTask(TASK_USEYUANXIAO),2)
	if yxleft <= 0 then
		Say("B¹n ®· ¨n 10 b¸nh Chi Ma H­¬ng, kh«ng thÓ ¨n n÷a.",0)
		return 0
	end
	Say("B¹n ®· ¨n <color=yellow>"..GetByte(GetTask(TASK_USEYUANXIAO),2).."<color> b¸nh Chi Ma H­¬ng, cßn cã thÓ ¨n <color=yellow>"..yxleft.."<color> c¸i",2,selTab)
end

function ok()
	local nDay = tonumber(date("%d"))
	if GetByte(GetTask(TASK_USEYUANXIAO),1) ~= nDay then
		SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),1,0))
	end
	if GetByte(GetTask(TASK_USEYUANXIAO),1) == 0 then
		if DelItem(2,1,332,1) == 1 then
			if GetLevel() < 10 then 
				Say("Ng­êi ch¬i ch­a ®¹t ®Õn cÊp 10 kh«ng thÓ sö dông vËt phÈm nµy.",0)
				return 0 
			end
			local nExp = 0
			local nRow = 0
			nRow = tonumber(tabLVEXP:selectRowNum("lv",GetLevel()))
			nExp = tonumber(tabLVEXP:getCell(nRow,"exp"))
			ModifyExp(nExp)
			Msg2Player("B¹n ®· ¨n Chi Ma H­¬ng, t¨ng trÞ kinh nghiÖm"..nExp)
			SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),1,nDay))
			SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),2,GetByte(GetTask(TASK_USEYUANXIAO),2)+1))
			WriteLog("[Ho¹t ®éng lÔ t×nh nh©n vµ tÕt nguyªn tiªu (¨n b¸nh nguyªn tiªu)]:"..GetName().."¨n 1 b¸nh nguyªn tiªu.")
		end
	else
		Say("H«m nay b¹n ®· ¨n qu¸ b¸nh nguyªn tiªu råi.",0)
	end	
end

function cancel()

end