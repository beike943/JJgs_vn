Include("\\script\\lib\\task_main.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_ShowDialog(128, bTag) then
		return
	end
	if CTask:IsTaskFinish("BiÖn Kinh §«ng tr­ëng th«n 1") then	--Íê³Éºó
		Say("Ng­êi giµ trong th«n b¶o hiÖn t­îng l¹ xuÊt hiÖn ¾t cã tai häa, kh«ng biÕt muèn ¸m chØ ®iÒm g×?", 0)
	elseif CTask:CheckTask("BiÖn Kinh §«ng tr­ëng th«n 1")==1 then		--Íê³É
		FinishTask001()
	elseif CTask:IsTaskStart("BiÖn Kinh §«ng tr­ëng th«n 1")==1 then	--ÈÎÎñÖĞ
		Say("Kh«ng ph¶i ng­¬i ®ång ı ®i trõ khö <color=yellow>Sãi x¸m<color> gÇn <color=yellow>ruéng d­a<color> sao?", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh §«ng tr­ëng th«n 1")==1 then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Say("Ng­êi giµ trong th«n b¶o hiÖn t­îng l¹ xuÊt hiÖn ¾t cã tai häa, kh«ng biÕt muèn ¸m chØ ®iÒm g×?", 0)
	end
end;


function StartTask001()
	local strMain = {
		"Tõ khi nh÷ng ng­êi ®¹i hiÖp nh­ ng­¬i xuÊt hiÖn qu¸i trong th«n ngµy mét nhiÒu. Ng­êi giµ b¶o s¾p cã t¹i häa Ëp ®Õn. Hy väng ng­¬i gióp ta tiªu diÖt ®¸m qu¸i vËt nµy.",
		"Kh«ng thµnh vÊn ®Ò!/yes001", 
		"Ta bËn råi!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("GÇn <color=yellow>Ruéng d­a<color> xuÊt hiÖn nhiÒu <color=yellow>TiÓu thæ lang<color> quËy ph¸. Ng­oi mau ®Õn ®ã trõ khö chóng vµ mang <color=yellow>5 c¸i r¨ng thæ lang<color> vÒ!", 0)
	CTask:StartTask("BiÖn Kinh §«ng tr­ëng th«n 1");
	TaskTip("Tiªu diÖt TiÓu thæ lang gÇn ruéng d­a vµ mang 5 c¸i R¨ng sãi x¸m vÒ!")
end;

function no001()
end;



function FinishTask001()
local strMain = {
	"B»ng h÷u qu¶ nhiªn th©n thñ bÊt phµm, míi ®©y ®· tiªu diÖt ®­îc thæ lang! Cã chót lßng thµnh cña ta, xin nhËn lÊy!",
	"Nhí n¨m x­a, Thêi Thiªn cßn ë trong th«n, mÊy tªn l­u manh kh«ng d¸m g©y sù nh­ng do anh Êy cã tËt xÊu hay lÊy trém gµ, vŞt cña d©n lµng, mäi ng­êi nghÜ anh cã c«ng nªn kh«ng truy cøu, tiÕc r»ng anh Êy ®· lÊy c¾p Ngù Th­ Bİnh mµ Hoµng th­îng ban tÆng cho Tr­¬ng Cö Nh©n con cña Tr­¬ng viªn ngo¹i v× vËy bŞ ®uæi khái th«n, hiÖn kh«ng biÕt ®i ®©u.",
	"GÇn ®©y cã ng­êi thÊy anh ta xuÊt hiÖn ë T­¬ng D­¬ng phñ, kh«ng biÕt thùc h­ thÕ nµo, ng­¬i thö ®Õn ®ã thö vËn may xem nh­ng hiÖn anh ta ®ang mang téi kh«ng dÔ lé diÖn nÕu ng­¬i cã 3 Phong th­ cña d©n lµng th× hay h¬n!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("BiÖn Kinh §«ng tr­ëng th«n 1")
	CTask:PayAward("BiÖn Kinh §«ng tr­ëng th«n 1")
end;

