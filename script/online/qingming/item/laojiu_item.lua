--File name:laojiu_item.lua
--Describe:¼À°İÆ·µÀ¾ß½Å±¾
--Create Date:2006-3-24
--Author:yanjun
Include("\\script\\online\\qingming\\qingming_head.lua");

function OnUse()
	local MapID,MapX,MapY = GetWorldPos();
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then	--È·±£ÔÚÄÇÈıÕÅµØÍ¼ÉÏ
		Talk(1,"","VËt phÈm nµy chØ sö dông khi cóng tæ tiªn.");
		return FALSE;
	end;
	local selTab = {
				"§­îc! Ta muèn sö dông./use",
				"Th«i ®Ó sau nµy h·y dïng./nothing",
				};
	Say("Ng­¬i cã ®ång ı dïng r­îu ngon ®Ó b¸i tÕ kh«ng?",2,selTab);
end;

function use()
	local nDay = tonumber(date("%d"));
	if Get_Task_Byte(JIBAI_ITEM,3) ~= nDay then
		Set_Task_Byte(JIBAI_ITEM,3,0);
	end;
	if Get_Task_Byte(JIBAI_ITEM,3) == 0 then
		if DelItem(2,0,389,1) == 1 then
			Set_Task_Byte(JIBAI_ITEM,3,nDay);
			local nTotalLuck = Get_Task_Byte(JIBAI_ITEM,4);
			Set_Task_Byte(JIBAI_ITEM,4,nTotalLuck+5);
			if Get_Task_Byte(JIBAI_ITEM,4) > 10 then
				Set_Task_Byte(JIBAI_ITEM,4,10);
			end;			
			Msg2Player("Ng­¬i b¸i tÕ b»ng r­îu ngon cã thÓ thÊy h«m nay ng­¬i rÊt thµnh t©m");
			Write_Log("Sö dông vËt phÈm","§· dïng r­îu ngon b¸i tÕ.  ");
		end;
	else
		Talk(1,"","Ng­¬i h«m nay ®· b¸i tÕ b»ng r­îu ngon, kh«ng thÓ sö dông vËt phÈm nµy n÷a");
	end;
end;

function nothing()

end;