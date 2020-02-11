Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Thêi Thiªn T­¬ng D­¬ng (3 )")==1 then	--ÈÎÎñºó
		Talk(1,"","Giang hå l¹i dËy sãng n÷a råi.")
	elseif CTask:CheckTask("Thêi Thiªn T­¬ng D­¬ng (3 )")==1 then	--Íê³ÉÈÎÎñ
		FinishTask003()
	elseif CTask:IsTaskStart("Thêi Thiªn T­¬ng D­¬ng (3 )")==1 then	--ÈÎÎñÖĞ
		Talk(1,"","<color=yellow>Kh«ng Kh«ng DiÖu Thñ<color> chØ cã thÓ ®¸nh b¹i <color=yellow>V­¬ng Lu©n<color> ë <color=yellow>D· Tr­ l©m <color> míi cã thÓ lÊy ®­îc.")
	elseif CTask:CheckCanStart("Thêi Thiªn T­¬ng D­¬ng (3 )")==1 then	--½ÓÈÎÎñ
		StartTask003()
	elseif CTask:IsTaskFinish("Thêi Thiªn T­¬ng D­¬ng (2 )")==1 then	--ÈÎÎñºó
		Talk(1,"","§îi ®Õn <color=yellow>cÊp 30<color> h·y quay l¹i.")
	elseif CTask:CheckTask("Thêi Thiªn T­¬ng D­¬ng (2 )")==1 then	--Íê³ÉÈÎÎñ
		FinishTask002()
	elseif CTask:IsTaskStart("Thêi Thiªn T­¬ng D­¬ng (2 )")==1 then	--ÈÎÎñÖĞ
		Talk(1,"","Ng­¬i ®Õn <color=yellow>D· Tr­ l©m<color> ®¸nh b¹i <color=yellow>Quan sai<color> lÊy <color=yellow>3 Phong th­ mËt<color>")
	elseif CTask:CheckCanStart("Thêi Thiªn T­¬ng D­¬ng (2 )")==1 then	--½ÓÈÎÎñ
		StartTask002()
	elseif CTask:IsTaskFinish("Thêi Thiªn T­¬ng D­¬ng (1 )")==1 then	--ÈÎÎñºó
		Talk(1,"","§Õn <color=yellow>cÊp 25<color> h·y quay l¹i.")
	elseif CTask:CheckTask("Thêi Thiªn T­¬ng D­¬ng (1 )")==1 then	--Íê³ÉÈÎÎñ
		FinishTask001()
	elseif CTask:IsTaskStart("Thêi Thiªn T­¬ng D­¬ng (1 )")==1 then	--ÈÎÎñÖĞ
		Talk(1,"","<color=yellow>3 tÊm Hæ B×<color> vÉn ch­a ®ñ µ? H·y ®Õn NhŞ Long s¬n t×m thªm nhĞ!")
	elseif (CTask:CheckCanStart("Thêi Thiªn T­¬ng D­¬ng (1 )")==1) and (GetItemCount(2,0,18)>=1) and (GetItemCount(2,0,22)>=1) and (GetItemCount(2,0,23)>=1) then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Talk(1,"","Giang hå l¹i dËy sãng n÷a råi")
	end
end;


function StartTask001()
	local strMain = {
		"Xin hái cã ph¶i lµ Thêi Thiªn tiÒn bèi?",
		"Ta lµ Thiªn Tóc Minh, sao ai còng nhÇm lÉn vËy nhØ?",
		"T¹i h¹ cã mét vµi bøc th­ xin tiÒn bèi xem qua.",
		"ë ®©y kh«ng tiÖn, ng­¬i cã g× nãi mau ®i.",
		"T¹i h¹ bÊt tµi xin tiÒn bèi chØ gi¸o thªm.",
		"GÇn ®©y ë <color=yellow>NhŞ Long S¬n<color> xuÊt hiÖn kh«ng İt b¹ch hæ, ng­¬i gióp ta ®Õn ®ã giÕt chóng lÊy <color=yellow>3 tÊm hæ b×<color> nhĞ!",
		"§­îc! TaŞ h¹ ®ång ı ®Õn <color=yellow>NhŞ Long S¬n<color>t×m <color=yellow>3 tÊm hæ b× <color>.",
}
	CTask:TalkEx("",strMain)
	DelItem(2,0,18,1)
	DelItem(2,0,22,1)
	DelItem(2,0,23,1)
	CTask:StartTask("Thêi Thiªn T­¬ng D­¬ng (1 )");
	TaskTip("§Õn NhŞ Long s¬n t×m 3 tÊm Hæ B×")
end


function FinishTask001()
local strMain = {
	"TiÒn bèi, Hæ B× ®· t×m ®ñ råi!",
	"Tèt qu¸, ®Õn <color=yellow>cÊp 25<color> quay l¹i nhĞ!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Thêi Thiªn T­¬ng D­¬ng (1 )")
	CTask:PayAward("Thêi Thiªn T­¬ng D­¬ng (1 )")
	TaskTip("NhiÖm vô ®· hoµn thµnh, ®Õn cÊp 25 ®Õn gÆp Thêi Thiªn.")
end;


