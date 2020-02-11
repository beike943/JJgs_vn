Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szPacketName = "Tói S­ §å T×nh Th©m";	--°üµÄÃû×Ö
g_nNeedRoom = 1;
g_nNeedWeight = 100;	
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Xin gia nhËp ph¸i tr­íc råi kÝch ho¹t"..g_szPacketName.."!");
		return 0;
	end;
	local selTab = {};
	tinsert(selTab,format("§ång ý/#add_item(%d)",nItemIdx));
	tinsert(selTab,"Hñy bá/nothing");	
	Say("B¹n muèn më <color=yellow>"..g_szPacketName.."<color>chø? B¹n cã thÓ nhËn ®­îc <color=yellow>m·o S­ M«n Trung CÊp <color> vµ <color=yellow>200<color> ®iÓm cèng hiÕn S­ m«n.",getn(selTab),selTab);
end;

function add_item(nItemIdx)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = fe_AddFactionEquipment(nRoute,nBody,61,0);
		Msg2Player("B¹n nhËn ®­îc 1 m·o S­ m«n trung cÊp");
		SetTask(336,GetTask(336)+200);
		Msg2Player("B¹n nhËn ®­îc 200 ®iÓm cèng hiÕn S­ m«n ");
		WriteLog("["..g_szPacketName.."]:"..GetName().."Më 1 tói ");
	end;
end;