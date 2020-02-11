Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("BiÖn Kinh D­îc DÉn 3")==1 then	--ÈÎÎñºó
		Say("BÖnh mÉu th©n ®· khái, xin ®a t¹!", 0)
	elseif (CTask:CheckCanStart("BiÖn Kinh D­îc DÉn 3")==1) and (GetItemCount(2,0,30)>=1)  then	--Íê³ÉÈÎÎñ
		StartTask003()
	elseif CTask:IsTaskStart("BiÖn Kinh D­îc DÉn 1")==1 then	--ÈÎÎñÖĞ
		Say("Ch­a mêi ®­îc ®¹i phu n÷a sao?", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh D­îc DÉn 1")==1 then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Say("Hu! Hu! Hu!", 0)
	end
end;


function StartTask001()
	local strMain = {
		"Hu! Hu! MÉu th©n ng· bÖnh råi, ng­¬i gióp ta t×m ®¹i phu ®­îc kh«ng?",
		"Kh«ng thµnh vÊn ®Ò!/yes001", 
		"Ta bËn råi!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("Nhê ng­¬i t×m <color=yellow>L·nh ®¹i phu<color> chÈn bÖnh cho mÉu th©n, nghe nãi «ng ta ®ang ë h­íng ®«ng <color=yellow>suèi th¸c<color> h¸i thuèc.", 0)
	CTask:StartTask("BiÖn Kinh D­îc DÉn 1");
	CTask:FinishTask("BiÖn Kinh D­îc DÉn 1");
	TaskTip("§Õn suèi th¸c t×m L·nh ®¹i phu chÈn bÖnh cho mÉu th©n TiÓu Hæ.")
end;

function no001()
end;

function StartTask003()
local strMain = {
	"Thuèc cña mÉu th©n ng­¬i ®©y!",
	"Xin ®a t¹! Thùc ra lóc tr­íc trong th«n cã vŞ ®¹i hiÖp tªn Thêi Thiªn còng tèt bông nh­ ngµi nh­ng vÒ sau kh«ng biÕt do nguyªn nh©n g× ®· rêi khái.",
	"Khi Thêi Thiªn thóc ®i cã ®Ó l¹i mét bøc th­ nãi ®îi ch¸u lín lªn t×m ®­îc 2 bøc cßn l¹i lªn T­¬ng D­¬ng t×m «ng ta häc vâ. Giê giao bøc th­ l¹i cho hiÖp sÜ, hy väng n¾m b¾t c¬ héi nµy.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("BiÖn Kinh D­îc DÉn 3");
	DelItem(2,0,30,1)
	CTask:FinishTask("BiÖn Kinh D­îc DÉn 3")
	CTask:PayAward("BiÖn Kinh D­îc DÉn 3")
end;