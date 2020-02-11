Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Tèng Giang_Thñy B¹c (5)")==1 then	--ÈÎÎñºó
		Say("Huynh ®Ö ta ®· lµ Th¸nh ¢n t­íng qu©n chuyªn phô tr¸ch truy b¾t téi ph¹m. Chóng ta hµnh tÈu giang hå cÇn ph¶i cÈn thËn kh«ng ®­îc lµm lo¹n ph¸p kû.", 0)
	elseif CTask:CheckTask("Tèng Giang_Thñy B¹c (5)")==1 then	--Íê³ÉÈÎÎñ
		FinishTask005()
	elseif CTask:IsTaskStart("Tèng Giang_Thñy B¹c (5)")==1 then	--ÈÎÎñÖĞ
		Say("Sao? VÉn ch­a gÆp ®­îc Hoµng Th­îng µ? Ng­¬i ®Õn BiÖn Kinh t×m Lı S­ S­ nghÜ c¸ch.", 0)
	elseif CTask:CheckTask("Tèng Giang_Thñy B¹c (4)")==1 then	--Íê³ÉÈÎÎñ
		FinishTask004()
	elseif CTask:IsTaskStart("Tèng Giang_Thñy B¹c (4)")==1 then	--ÈÎÎñÖĞ
		Say("§¸nh b¹i Cao CÇu ®o¹t cê LÖnh quan binh ¾t sÏ tù b¹i.", 0)
	elseif CTask:CheckTask("Tèng Giang_Thñy B¹c (3)")==1 then	--Íê³ÉÈÎÎñ
		FinishTask003()
	elseif CTask:IsTaskStart("Tèng Giang_Thñy B¹c (3)")==1 then	--ÈÎÎñÖĞ
		Say("C¸i Bang vµ L­¬ng S¬n kÕt t×nh giao h÷u, m«i hë r¨ng l¹nh.Ng­¬i ®Õn ®ã gÆp Long T¹i Thiªn bang chñ xem cã c¸ch nµo trî gióp kh«ng?", 0)
	elseif CTask:CheckCanStart("Tèng Giang_Thñy B¹c (3)")==1 then	--½ÓÈÎÎñ
		StartTask003()
	elseif CTask:IsTaskFinish("Tèng Giang_Thñy B¹c (2)")==1 then	--ÈÎÎñºó
		Say("§Õn cÊp <color=yellow>cÊp 35<color> quay l¹i t×m ta.", 0)
	elseif CTask:CheckTask("Tèng Giang_Thñy B¹c (2)")==1 then	--Íê³ÉÈÎÎñ
		FinishTask002()
	elseif CTask:IsTaskStart("Tèng Giang_Thñy B¹c (2)")==1 then	--ÈÎÎñÖĞ
		Say("GÇn ®©y cã mét tªn giÆc cá d¸m m¹o muéi tªn cña ta ®Ó lµm chuyÖn ®åi b¹i, ng­¬i ®i khö trõ tªn nµy lÊy tÊm bµi phï råi quay l¹i gÆp ta!", 0)
	elseif CTask:CheckTask("Tèng Giang_Thñy B¹c (1)")==1 then	--Íê³ÉÈÎÎñ
		FinishTask001()
	elseif CTask:IsTaskStart("Tèng Giang_Thñy B¹c (1)")==1 then	--ÈÎÎñÖĞ
		Say("§Õn D· Tr­ l©m lÊy ®Çu cña quan sai ®em vÒ ®©y míi cã thÓ gia nhËp.", 0)
	elseif CTask:CheckCanStart("Tèng Giang_Thñy B¹c (1)")==1 then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Say("Chóng ta tuy lµ vµo rõng lµm th¶o khÊu nh­ng lóc nµo còng kh«ng thÓ quªn trung hiÕu ®¹i nghÜa!", 0)
	end
end;


function StartTask001()
	local strMain = {
		"§­îc Vâ Tßng ë NhŞ Long s¬n chØ gi¸o ®Õn ®©y xin gÆp gia nhËp L­¬ng S¬n.",
		"Tõ l©u ®· nghe danh Vâ NhŞ Lang. NÕu lµ ng­¬i cña Vâ ®Ö ph¸i ®Õn th× ta còng kh«ng cÇn lÔ nghi r­êm rµ. Ng­¬i tr­íc tiªn h·y chøng minh b¶n lÜnh cña m×nh tr­íc khi gia nhËp.",
		"B»ng c¸ch nµo?",
		"Cã thÓ ®i lÊy ®Çu cña quan sai råi quay l¹i gÆp ta.",
		"H¶?",
		"Quèc cã quèc ph¸p, gia cã gia quy, L­¬ng S¬n còng kh«ng n»m ngo¹i lÖ. H¬n 100 anh hïng h¶o h¸n ë ®©y ®Òu nh­ vËy c¶. NÕu kh«ng cã g× chøng minh so cã thÓ tin ®­îc ng­¬i chø? H·y ®Õn D· Tr­ L©m lÊy ®­îc ®Çu cña quan sai míi cã thÓ gia nhËp.",
}
	CTask:TalkEx(strMain)
	CTask:StartTask("Tèng Giang_Thñy B¹c (1)");
	TaskTip("§Õn D· Tr­ l©m lÊy ®Çu quan sai")
end


