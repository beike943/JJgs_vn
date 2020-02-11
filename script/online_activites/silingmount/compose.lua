Include("\\script\\online_activites\\silingmount\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");

function CheckCompose()
	if (1 == gf_Judge_Room_Weight(1, 0, "")) then
		return 1;
	end
	return 0;
end

function ComposeSuccess()
	do	return	end
	local tbMount = gf_EventGiveRandAward(VET_TB_SILING_COMPOSE_MOUNT_LIST, 10000, 1, VET_STR_SILING_LOG_TITLE, VET_TB_SILING_LOG_ACTION[1]);
	local strPlayerName = GetName();
	if (type(tbMount) == "table" and type(tbMount[3]) == "string" and type(strPlayerName) == "string") then
		Msg2Global(format(VET_TB_SILING_MSG[1], strPlayerName, VET_TB_SILING_ITEM_TITLE[1], tbMount[3]));
	end
	return 1;
end

function LostItem(nG,nD,nP,nCount)
	Msg2Player(format(VET_TB_SILING_MSG[2],VET_TB_SILING_ITEM_TITLE[1],GetItemName(nG,nD,nP)));
end