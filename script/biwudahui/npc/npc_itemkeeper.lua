--Create Date:2008-1-11 14:46
--Author:yanjun
--Description:item keeper
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>Thñ khè<color>:";

function main()
	local selTab = {
				"Më r­¬ng chøa ®å/open_box",
				--"¼ì²éÎÒµÄ×°±¸ÊÇ·ñ·ûºÏ¹æ¶¨/check_equipment",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
--	if nGetReadyState == 0 then
--		tinsert(selTab,3,"ÎÒ×¼±¸ºÃÁË/get_ready");
--	elseif nGetReadyState == nOppIdx then
--		tinsert(selTab,3,"ÎÒ×¼±¸ºÃÁË£¨¶ÔÊÖÒÑ×¼±¸ºÃ£©/get_ready");
--	end;
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,3,"ÎÒÒªÄäÃû±ÈÎä/#hide_name(1)");
--	else
--		tinsert(selTab,3,"ÎÒÒªÒÔÕæÃû±ÈÎä/#hide_name(0)");
--	end;
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		while getn(selTab) >= 3 do
			tremove(selTab,3);
		end;
	end;
	tinsert(selTab,"Kh«ng cã g×/nothing");
	Say(g_szInfoHead.."Cã cÇn gióp g× kh«ng?",getn(selTab),selTab);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHead.."Ng­¬i vÉn ch­a thuéc vÒ r­¬ng cña m×nh.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment()
	local nRetCode,tbEquip = BWT_CheckEquipment();
	local szHint = "";
	if nRetCode == 1 then
		Talk(1,"",g_szInfoHead.."Trang bÞ cña b¹n phï hîp quy ®Þnh tû vâ");
	else
		for i=1,getn(tbEquip) do
			if tbEquip[i] ~= 1 then
				szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color> vµo,";
			end;
		end;
		Talk(1,"",g_szInfoHead.."Trang bÞ kh«ng phï hîp quy ®Þnh tû vâ lµ"..szHint.."H·y kiÓm tra trang bÞ cña b¹n.");
	end;
end;

function hide_name(nType)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	if nType == 1 then
		UseMask(1,0);
	else
		UseMask(0,0);
	end;
end;

function get_ready()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	local nRetCode = BWT_CheckEquipment();
	if nRetCode ~= 1 then
		Talk(1,"",g_szInfoHead.."Xin lçi, trang bÞ cña b¹n kh«ng phï hîp quy ®Þnh tû vâ, h·y kiÓm tra trang bÞ.");
		return 0;
	end;
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
	BWT_SetPlayerFightState();	--Ö»Òª×¼±¸ºÃÁË¾Í½øÈë×¼±¸×´Ì¬ÁË
	if nGetReadyState ~= 0 then
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"×°±¸¼ì²éÊ±¼ä½áÊø£¬½ÓÏÂÀ´ÊÇ×¼±¸Ê±¼ä¡£");
		Talk2SomeOne(nPIdx1,1,"","L­u ph¸i ®èi thñ lµ <color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>. TiÕp theo lµ thêi gian chuÈn bÞ.");
		Talk2SomeOne(nPIdx2,1,"","L­u ph¸i ®èi thñ lµ <color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>. TiÕp theo lµ thêi gian chuÈn bÞ.");
		Msg2SomeOne(nPIdx1,"L­u ph¸i ®èi thñ lµ :"..BWT_GetPlayerRouteName(nPIdx2)..". TiÕp theo lµ thêi gian chuÈn bÞ.");
		Msg2SomeOne(nPIdx2,"L­u ph¸i ®èi thñ lµ :"..BWT_GetPlayerRouteName(nPIdx1)..". TiÕp theo lµ thêi gian chuÈn bÞ.");
		BWT_ChangeMSState(MS_STATE_READY);
	else
		SetMissionV(MV_GET_READY,PlayerIndex);
		Talk(1,"",g_szInfoHead.."§îi ®èi thñ chÈn bÞ hoµn tÊt.");
		Msg2SomeOne(nOppIdx,"§èi thñ ®· chuÈn bÞ xong")
	end;
end;
