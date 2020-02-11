Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\hunduantongtianding\\qrs_npc.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--»î¶¯µÄ
	local tSay = {};
	local tActivityID = {130};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
		if getn(tSay) > 0 then
			tinsert(tSay, "\nKÕt thóc ®èi tho¹i/nothing");	
			Say(format("<color=green>NhËm Doanh Doanh:<color> %s cÇn sù gióp ®ì g×?",gf_GetPlayerSexName()), getn(tSay), tSay);
			return 1;
		end
	end
	
	--½øÈëÍ¨Ìì»Ã¾³
	ttd_entry_npc_main()
end