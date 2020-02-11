Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 4")==1 then	--ÈÎÎñºó
		Say("Ca ca muéi th­êng nãi: §¹o lı ë ®êi quan träng lµ lı lÏ kh«ng ph¶i ë vò lùc. Tuy mäi ng­êi kh«ng hiÓu nh­ng rÊt kh©m phôc ca ca.", 0)
	elseif CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 3")==1 then	--Íê³ÉÈÎÎñ
		FinishTask004()
	elseif CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 1")==1 then	--ÈÎÎñÖĞ
		Say("Ch­a cã tin tøc <color=yellow>Hµ Th¹c Cö<color> ca ca µ? Ch¾c ch¾n ®ang ë chç <color=yellow>NhŞ Hçn<color> c·i lı!", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh §«ng Th­ sinh 1")==1 then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Say("Ca ca muéi th­êng nãi: §¹o lı ë ®êi quan träng lµ lı lÏ kh«ng ph¶i ë vò lùc. Tuy mäi ng­êi kh«ng hiÓu nh­ng rÊt kh©m phôc ca ca.", 0)
	end
end;


function StartTask001()
	local strMain = {
		"<color=yellow>NhŞ Hçn<color> th­êng tô tËp mÊy tªn L­u manh quÊy nhiÔu l­¬ng d©n. Ca ca <color=yellow>Hµ Th¹c Cö<color> ®Õn c·i lı giê vÉn ch­a vÒ. Ta rÊt lo l¾ng. Gióp ta ®Õn ®ã xem thö ®­îc kh«ng?",
		"Kh«ng thµnh vÊn ®Ò!/yes001", 
		"Ta bËn råi!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("<color=yellow>NhŞ Hçn<color> ë gÇn mÊy c¨n nhµ <color=yellow>phİa d­íi<color>, phiÒn b»ng h÷u ®Õn ®ã xem thö!", 0)
	CTask:StartTask("BiÖn Kinh §«ng Th­ sinh 1");
	CTask:FinishTask("BiÖn Kinh §«ng Th­ sinh 1")
	TaskTip("§Õn nhµ d©n t×m NhŞ Hçn hái tin tøc Hµ Th¹c Cö.")
end;

function no001()
end;



function FinishTask004()
local strMain = {
	"Xin ®a t¹! Cã chót lÔ vËt xin nhËn cho!",
	"Nhí n¨m x­a, Thêi Thiªn cßn ë trong th«n, mÊy tªn L­u manh kh«ng d¸m g©y sù. Nh­ng do anh Êy cã tËt xÊu hay lÊy trém gµ, vŞt cña d©n lµng, mäi ng­êi nghÜ anh cã c«ng nªn kh«ng truy cøu, tiÕc r»ng anh Êy ®· lÊy c¾p Ngù Th­ Bİnh mµ Hoµng th­îng ban tÆng cho Tr­¬ng Cö Nh©n con cña Tr­¬ng viªn ngo¹i, v× vËy bŞ ®uæi khái th«n, hiÖn kh«ng biÕt ®i ®©u.",
	"GÇn ®©y cã ng­êi thÊy anh ta xuÊt hiÖn ë T­¬ng D­¬ng phñ, kh«ng biÕt thùc h­ thÕ nµo, ng­¬i thö ®Õn ®ã thö vËn may xem nh­ng hiÖn anh ta ®ang mang téi kh«ng dÔ lé diÖn. NÕu ng­¬i cã <color=yellow>3 Phong th­ cña d©n lµng<color> th× hay h¬n!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("BiÖn Kinh §«ng Th­ sinh 4");
	CTask:FinishTask("BiÖn Kinh §«ng Th­ sinh 4")
	CTask:PayAward("BiÖn Kinh §«ng Th­ sinh 4")
end;

