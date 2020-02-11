-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îå¶¾½ÌNPCĞÜÁ¢Script
-- By StarryNight
-- 2006/02/09 PM 17:17

-- Ö±Ãæ×Ô¼ºµÄÄÚĞÄ°É£¡

-- ======================================================

function main()
	if GetSex()==1 then
		Say("B»ng h÷u muèn rêi khái ®©y ­?",2,"Lµm phiÒn huynh ®µi!/outwudu","Kh«ng cÇn ®©u!/no")
	else
		Say("TiÓu c« n­¬ng muèn rêi khái ­?",2,"Lµm phiÒn huynh ®µi!/outwudu","Kh«ng cÇn ®©u!/no")
	end
end;

function outwudu()
	SetFightState(0)
	i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
	end
end

function no()
end;
