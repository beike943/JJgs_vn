Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("BiÖn Kinh D­îc DÉn 2")==1 then	--ÈÎÎñºó
		Say("NghÒ thÇy thuèc ph¶i lÊy §øc lµm träng!", 0)
	elseif CTask:CheckTask("BiÖn Kinh D­îc DÉn 2")==1 then	--Íê³ÉÈÎÎñ
		FinishTask002()
	elseif CTask:IsTaskStart("BiÖn Kinh D­îc DÉn 2")==1 then	--ÈÎÎñÖĞ
		Say("Kh«ng cã <color=yellow>X¹ h­¬ng<color> dï cã chÕ ®­îc thuèc còng v« dông.", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh D­îc DÉn 2")==1 then	--½ÓÈÎÎñ
		StartTask002()
	else	--ÈÎÎñÇ°
		Say("NghÒ thÇy thuèc ph¶i lÊy §øc lµm träng!", 0)
	end
end;


function StartTask002()
	local strMain = {
		"B»ng h÷u t×m ta cã chuyÖn g×?",
		"MÉu th©n TiÓu Hæ bÖnh råi, muèn t×m ®¹i phu b¾t m¹ch.",
		"Kh«ng cÇn xem mÊy ngµy tr­íc mÑ cËu ta cã l¹i chç ta b¾t m¹ch, ta thÊy do lµm viÖc qu¸ ®é, dÉn ®Õn khİ huyÕt kh«ng ®­îc l­u th«ng, ta cã dÆn tŞnh d­ìng cho kháe. Nay ng· bÖnh xem ra bÖnh t×nh nghiªm träng, thuèc ta cã nh­ng thiÕu mét vŞ xem ra c«ng hiÖu kh«ng ®­îc tèt l¾m.",
		"Kh«ng biÕt ngµi cÇn thuèc g×?",
		"<color=yellow>X¹ h­¬ng<color> trªn ng­êi bän l­u manh, ng­¬i ®i lÊy <color=yellow>3 c¸i<color> lµ ®ñ.",
		"§­îc th«i! §Ó t¹i h¹ ra thµnh ®¸nh <color=yellow>L­u manh<color> lÊy <color=yellow>3 c¸i X¹ h­¬ng<color> vÒ lµm thuèc.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("BiÖn Kinh D­îc DÉn 2");
	TaskTip("§¸nh l­u manh lÊy 3 c¸i X¹ h­¬ng lµm thuèc.")
end


function FinishTask002()
local strMain = {
	"§¹i phu, thuèc ngµi cÇn ®©y!",
	"Tèt l¾m! Ng­¬i mang gãi thuèc nµy vÒ cho TiÓu Hæ, chØ cÇn mÑ h¾n uèng ®óng liÒu l­îng, ba ngµy lµ khái!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("BiÖn Kinh D­îc DÉn 2")
	CTask:PayAward("BiÖn Kinh D­îc DÉn 2")
end;