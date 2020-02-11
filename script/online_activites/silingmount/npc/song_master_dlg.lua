Include("\\script\\online_activites\\silingmount\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\silingmount\\silingmount.lua")

function main()
	do	return	end
	if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
		return
	end
	local strTitle = VET_TB_SILING_NPC_DLG[1];
	local tbOpt = 
	{
		format("%s/#%s",VET_TB_SILING_NPC_DLG[2],"VET_BuySilingMount(1)"), 
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end