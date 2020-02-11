-- ÉÙÁÖ½ÓÒıµÜ×Ó

function main()
	if GetPlayerFaction() == 1  then
		Say("S­ phô ph¸i s­ ®Ö xuèng nói µ?",3,"PhiÒn huynh ®­a ®Ö xuèng nói!/gotoshaolin","T×m hiÓu khu vùc luyÖn cÊp/maphelp","Thay ®Ö vÊn an s­ phô!/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","Vâ §ang víi ThiÕu L©m ®Òu lµ Th¸i S¬n B¾c §Èu, thiªn h¹ anh hïng héi th¸ng sau kh«ng biÕt quı ph¸i cho ai ra nghªnh chiÕn?")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Danh tiÕng quı ph¸i vang xa, tiÓu t¨ng ®©y kh©m phôc!")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","TiÓu t¨ng ng­ìng mé tÊt c¶ anh em trong quı bang.")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","¸m khİ vµ bÉy §­êng M«n danh chÊn giang hå. Cã dŞp tiÓu bèi xin thØnh gi¸o vµi chiªu!")
	else
		Say("Thİ chñ t×m tiÓu t¨ng cã viÖc chi?",2,"Ta muèn tham quan ThiÕu L©m/gotoshaolin","Kh«ng cã g×!/no")
	end
end

function gotoshaolin()
	NewWorld(204, 1501, 3328)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function no()
end;

function maphelp()
end;

