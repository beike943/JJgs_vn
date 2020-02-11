--Create Date:2007ÄêµÚ¶şÌì
--Describe:£°£·Äê´º½ÚÑ©ÕÌ´«ËÍÈË½Å±¾£¨´«½ø´«³ö£©
--Author:yanjun
Include("\\script\\online\\´º½Ú»î¶¯\\snowwar\\snowwar_head.lua");
--==============================================½øÈë²¿·Ö===================================
function snowwar_enter_main()
        local nDate = tonumber(date("%y%m%d"));
	local strSex = gf_GetPlayerSexName();
	if nDate < 091218 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: MÊy h«m nay tuyÕt ch­a r¬i nªn khu nĞm tuyÕt ch­a thÓ më"..strSex.."lÇn sau quay l¹i nhĞ!");
		return 0;
	elseif nDate > 100117 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xu©n ®Õn hoa në, tuyÕt b¾t ®Çu tan, e r»ng kh«ng thùc hiÖn ®­îc kÕ ho¹ch råi."..strSex.."N¨m tíi c¸c vŞ nhí ®Õn ®©y ch¬i tiÕp nhĞ!");
		return 0;
	end;
	local MapID, nX, nY = GetWorldPos()
	if MapID ~= 300 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:Khu vùc nĞm tuyÕt chØ më ë Thµnh §«!");
		return 0;
	end	
	local selTab = {
				"H·y mau ®­a ta ®Õn ®ã!/go",
				"T×m hiÓu ho¹t ®éng./SW_KnowSnowWar",
				"Ta ®· qua tuæi nµy råi ­!/nothing"
				}
	Say("<color=green>"..g_sNpcName.."<color>: VŞ "..strSex.."lÏ nµo kh«ng muèn nh©n c¬ héi ch¬i ®ïa tháa thİch mét lÇn hay sao?",getn(selTab),selTab)	
end

function go()
	local strSex = gf_GetPlayerSexName();
	local nFieldID = SW_GetFieldIDFromMapID(g_CurMapID);
	if GetPlayerRoute() == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: VŞ "..strSex.."<color=yellow>gia nhËp m«n ph¸i<color> míi ®­îc tham gia nĞm tuyÕt.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: VŞ "..strSex.."§îi ®Õn cÊp <color=yellow>11<color> råi h·y quay l¹i nhĞ!");
		return 0;
	end;
	if mf_GetPlayerCount(MISSION_ID,nFieldID) > MAX_PLAYER then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Sè ng­êi vµo khu nĞm tuyÕt ®· ®ñ, xin"..strSex.."®îi mét chót nhĞ!");
		return 0;
	end;
	if SW_CheckEquipment() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: §Ó cho c«ng b»ng, xin mäi ng­êi t¹m thêi kh«ng sö dông tÊt c¶ Trang BŞ");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nFieldID) == MS_STATE_PEACE then
		--mf_OpenMission(MISSION_ID,nFieldID)
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Thêi gian nĞm tuyÕt vÉn ch­a ®Õn, mçi ngµy khu nĞm tuyÕt sÏ ho¹t ®éng vµo c¸c giê 11, 17, vµ 21 giê.");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,0,nFieldID);
end;
--==============================================Àë¿ª²¿·Ö===================================
function snowwar_leave_main()
	local selTab = {
			"Ta muèn rêi khái khu nĞm tuyÕt/leave",
			"Ta muèn dïng ®iÓm tİch lòy ®æi phÇn th­ëng/want_award",
			"Ta muèn mua tuyÕt cÇu./buysnowball",
			"Xem ®iÓm tİch lòy/see_my_point",
			"Xem sè ng­êi bŞ ta nĞm ng·/see_rank",
			"Ta quªn c¸ch ch¬i råi, h·y nãi l¹i lÇn n÷a./SW_KnowSnowWar",
			"ThËt vÊt v¶ cho ng­¬i!/nothing"
			}
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_COMPLETE then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ch¬i vui kh«ng? Cã cÇn ta gióp g× kh«ng?",getn(selTab),selTab)
end;

function see_my_point()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §iÓm tİch lòy cña b¹n hiÖn lµ <color=yellow>"..GetTask(PT_POINT).."<color>");
end;

function leave()
	local selTab = {
			"Rêi khái/leave_confirm",
			"Ch­a muèn rêi khái/nothing",
			}
	local sSayContent = "Chó ı, sau khi thêi gian nĞm tuyÕt kÕt thóc. <color=yellow>néi trong 20 phót<color> cã thÓ ®Õn gÆp <color=yellow>TuyÕt Gi¶<color> ®Ó nhËn phÇn th­ëng. §õng l·ng phİ ®iÓm tİch lòy. Ng­¬i muèn rêi khái chø?";
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_FIGHT then
		sSayContent = "Thêi gian nĞm tuyÕt kÕt thóc, ng­¬i cã thÓ dïng ®iÓm tİch lòy nĞm tuyÕt ®Ó ®æi phÇn th­ëng. Cã muèn ®æi phÇn th­ëng kh«ng?";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: "..sSayContent,getn(selTab),selTab);
end;

function leave_confirm()
	DelMSPlayer(MISSION_ID,0);
end

function buysnowball()
	Sale(52)
end

function want_award()
	local selTab = {
			"Ta muèn ®æi phÇn th­ëng/get_award",
			"Quay l¹i nhËn sau/nothing",
			}
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i cã tÊt c¶ <color=yellow>"..nPoint.."<color> ®iÓm. ThËt ®¸ng tiÕc! §iÓm tİch lòy kh«ng ®ñ kh«ng thÓ nhËn ®iÓm kinh nghiÖm.");
		return 0;
	end;
	nExp = nPoint * 45000;
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i cã tÊt c¶ <color=yellow>"..nPoint.."<color> ®iÓm tİch lòy, cã thÓ ®æi <color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm, ng­¬i cã muèn ®æi kh«ng?",getn(selTab),selTab);
end;

function get_award()
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i cã tÊt c¶ <color=yellow>"..nPoint.."<color> ®iÓm. ThËt ®¸ng tiÕc! §iÓm tİch lòy kh«ng ®ñ kh«ng thÓ nhËn ®iÓm kinh nghiÖm.");
		return 0;
	end;
	SetTask(PT_POINT,0);
	nExp = nPoint * 45000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
	WriteLogEx("Hoat dong thang 12","®æi ®iÓm nĞm tuyÕt", nExp, "®iÓm kinh nghiÖm")
end;

function see_rank()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: b¹n ®· nĞm ng· <color=yellow>"..GetTask(PT_KILL_COUNT).."<color> ng­êi, bŞ ng·<color=yellow>"..GetTask(PT_DEATH_COUNT).."<color> lÇn.");
end;
--=========================================================================================
