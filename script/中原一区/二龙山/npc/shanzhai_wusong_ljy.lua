Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Vâ Tßng_NhŞ Long s¬n")==1 then	--ÈÎÎñºó
		Say("NhŞ Long S¬n e lµ kh«ng thİch hîp, chi b»ng ng­¬i lªn <color=green>L­¬ng S¬n B¹c<color> thö nhĞ!", 0)
	elseif CTask:CheckTask("Vâ Tßng_NhŞ Long s¬n")==1 then	--Íê³ÉÈÎÎñ
		FinishTask001()
	elseif CTask:IsTaskStart("Vâ Tßng_NhŞ Long s¬n")==1 then	--ÈÎÎñÖĞ
		Say("§¸nh giÆc tr­íc tiªn ph¶i b¾t t­íng, chØ cÇn ng­¬i ®¸nh b¹i tªn thñ lÜnh <color=green>L­¬ng Trung Th­<color>, lÊy ®­îc <color=green>Trung Th­ LÖnh<color> th× kh«ng cÇn ®¸nh chóng còng tù b¹i råi.", 0)
	elseif CTask:CheckCanStart("Vâ Tßng_NhŞ Long s¬n")==1 then	--½ÓÈÎÎñ
		StartTask001()
	else	--ÈÎÎñÇ°
		Say("Quan phñ ngµy ngµy v¬ vĞt, L­¬ng s¬n ngµy cµng khã kh¨n, sèng sao ®©y?", 0)
	end
end


function StartTask001()
local strMain = {
		"Ng­¬i ®­îc Thêi Thiªn ®Æc c¸ch ®Õn? HiÖn nay d­íi ch©n nói Long S¬n cã mét ®¸m quan binh, h·y ®Õn ®ã tiªu trõ chóng.",
		"§ång ı",
		"§¸nh giÆc tr­íc tiªn ph¶i b¾t t­íng, chØ cÇn ng­¬i ®¸nh b¹i tªn thñ lÜnh <color=green>L­¬ng Trung Th­<color>, lÊy ®­îc <color=green>Trung Th­ LÖnh<color> th× kh«ng cÇn ®¸nh chóng còng tù b¹i råi.",
}
	CTask:TalkEx(strMain)	
	CTask:StartTask("Vâ Tßng_NhŞ Long s¬n");
	TaskTip("§¸nh b¹i L­¬ng Trung Th­ lÊy Trung Th­ LÖnh.")
end

function FinishTask001()
local strMain = {
	"TiÒn Bèi, ®· ®¸nh b¹i L­¬ng Trung Th­ lÊy ®­îc <color=green>Trung Th­ LÖnh<color>.",
	"§a t¹ ng­¬i!",
	"Ng­¬i kh«ng cÇn nãi ta còng ®· hiÓu råi, nÔ mÆt Thêi Thiªn ta kh«ng thÓ tõ chèi. Nh­ng hiÖn nay NhŞ Long s¬n t×nh h×nh ®ang khã kh¨n, quan sai ngµy ngµy v¬ vĞt chi b»ng ng­¬i h·y lªn <color=green>L­¬ng S¬n B¹c<color> cïng c¸c huynh ®Ö truy t×m <color=green>tÊm b¶n ®å S¬n Hµ X· T¾c<color>",
	"L­¬ng S¬n ®Şa h×nh réng lín, thñ lÜnh <color=green>Tèng Giang <color> ®¹i ca l¹i lµ ng­êi cã t×nh cã nghÜa. Ng­¬i lªn ®ã sÏ cã tiÒn ®å h¬n.",	
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("Vâ Tßng_NhŞ Long s¬n")
	CTask:PayAward("Vâ Tßng_NhŞ Long s¬n")	
	TaskTip("NhiÖm vô ®· hoµn thµnh, ng­¬i cã thÓ ®Õn L­¬ng S¬n B¹c t×m Tèng Giang nhËp héi.")
end

		
