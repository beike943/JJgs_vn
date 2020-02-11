
function main()
	if GetPlayerFaction() == 2  then
		Say("Xem ra cã viÖc phiÒn ®Õn ta, ®óng kh«ng?",3,"PhiÒn huynh ®­a ®Ö xuèng nói!/gotowudang","T×m hiÓu khu vùc luyÖn cÊp/maphelp","Thay ®Ö vÊn an s­ phô!/no")
	elseif GetPlayerFaction() == 1  then
		Talk(1,"","Th× ra lµ tiÓu s­ phô cña ThiÕu L©m, kh«ng biÕt cã g× chØ gi¸o?")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Th× ra lµ n÷ hiÖp cña Nga My! Quı ph¸i vµ bæn ph¸i cã giao h¶o, ®õng nªn kh¸ch s¸o!")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Vâ §ang chóng t«i rÊt ng­ìng mé tuyÖt kü cña quı bang, hy väng sÏ cã dŞp thä gi¸o.")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","Quı ph¸i còng cã thÓ gäi lµ ®¹i ph¸i trong vâ l©m. Hy väng quı ph¸i hµnh sù kh«ng gièng nh­ vò khİ cña quı ph¸i.")
	else
		Say("BÇn ®¹o cã thÓ gióp g×?",2,"Ta muèn tham quan Vâ §ang/gotowudang","Kh«ng cã g×!/no")
	end
end

function gotowudang()
	NewWorld(312, 1713, 3469)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function no()
end;

function maphelp()
end;

