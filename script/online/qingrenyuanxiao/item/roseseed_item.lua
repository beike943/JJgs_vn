--filename:roseseed_item.lua
--create date:2006-01-19
--author:yanjun
--describe:Ãµ¹å»¨ÖÖ×Ó
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse()
	local selTab = {
				"§óng råi./plant",
				"Ta suy nghÜ l¹i!/nothing"
				}
	Say("B¹n muèn trång h¹t hoa hång ­?",2,selTab)
end

function plant()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_LIFE) ~= 0 and GetTime() - GetTask(TASK_ROSE_LIFE) <= ROSELIFE then
		Say("B¹n ®· trång 1 ®ãa hoa, h·y cè g¾ng ch¨m sãc nã.",0)
		return 0
	end
	if GetItemCount(2,0,351) == 0 then
		Say("B¹n muèn t­íi n­íc nh­ng sao kh«ng mang {Lé thñy} vËy?",0)
		return 0
	end 
	if IsLoversTeam() == 1 then
		if GetSex() == 1 then
			if DelItem(2,0,352,1) == 1 then
				if DelItem(2,0,351,1) == 1 then
					local nameMale,nameFemale = GetLoversName()		
					local MapID,MapX,MapY = GetWorldPos()
					local npcRoseIndex = CreateNpc("MÇm hoa hång","®Ó"..nameFemale.." cho ra hoa hång non",MapID,MapX,MapY)
					SetNpcLifeTime(npcRoseIndex,ROSELIFE)
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_LIFE,GetTime())
						SetTask(TASK_ROSE_GROW,0)
						SetTask(TASK_ROSE_INDEX,npcRoseIndex)
						Say("Trong khi trång hoa, kh«ng ®­îc cïng ng­êi ch¬i kh¸c trång thªm, nÕu kh«ng hoa hång kh«ng thÓ træ b«ng.",0);
					end
					PlayerIndex = OldPlayerIndex
					SetNpcScript(npcRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
				end
			end
		else
			Say("Hoa hång chØ cã thÓ do nh©n vËt nam trång, nh©n vËt n÷ h¸i.",0)
		end
	else
		Say("§éi h÷u cña ng­¬i ®©u? Ph¶i 2 ng­êi míi trång ®­îc hoa hång! §©y kh«ng ph¶i ®éi h÷u ban ®Çu, hai ng­êi ph¶i chung thñy míi trång ®­îc hoa hång.",0)
	end
end

function nothing()

end