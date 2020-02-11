--filename:rose_npc.lua
--create date:2006-01-19
--author:yanjun
--describe:Ãµ¹å»¨½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local nOldPlayerIndex = PlayerIndex;
	local npcRoseIndex = GetTargetNpc()
	if GetTime() - GetTask(TASK_ROSE_LIFE) > ROSELIFE or npcRoseIndex ~= GetTask(TASK_ROSE_INDEX) then
		return 0
	end
	if IsLoversTeam() == 1 then
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TASK_ROSE_INDEX) ~= npcRoseIndex then
				PlayerIndex = nOldPlayerIndex;
				Say("Mèi t×nh chung thñy míi trång ®­îc hoa hång mü lÖ.",0)
				return 0;
			end;
		end
		PlayerIndex = nOldPlayerIndex;
		local selTabMale = {
					"Ta muèn t­íi n­íc./manure",
					"Xem søc sèng cña hoa hång./checklife",
					"Yªn t©m./nothing"
					}
		local selTabFemale = {
					"H¸i hoa hång./getrose",
					"Xem søc sèng cña hoa hång./checklife",
					"H·y ®îi./nothing"
					}
		local selTab = {
					"Xem søc sèng cña hoa hång./checklife",
					"Yªn t©m./nothing"
					}
		if GetSex() == 1 and GetTask(TASK_ROSE_GROW) == 3 then
			Say("Hoa hång ®· træ b«ng, h·y mau nhê ý trung nh©n h¸i xuèng.",2,selTab)
			return 0
		end
		if GetSex() == 1 then
			Say("Hoa ¬i, h·y mau në!",3,selTabMale)
		elseif GetSex() == 2 then
			Say("Hoa ¬i, h·y mau në!",3,selTabFemale)	
		end
	elseif GetTeamSize() ~= 2 then
		Say("Tæ ®éi cña b¹n ®©u? Ph¶i 2 ng­êi míi trång ®­îc hoa hång!",0)
	else
		Say("§©y kh«ng ph¶i tæ ®éi ban ®Çu cña b¹n, hai ng­êi ph¶i chung thñy míi trång ®­îc hoa hång.",0)
	end
end

function manure()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		if IsLoversTeam() == 1 then
			if GetTime() - GetTask(TASK_ROSE_LIFE) <= ROSELIFE/2 then
				Say("Míi t­íi n­íc, h·y ®îi 1 l¸t.",0)
				return 0
			end
			if GetItemCount(2,0,351) >=1 then
				if DelItem(2,0,351,1) == 1 then
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_GROW,GetTask(TASK_ROSE_GROW)+1)
						SetTask(TASK_ROSE_LIFE,GetTime())
					end
					PlayerIndex = OldPlayerIndex
					local nameMale,nameFemale = GetLoversName()
					local npcRoseIndex = GetTargetNpc()
					local MapID,MapX,MapY = GetNpcWorldPos(npcRoseIndex)
					if GetTask(TASK_ROSE_GROW) == 1 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local npcRoseIndex1 = CreateNpc("MÇm Hoa hång","®Ó"..nameFemale.." trång hoa hång",MapID,MapX,MapY)
						SetNpcScript(npcRoseIndex1,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
						for i=1,2 do
							PlayerIndex = GetTeamMember(i)
							SetTask(TASK_ROSE_INDEX,npcRoseIndex1)
						end
						PlayerIndex = OldPlayerIndex
					elseif GetTask(TASK_ROSE_GROW) == 2 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local npcRoseIndex2 = CreateNpc(" nh¸nh hoa hång","®Ó"..nameFemale.." nô hoa",MapID,MapX,MapY)
						SetNpcScript(npcRoseIndex2,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
						for i=1,2 do
							PlayerIndex = GetTeamMember(i)
							SetTask(TASK_ROSE_INDEX,npcRoseIndex2)
						end
						PlayerIndex = OldPlayerIndex
					elseif GetTask(TASK_ROSE_GROW) == 3 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local nRandomNum = random(1,100)
						if nRandomNum <= 90 then
							local npcRedRoseIndex = CreateNpc("Hoa hång ®á","®Ó"..nameFemale.." trång hång mai quÕ hoa",MapID,MapX,MapY)
							SetNpcScript(npcRedRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcRedRoseIndex)
								SetTask(TASK_ROSE_TYPE,1)
							end
							PlayerIndex = OldPlayerIndex
						elseif nRandomNum <= 95 then
							local npcBlackRoseIndex = CreateNpc("Hoa hång tr¾ng","®Ó"..nameFemale.." trång phÊn mai quÕ hoa",MapID,MapX,MapY)
							SetNpcScript(npcBlackRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcBlackRoseIndex)
								SetTask(TASK_ROSE_TYPE,2)
							end
							PlayerIndex = OldPlayerIndex			
						elseif nRandomNum <= 100 then
							local npcyellowRoseIndex = CreateNpc("Hoa hång vµng","®Ó"..nameFemale.." trång hoµng mai quÕ hoa",MapID,MapX,MapY)
							SetNpcScript(npcyellowRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcyellowRoseIndex)
								SetTask(TASK_ROSE_TYPE,3)
							end
							PlayerIndex = OldPlayerIndex							
						end
					end
					SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),ROSELIFE)
					--DebugOutput("rose's age is:"..GetTask(TASK_ROSE_GROW))
				end
			else
				Say("B¹n kh«ng mang {Lé thñy}!",0)
			end
		elseif GetTeamSize() ~= 2 then
			Say("Tæ ®éi cña b¹n ®©u? Ph¶i 2 ng­êi míi trång ®­îc hoa hång!",0)
		else
			Say("§©y kh«ng ph¶i tæ ®éi ban ®Çu cña b¹n, hai ng­êi ph¶i chung thñy míi trång ®­îc hoa hång.",0)
		end
	end
