--Íæ¼ÒËÀÍö½Å±¾
Include("\\script\\battles\\butcher\\head.lua")

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--¸üÐÂÉ±NpcÊýÄ¿ºÍÅÅÐÐ°ñ
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --¼ÇÂ¼Íæ¼ÒÉ±ÆäËüÍæ¼ÒµÄ×ÜÊý
			serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --¼ÇÂ¼Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý

--			if (mod(serieskill, 3) == 0) then
--				if (deathcamp == 1) then
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--	
--						Msg2Player("Äã»ñµÃÈýÁ¬Õ¶Õ½¹¦"..BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--				else
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--	
--						Msg2Player("Äã»ñµÃÈýÁ¬Õ¶Õ½¹¦"..BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--				end
--			end
	
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
				BT_SetData(PL_MAXSERIESKILL, serieskill) -- Í³¼ÆÍæ¼ÒµÄ×î´óÁ¬Õ¶Êý
			end
			
			bt_addtotalpoint(1)
			but_addmissionpoint(3)
		
--			if (deathcamp == 1) then
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--			else
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--			end
		
			local rankname = "";
--			if (currank > 0) then
--				rankname = tbRANKNAME[currank]
--				if (deathcamp == 1) then
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 2) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				else
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 1) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				end
--			end
		
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = "Tèng"..LaunName.." ®· h¹ gôc phe Liªu_"..rankname..DeathName.."cña phe Liªu, tæng sè PK lµ"..BT_GetData(PL_KILLPLAYER);
			else
				str  = "Liªu"..LaunName.." ®· h¹ gôc phe Tèng_"..rankname..DeathName.."cña phe Liªu, tæng sè PK lµ"..BT_GetData(PL_KILLPLAYER);
			end
		
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	
	if (currank > 0) then
		if (mod(BT_GetData(PL_BEKILLED), 3) == 0) then
			Msg2Player("Tin tøc chiÕn dÞch: B¹n ®· bÞ gi¸ng chøc!");
			BT_SetData(PL_CURRANK, currank - 1);
			Title_RemoveTitle(currank)
			if (currank > 1) then
				Title_AddTitle(currank - 1, 0, 99999)
			end
			Title_ActiveTitle(currank - 1)
		end
	end

	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end
