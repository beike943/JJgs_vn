--filename:yupei_item.lua
--create date:2006-01-22
--author:yanjun
--describe:ÓñÅå½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
function OnUse()
	if CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		if MapID == 306 and GetItemCount(2,0,353) >= 1 then
			local timeleft = 21*60+4 - GetTime() + GetTask(TASK_USE_YUPEI)
			if GetTask(TASK_USE_YUPEI) == 0 or timeleft < 0 then
				if DelItem(2,0,354,1) == 1 then
					local npcIndex = CreateNpc("Quû Vùc L·o L·o","Quû Vùc L·o L·o",MapID,MapX,MapY,-1,1,1,100)
					SetNpcScript(npcIndex,"\\script\\online\\qingrenyuanxiao\\guiyulaolao_npc.lua")
					--NpcChat(npcIndex,"´óµ¨Äþ²É³¼£¬¾ÓÈ»»¹¸ÒÀ´ÕÒÎÒ£¡ß×£¿ÄãÃÇÁ½ÈËÊÇË­£¿")
					OldPlayerIndex = PlayerIndex
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_USE_YUPEI,GetTime())
						TaskTip("mang YÕn XÝch Hµ b¶o kiÕm ®¸nh b¹i Quû Vùc L·o L·o")
					end
					PlayerIndex = OldPlayerIndex
				end
			else
				Say("Ngäc béi kh«ng thÓ sö dông liªn tôc, b¹n h·y chê"..timeleft.." gi©y míi cã thÓ sö dông tiÕp.",0)
			end
		else
			Say("Ngäc béi chØ cã thÓ sö dông ë Giang T©n th«n, ®ång thêi ph¶i mang YÕn XÝch Hµ b¶o kiÕm.",0)
		end
	else
		Say("Kh«ng thÓ sö dông ngäc béi",0)
	end
end