end

function checklife()
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		local timelapse = GetTime() - GetTask(TASK_ROSE_LIFE)
		local roselife = floor((ROSELIFE - timelapse)/60)+1
		local watertime = roselife - floor(ROSELIFE/2/60)
		if watertime < 0 then
			watertime = 0
		end
		if GetTask(TASK_ROSE_GROW) == 3 then
			Say("Hoa hång ®· træ b«ng, nÕu trong <color=yellow>"..roselife.."<color> phót kh«ng h¸i sÏ kh« chÕt.",0)
		else
			Say("Hoa hång ph¶i mÊt <color=yellow>"..watertime.."<color> phót míi cã thÓ træ b«ng. NÕu trong vßng <color=yellow>"..roselife.."<color> phót kh«ng t­íi n­íc sÏ kh« chÕt.",0)
		end
	else
		--DebugOutput("TASK("..TASK_ROSE_INDEX.."):"..GetTask(TASK_ROSE_INDEX))
		--DebugOutput("GetTargetNpc:"..GetTargetNpc())
	end
end

function getrose()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		if IsLoversTeam() == 1 then
			if GetSex() == 2 and GetTask(TASK_ROSE_GROW) == 3 then
				local timeleft = ROSELIFE - (GetTime() - GetTask(TASK_ROSE_LIFE))
				if timeleft >= ROSELIFE/2 then
					local minleft = floor((timeleft-floor(ROSELIFE/2))/60)+1
					Say("Hoa hång võa míi hÐ nô, hiÖn ch­a thÓ h¸i. Sau <color=yellow>"..minleft.."<color> phót b¹n cã thÓ h¸i hoa hång.",0)
					return 0
				end
				local npcRoseIndex = GetTargetNpc()
				SetNpcLifeTime(npcRoseIndex,0)
				local rose = {
							{0,108,117},
							{0,108,118},
							{0,108,119},
							{0,108,120},
							{0,108,121},
							{0,108,122},							
							}
				local rosetype = GetTask(TASK_ROSE_TYPE)
				if GetBody() == 4 then
					rosetype = rosetype + 3
				end
				if AddItem(rose[rosetype][1],rose[rosetype][2],rose[rosetype][3],1) == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 ®ãa hoa hång.")
					for i=1,2 do 
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_INDEX,0)
						SetTask(TASK_ROSE_GROW,0)
						SetTask(TASK_ROSE_LIFE,0)
					end
					PlayerIndex = OldPlayerIndex
				end
			else
				Say("Hoa hång vÉn ch­a træ b«ng.",0)
			end
		elseif GetTeamSize() ~= 2 then
			Say("Tæ ®éi cña b¹n ®©u? Ph¶i 2 ng­êi míi trång ®­îc hoa hång!",0)
		else
			Say("§©y kh«ng ph¶i tæ ®éi ban ®Çu cña b¹n, hai ng­êi ph¶i chung thñy míi trång ®­îc hoa hång.",0)
		end
	end
end

function nothing()

end
