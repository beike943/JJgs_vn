--µôÂä´¥·¢Æ÷
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function LSB_Trigger()
	if LSB_IsActivityOpen() == 1 then
		if GetLevel() < Min_Level or GetPlayerFaction() == 0 then
			return 0;
		end
		local nMapId,nX,nY = GetWorldPos();
		if LSB_IsAllowMap({507,504,501},nMapId) == 0 then
			return 0;
		end
		local nRand = random(1,100);
		if nRand <= 20 then
			local nNpcIdx,sMoban,sName = GetTriggeringUnit();
			if nMapId == 507 then
				if sName == "NhÊt PhÈm §­êng MËt Sø" or sName == "Cao thñ quan ngo¹i"  then
					AddItem(Item_Trigger_Drop[1],Item_Trigger_Drop[2],Item_Trigger_Drop[3],1);
				end
			end
			if nMapId == 504 then
				if sName == "Yªu c¬ Ba T­" or sName == "T©y Vùc H·n Phô"  then
					AddItem(Item_Trigger_Drop[1],Item_Trigger_Drop[2],Item_Trigger_Drop[3],1);
				end
			end
			if nMapId == 501 then
				if sName == "T©y B¾c Tr¸ng H¸n" or sName == "T©y B¾c Yªn H¸n"  then
					AddItem(Item_Trigger_Drop[1],Item_Trigger_Drop[2],Item_Trigger_Drop[3],1);
				end
			end
		end
	else
		RemoveTrigger(GetTrigger(1275*2));
	end
end