function StartTask002()
	local strMain = {
		"Ng­¬i ®Õn ®óng lóc l¾m, ta võa nhËn ®­îc tin cã mét sè <color=yellow>Quan sai<color> s¾p ®i qua <color=yellow>D· Tr­ l©m<color>, chóng cã mang theo mËt th­ cña TriÒu ®×nh. Ta muèn ng­¬i ®i giÕt chóng ®o¹t mËt th­, kh«ng biÕt ng­¬i cã d¸m kh«ng?",
		"ChuyÖn nµy…",
		"ViÖc nµy cã h¬i vÊt v¶ mét chót, nÕu ng­¬i kh«ng lµm ®­îc th× ®Ó ta nghÜ c¸ch kh¸c vËy.",
		"T¹i h¹ ®ång ı!",
		"Kh¸ l¾m, d¸m nghÜ d¸m lµm. Ng­¬i ®Õn <color=yellow>D· Tr­ l©m<color> ®¸nh b¹i <color=yellow>Quan sai<color> lÊy <color=yellow>3 mËt th­<color>.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Thêi Thiªn T­¬ng D­¬ng (2 )");
	TaskTip("§Õn D· Tr­ l©m ®¸nh b¹i Quan sai lÊy 3 mËt th­.")
end


function FinishTask002()
local strMain = {
	"TiÒn bèi, mËt th­ ®· lÊy ®­îc råi!",
	"Ng­¬i kh¸ l¾m, ta cã viÖc ph¶i lµm råi, ®Õn <color=yellow>cÊp 30<color> quay l¹i nhĞ!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Thêi Thiªn T­¬ng D­¬ng (2 )")
	CTask:PayAward("Thêi Thiªn T­¬ng D­¬ng (2 )")
	TaskTip("NhiÖm vô ®· hoµn thµnh, cÊp 30 ®Õn gÆp Thêi Thiªn.")
end;


function StartTask003()
	local strMain = {
		"Cßn nhí lÇn tr­íc ta kÓ cho ng­¬i nghe vÒ chuyÖn thŞ vÖ mang ®ao kh«ng?",
		"§­¬ng nhiªn lµ nhí råi, ng­êi nãi lÇn ®ã gÆp bän chóng ngay c¶ vËt phßng th©n <color=yellow>Kh«ng Kh«ng DiÖu Thñ<color> còng bŞ chóng c­íp mÊt.",
		"§óng vËy, viÖc nµy ta ®· ®iÒu tra kü vµ ph¸t hiÖn ra ®ã chİnh lµ V­¬ng Lu©n, ta còng ®· biÕt n¬i Èn n¸u cña h¾n nh­ng kh«ng tiÖn lé diÖn nªn phiÒn ®Õn ng­¬i.",
		"Kh«ng sao, cø tin ë v·n bèi.",
		"§­îc! Theo ta biÕt<color=yellow>V­¬ng Lu©n<color> hiÖn ë <color=yellow>D· Tr­ l©m<color>. ChØ cÇn ng­¬i lÊy l¹i <color=yellow>Kh«ng Kh«ng DiÖu Thñ<color> lµ ®­îc råi! Nh­ng thuéc h¹ cña h¾n còng rÊt lîi h¹i, ng­¬i nhí cÈn thËn.",
		"T¹i h¹ biÕt råi!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Thêi Thiªn T­¬ng D­¬ng (3 )");
	TaskTip("§Õn D· Tr­ l©m ®¸nh V­¬ng Lu©n ®o¹t Kh«ng Kh«ng DiÖu Thñ cho Thêi Thiªn.")
end


function FinishTask003()
local strMain = {
	"TiÒn bèi! Kh«ng Kh«ng DiÖu Thñ ®· lÊy ®­îc råi!",
	"Tèt l¾m! Thêi Thiªn ta kh«ng nh×n lÇm ng­êi. Xin ®a t¹!",
	"TiÒn bèi kh«ng cÇn kh¸ch s¸o.",
	"Ta biÕt ng­¬i ®ang th¾c m¾c v× sao TriÒu §×nh l¹i truy cøu ta, v× ta ®ang gi÷ mét bİ mËt ®¹i sù.",
	"Bİ mËt ®¹i sù?",
	"§óng vËy, bİ mËt nµy cã liªn quan ®Õn vËn mÖnh cña b¸ t¸nh <color=yellow>tÊm b¶n ®å S¬n Hµ X· T¾c<color> ®· xuÊt hiÖn råi.",
	"Cã ph¶i v× chuyÖn nµy mµ thiªn h¹ b¾t ®Çu dËy sãng?",
	"Hµnh tÈu giang hå ph¶i biÕt trõ giang diÖt ¸c, còng nh­ Thêi Thiªn ta thÊy chuyÖn ch­íng m¾t kh«ng nhóng tay vµo kh«ng ®­îc.",
	"TiÒn bèi hiÓu s©u biÕt réng, xin chØ gi¸o thªm.",
	"Ta cã mét huynh ®Ö <color=yellow>L©m Xung<color>, ë <color=yellow>NhŞ Long S¬n<color> chuyªn c­íp cña ng­êi giµu chia cho ng­êi nghÌo, thay trêi hµnh ®¹o. NÕu ng­¬i cã høng thó th× nªn ®Õn ®ã mét chuyÕn.",
	"§a t¹ tiÒn bèi!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Thêi Thiªn T­¬ng D­¬ng (3 )")
	CTask:PayAward("Thêi Thiªn T­¬ng D­¬ng (3 )")
	TaskTip("NhiÖm vô ®· hoµn thµnh, Cã thÓ ®Õn NhŞ Long s¬n g¾p L©m Xung.Thêi Thiªn.")
end;