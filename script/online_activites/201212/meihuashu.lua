Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	local tSay = {}
	if gf_CheckEventDateEx(81) == 1 then
		tSay = aah_GetSayDialog(81);
	end
	tinsert(tSay, "Ra khi/nothing");
	Say("Mai vµng nghinh xu©n, kim l¨ng ®é h­¬ng, ®©y lµ kho¶n kh¾c th­ëng hoa mïa xu©n ®Ñp nhÊt.", getn(tSay), tSay);
end