function FinishTask001()
local strMain = {
	"Tèng ®¹i ca, ®· hoµn thµnh lÔ ra m¾t råi.",
	"Kh¸ l¾m, qua viÖc lµm võa råi ®· hiÓu ®­îc b¶n lÜnh cña ng­¬i. Tõ nay chóng ta lµ huynh ®Ö h¶o h¸n mét nhµ. Nh­ng L­¬ng S¬n chóng ta cã 10 ®iÒu lÖ, 20 luËt vµ 30 nguyªn t¾c cÇn ph¶i nhí. Tr­íc tiªn h·y häc thuéc khÈu hiÖu: Thay trêi hµnh ®¹o!",
	"Thay trêi hµnh ®¹o!",
	"GÇn ®©y cã mét tªn giÆc cá d¸m m¹o muéi tªn cña ta ®Ó lµm chuyÖn ®åi b¹i, ng­¬i ®i khö trõ tªn nµy lÊy tÊm bµi phï råi quay l¹i gÆp ta!",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("Tèng Giang_Thñy B¹c (1)")
	CTask:PayAward("Tèng Giang_Thñy B¹c (1)")
	CTask:StartTask("Tèng Giang_Thñy B¹c (2)");
	TaskTip("§i trõ tªn giÆc cá lÊy bµi phï vÒ cho Tèng Giang.")
end;


function FinishTask002()
local strMain = {
	"§¹i ca ®· lÊy ®­îc bµi phï.",
	"Tªn nµy ®¸ng ph¶i chÕt! Ng­¬i lµm kh¸ l¾m, ®©y lµ phÇn th­ëng. Sau nµy nhí quay l¹i ta cßn cã viÖc nhê ng­¬i.",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("Tèng Giang_Thñy B¹c (2)")
	CTask:PayAward("Tèng Giang_Thñy B¹c (2)")
	TaskTip("Hoµn thµnh nhiÖm vô, cÊp 30 ®Õn gÆp Tèng Giang.")
end;


function StartTask003()
	local strMain = {
		"Ng­¬i ®Õn ®óng lóc l¾m, ta võa nhËn ®­îc tin, triÒu ®×nh chuÈn bŞ binh m· tiªu diÖt L­¬ng S¬n. Ng­¬i cã ®èi s¸ch g× kh«ng?",
		"Tr­íc tiªn nªn tËn dông lùc l­îng cña L­¬ng S¬n sau ®ã míi nhê ®Õn sù viÖn trî bªn ngoµi.",
		"C¸i Bang vµ L­¬ng S¬n kÕt t×nh giao h÷u, m«i hë r¨ng l¹nh.Ng­¬i ®Õn ®ã gÆp Long T¹i Thiªn bang chñ xem cã c¸ch nµo trî gióp kh«ng?",
}
	CTask:TalkEx(strMain)
	CTask:StartTask("Tèng Giang_Thñy B¹c (3)");
	TaskTip("§Õn C¸i Bang nhê Long T¹i Thiªn bang chñ viÖn trî L­¬ng S¬n.")
end


function FinishTask003()
local strMain = {
	"§¹i ca, Long T¹i Thiªn sÏ ®­a ®Ö tö ®Õn trî gióp.",
	"C¸i Bang qu¶ lµ nghÜa khİ h¬n ng­êi, ®­îc sù trî gióp cña hä th× yªn t©m råi. Qu©n triÒu ®×nh ®· kĞp ®Õn ch©n nói, ng­¬i mau t×m thªm ®ång ®éi tiªu diÖt bän chóng.",
	"Ta ®i ngay!",
	"DÉn ®Çu ®¸m qu©n Êy lµ Cao CÇu, chØ cÇn ng­¬i ®¸nh b¹i h¾n ®o¹t ®­îc cê lÖnh lµ ®­îc råi!",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("Tèng Giang_Thñy B¹c (3)")
	CTask:PayAward("Tèng Giang_Thñy B¹c (3)")
	CTask:StartTask("Tèng Giang_Thñy B¹c (4)");	
	TaskTip("Phèi hîp víi ®ång ®éi ®¸nh b¹i Cao CÇu ®o¹t cê lÖnh.")
end;


function FinishTask004()
local strMain = {
	"§¹i ca, ®· ®¸nh b¹i Cao CÇu ®o¹t ®­îc cê lÖnh.",
	"Ng­¬i vÊt v¶ qu¸. L­¬ng S¬n chóng ta c­íp cña ng­êi giµu chia cho ng­êi nghÌo, ®õng quªn c©u khÈu hiÖu: Thay trêi hµnh ®¹o!",
	"HiÓu råi. Thay trêi hµnh ®¹o!Thay trêi hµnh ®¹o!",
	"ThÕ lùc cña L­¬ng S¬n bµnh tr­íng cµng lµm kinh ®éng ®Õn hoµng th­îng, nh­ vËy còng ®ñ råi. B©y giê ta giao cho ng­¬i nhiÖm vô ®Õn BiÖn Kinh gÆp Lı S­ S­, t×m c¸ch gÆp Hoµng th­îng. NÕu hoµng th­îng chiªu an th× chóng ta cã thÓ lµm ®¹i quan sÏ cã tiÒn tµi, mü n÷...NhiÖm vô nµy h¬i nguy hiÓm ng­¬i nhí ®õng ®Ó ng­êi thø 2 biÕt. Cßn g× kh«ng râ n÷a kh«ng?",
	"Cã thÓ kh«ng ®i ®­îc kh«ng?",
	"Kh«ng ®­îc, bøc th­ nµy ®­a cho Hoµng th­îng, ta ®Æc c¸ch göi ng­¬i 500 l­îng ®Ó mua y phôc míi. Ng­¬i mau ®i chãng vÒ, ®õng ®Ó mÊt mÆt L­¬ng S¬n.",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("Tèng Giang_Thñy B¹c (4)")
	CTask:PayAward("Tèng Giang_Thñy B¹c (4)")
	CTask:StartTask("Tèng Giang_Thñy B¹c (5)");	
	TaskTip("§Õn BiÖn Kinh t×m Lı S­ S­ t×m c¸ch tiÕp cËn Hoµng Th­îng.")
end;