Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 4")==1 then	--ÈÎÎñºó
		Say("Tö viÕt: qu©n tö chi qu¸ d·, nh­ nhËt nguyÖt chi thùc yªn: Qu¸, nh©n giai kiÕn chi; c¶i, nh©n giai ng­ìng chi. ChØ cÇn ta cã lßng sÏ c¶m hãa ®­îc ng­êi kh¸c.", 0)
	elseif CTask:CheckTask("BiÖn Kinh §«ng Th­ sinh 3")==1 then	--Íê³ÉÈÎÎñ
		FinishTask003()
	elseif CTask:IsTaskStart("BiÖn Kinh §«ng Th­ sinh 3")==1 then	--ÈÎÎñÖĞ
		Say("Bªn ngoµi cã nhiÒu <color=yellow>C«n ®å<color> lµm ta kh«ng d¸m ®i l¹i, B»ng h÷u h·y d¹y chóng mét bµi häc, tiÖn ®em <color=yellow>5 Tó Hoa hµi<color> vÒ!", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh §«ng Th­ sinh 3")==1 then	--½ÓÈÎÎñ
		StartTask003()
	else	--ÈÎÎñÇ°
		Say("Tö viÕt: qu©n tö chi qu¸ d·, nh­ nhËt nguyÖt chi thùc yªn: Qu¸, nh©n giai kiÕn chi; c¶i, nh©n giai ng­ìng chi. ChØ cÇn ta cã lßng sÏ c¶m hãa ®­îc ng­êi kh¸c.", 0)
	end
end;


function StartTask003()
	local strMain = {
		"Ta vèn dÜ ®i gÆp NhŞ Hçn kh«ng may gi÷a ®­êng gÆp bän <color=yellow>C«n ®å<color> b¾t ®Õn ®©y. Ng­¬i gióp ta d¹y chóng bµi häc ®­îc kh«ng?",
		"Kh«ng thµnh vÊn ®Ò!/yes003", 
		"Ta bËn råi!/no003", 
}
	CTask:SayEx(strMain)
end


function yes003()
	Say("Bän <color=yellow>C«n ®å<color> võa míi thÊy ®©y giê kh«ng biÕt ®i ®©u. B»ng h÷u d¹y chóng bµi häc nh©n tiÖn ®em <color=yellow>5 Tó Hoa hµi<color> vÒ!", 0)
	CTask:StartTask("BiÖn Kinh §«ng Th­ sinh 3");
	TaskTip("Trõng trŞ C«n ®å lÊy 5 Tó Hoa hµi.")
end;

function no003()
end;

function FinishTask003()
	Say("§· trõng trŞ bän C«n ®å. VÒ b¸o cho <color=yellow>Hµ Tó C«<color> nghe ca ca lµm mäi chuyÖn ®Òu ®¸ng lµm, ®õng qu¸ lo l¾ng!", 0)
	CTask:FinishTask("BiÖn Kinh §«ng Th­ sinh 3");
	CTask:PayAward("BiÖn Kinh §«ng Th­ sinh 3")
	TaskTip("VÒ nãi l¹i víi Hµ Tó C« nghe chuyÖn anh trai cña m×nh!")
end;