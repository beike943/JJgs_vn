function main()
	Say("T×m ta cã viÖc g×?",
		2,
		"Ta muèn mua vËt phÈm b¸i s­/baishibuy",
		"Kh«ng cã viÖc g×/qita")
end

function baishibuy()
		Say("HiÖp ThiÕu KiÕm vµ Thiªu töu bæn tiÖm lµ lo¹i th­îng h¹ng, gi¸ chØ cã 40 ®ång. Kh¸ch quan cã muèn mua kh«ng?",
		2,
		"Mua/buyshimen",
		"Kh«ng mua/meiqian")
end

function buyshimen()
		Say("§©y lµ HiÖp ThiÕu KiÕm vµ Thiªu töu!", 0);
		Pay(40)	
		AddItem(0,2,14,1)
		AddItem(2,1,12,1)		
end;

function meiqian()
		Say("Kh«ng tiÒn th× ®õng ®Õn b¸i s­! Chõng nµo cã tiÒn råi h·y quay l¹i.", 0);	
end;

	
function qita()
	i=random(1,3)
	if i == 1 then
		Say("MÆc dï Minh NguyÖt ta chØ lµ mét tiÓu ®¹o ®ång nh­ng còng lµ ®Ö tö ph¸i Vâ §ang, ng­¬i xem th­êng ta µ?",0)
	elseif	i == 2 then
		Say("Minh nguyÖt c¬ thêi h÷u, b¶ töu vÊn thanh thiªn. H«m ®ã s­ phô nhÊt ®Şnh ®· uèng say nªn míi ®Æt cho ta tªn ®ã.",0)
	else
		Say("Kh«ng cã viÖc g× th× ®õng phiÒn ta thanh tu",0)
	end
end;

