---ÃØ¾³´«ËÍÈË.lua---
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>§Ö tö C«n L«n thÇn bİ <color>: "
function main()
	Say("Kh«ng ngê Ng« ViÖt l·o tæ dïng nha ph¸p tinh chÕ ra HuyÕt C« L©u. Nha vËt ®ang ë sau mËt thÊt, ng­¬i cã thÓ ®Õn ®ã trõ ma gióp ta?",3,"§i Thiªn S­ mËt c¶nh/tianshimijing","NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_33","Kh«ng cÇn ®©u!/no");
end;
function tianshimijing()
		NewWorld(329,1886,3762);
		SetFightState(1)
end


function no()
end;