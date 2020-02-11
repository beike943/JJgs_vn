-- ÌÆÃÅ½ÓÒıµÜ×Ó

function main()
	if GetPlayerFaction() == 5  then
		Say("Ta cã thÓ gióp g× ch¨ng?",3,"Nhê s­ huynh ®­a ta vÒ ph¸i./gototangmen","T×m hiÓu khu vùc luyÖn cÊp/maphelp","Nhê s­ huynh vÊn an L·o L·o giïm ta!/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","Quı ph¸i danh vang thiªn h¹, bæn m«n thËt kh«ng thÓ b×!")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Tuy cïng lµ ng­êi Tø Xuyªn, nh­ng tr­íc giê kh«ng can hÖ g× nhau c¶!")
	elseif GetPlayerFaction() == 1 then
		Talk(1,"","Vâ c«ng thiªn h¹ ®Òu b¾t nguån tõ ThiÕu L©m, ch¼ng hay ¸m khİ vµ bÉy cña §­êng M«n ta cã nguån gèc tõ ®©u?")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","ThËt kh«ng ngê 1 ®¸m ¨n mµy còng cã thÓ danh vang 1 câi, bæn m«n thËt lµ béi phôc!")
	else
		Say("T×m ta cã viÖc chi?",2,"Ta muèn tham quan §­êng M«n/gototangmen","Kh«ng cã g×!/no")
	end
end

function gototangmen()
	NewWorld(305, 1532, 2915)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function no()
end;

function maphelp()
end;