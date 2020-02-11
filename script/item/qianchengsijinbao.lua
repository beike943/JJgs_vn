Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szPacketName = "TiÒn Tr×nh Tù CÈm Bµo";	--°üµÄÃû×Ö
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Xin gia nhËp ph¸i tr­íc råi kÝch ho¹t"..g_szPacketName.."!");
		return 0;
	end;
	local selTab = {};
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		tinsert(selTab,format("X¸c nhËn, chän c«n lµm vò khÝ/#add_item(%d,%d)",nItemIdx,5));
		tinsert(selTab,format("X¸c nhËn, chän ®ao lµm vò khÝ/#add_item(%d,%d)",nItemIdx,4));
	else
		tinsert(selTab,format("§ång ý/#add_item(%d,%d)",nItemIdx,0));
	end;
	tinsert(selTab,"Hñy bá/nothing");	
	Say("B¹n muèn më <color=yellow>"..g_szPacketName.."<color> B¹n nhËn ®­îc 1 bé <color=yellow>trang bÞ s­ m«n s¬ cÊp<color> vµ <color=yellow>100<color> ®iÓm cèng hiÕn s­ m«n.",getn(selTab),selTab);
end;

function add_item(nItemIdx,nType)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = fe_AddFactionEquipment(nRoute,nBody,40,nType);
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bÞ s­ m«n s¬ cÊp.");
		SetTask(336,GetTask(336)+100);
		Msg2Player("B¹n nhËn ®­îc 100 ®iÓm cèng hiÕn s­ m«n");
		WriteLog("["..g_szPacketName.."]:"..GetName().."Më 1 tói ");
	end;
end;