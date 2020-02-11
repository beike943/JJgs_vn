--File name:mantou_item.lua
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
	Say("Ng­¬i cã ®ång ı dïng mµn thÇu ®Ó b¸i tÕ kh«ng?",2,selTab);
end;

function use()
	local nDay = tonumber(date("%d"));
	if Get_Task_Byte(JIBAI_ITEM,1) ~= nDay then
		Set_Task_Byte(JIBAI_ITEM,1,0);
	end;
	if Get_Task_Byte(JIBAI_ITEM,1) == 0 then
		if DelItem(2,0,387,1) == 1 then
			Set_Task_Byte(JIBAI_ITEM,1,nDay);
			local nTotalLuck = Get_Task_Byte(JIBAI_ITEM,4);
			Set_Task_Byte(JIBAI_ITEM,4,nTotalLuck+2);
			if Get_Task_Byte(JIBAI_ITEM,4) > 10 then
				Set_Task_Byte(JIBAI_ITEM,4,10);
			end;
			Msg2Player("Ng­¬i b¸i tÕ b»ng mµn thÇu cã thÓ thÊy h«m nay ng­¬i rÊt thµnh t©m");
			Write_Log("Sö dông vËt phÈm","§· dïng mµn thÇu b¸i tÕ. ");
		end;
	else
		Talk(1,"","H«m nay ng­¬i ®· b¸i tÕ b»ng mµn thÇu, kh«ng thÓ sö dông vËt phÈm nµy n÷a");
	end;
end;

function nothing()

end;