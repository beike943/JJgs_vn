Include("\\script\\online_activites\\shimen_tier4\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")

function main()
	if (gf_CheckEventDateEx(VET_TIER4_ACTIVITY_ID) ~= 1) then
		return
	end
	local strTitle = format(VET_TB_TIER4_NPC_DLG[8],VET_TB_TIER4_ITEM_NAME[1],VET_TB_TIER4_ITEM_NAME[4]);
	local tbOpt = 
	{
		format("%s/%s",format(VET_TB_TIER4_NPC_DLG[9],VET_TB_TIER4_ITEM_NAME[4]),"VET_Tier4ShowEquip"),
		format("%s/%s",format(VET_TB_TIER4_NPC_DLG[10],VET_TB_TIER4_ITEM_NAME[4]),"VET_Tier4ExchaneEquip_Dlg"),
		format("%s/%s",format(VET_TB_TIER4_NPC_DLG[11],VET_TB_TIER4_ITEM_NAME[1]),"VET_Tier4Help_Dlg"),
		format("%s/%s",VET_TB_TIER4_NPC_DLG[1],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end