--ÔÚÑïÖÝÈÎÎñÏÄºîÓ¢
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	
	--»î¶¯µÄ
	local tSay = {};
	local tActivityID = {134};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
		if getn(tSay) > 0 then
			tinsert(tSay, "\nKÕt thóc ®èi tho¹i/nothing");	
			Say(format("<color=green>H¹ HÇu Anh:<color> %s cÇn gióp ®ì g×?",gf_GetPlayerSexName()), getn(tSay), tSay);
			return 1;
		end
	end
	
  Talk(1,"","<color=green>H¹ HÇu Anh<color>: ……");
end;