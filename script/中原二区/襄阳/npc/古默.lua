
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈÎÎñÏµÍ³ÈËÎïÎÄ¼ş
-- Edited by peres
-- 2005/05/30 PM 17:14

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");

function main()

	local strMain_001 = {
		"BÖnh t×nh cña phô th©n gÇn ®©y l¹i t¸i ph¸t, b»ng h÷u cã thÓ gióp ta t×m mét İt th¶o d­îc kh«ng?",
		"§ång ı/task_yes_01",
		"Ta cã viÖc råi./no"
	};
	
	local strMain_002 = {
		"§a t¹ ng­¬i ®· gióp phô th©n ta t×m th¶o d­îc, nh­ng thêi thÕ lo¹n l¹c, gia c¶nh l¹i khã kh¨n…Ta ch¼ng biÕt ph¶i lµm sao n÷a…",
		"Ta cã thÓ gióp ng­¬i t×m mét c«ng viÖc./task_yes_02",
		"Ta cã viÖc råi./no"
	};
	
	local strMain_003 = {
		"ThËt tèt qu¸, ng­¬i ®· nhiÒu lÇn ra tay gióp ®ì, ¬n nµy ghi lßng t¹c d¹. Sau nµy cã viÖc g× cÇn ®Õn tiÓu nh©n nµy xin cø h¹ cè.",
		"nh­ng còng kú l¹, bän giÆc cá ®ã c­íp b×nh sø nµy ®Ó lµm g× chø?",
		"C¸i g×? Ch¶ ph¶i lÇn nµy ng­¬i ®· dÑp ®­îc mÊy tªn giÆc cá ®ã råi sao?",
		"Th× ®óng lµ nh­ vËy nh­ng ®Ó xem chóng cßn dë trß g× n÷a kh«ng?",
		"Ta kh«ng biÕt nhiÒu vÒ bän chóng nh­ng trong thµnh cã <color=yellow>Tr­¬ng ¶nh<color> h¾n cã biÕt bän nµy, ng­¬i ®Õn ®ã hái xem...",
		"Ng­¬i nªn bá ı ®Şnh khuyªn ¢n C«ng ®i."
	};
	
	if CTask:IsTaskFinish("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng") then
		CTask:TalkEx("task_yes_03",strMain_003);
		return
	end;
	
	if CTask:IsTaskFinish("NhiÖm vô 2 Hµn tæng qu¶n_T­¬ng D­¬ng") then
		Say("",0);
		CTask:FinishTask("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng");
		CTask:PayAward("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng");
		return
	end;
	
	if CTask:IsTaskFinish("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng") then
		if CTask:CheckCanStart("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng")==1 then
			CTask:SayEx(strMain_002);
			return
		end;
	end;
	
	if CTask:IsTaskStart("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng")==1 then
		Say("Ng­¬i gióp t×m 3 lo¹i th¶o d­îc <color=yellow>C¸t c¸nh<color>, <color=yellow>Hoµng liªn<color>, <color=yellow>X¹ h­¬ng<color> vÒ ch­a?",
			2,
			"§­îc/task_check",
			"VÉn ch­a /no");
		return
	end;
	
	if CTask:CheckCanStart("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng")==1 then
		CTask:SayEx(strMain_001);
		return
	end;
	
	main_default();

end;


-- ½ÓÊÜÁË¹ÅÄ¬Ñ°Ò©µÄÈÎÎñ
function task_yes_01()
	Say("§a t¹ ng­¬i, ®¬n thuèc nµy cÇn <color=yellow>C¸t c¸nh<color>, <color=yellow>Hoµng liªn<color>, <color=yellow>X¹ h­¬ng<color>.",0);
	CTask:StartTask("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng");
end;

-- ½ÓÊÜÁË°ïÖú¹ÅÄ¬ÕÒ¹¤×÷µÄÈÎÎñ
function task_yes_02()
	Say("<color=yellow>Hµn tæng qu¶n<color> ë T­ M· th¸i thó hiÖn ®ang tuyÓn Gia ®inh, ta vèn kh«ng nhµ kh«ng cöa ng­¬i cã thÓ hái th¨m gióp ta kh«ng? NÕu ®­îc nhËn vµo th× nöa ®êi sau kh«ng ph¶i lo nghÜ",0);
	CTask:StartTask("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng");
end;

-- ½ÓÊÜÁËÈ¥ÕÒÕÅÓ°µÄÈÎÎñ
function task_yes_03()
	CTask:FinishTask("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng");
	CTask:PayAward("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng");
	CTask:StartTask("T×m Tr­¬ng ¶nh_T­¬ng D­¬ng");
end;

-- ¼ì²âÈÎÎñ¹ÅÄ¬Ñ°Ò©µÄÈÎÎñÊÇ·ñÍê³É
function task_check()

if CTask:CheckTask("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng")==1 then
	Say("ThËt ®a t¹, ta ph¶i s¾c thuèc cho cha ®©y.",0);
	CTask:FinishTask("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng");
	CTask:PayAward("NhiÖm vô 1 Cæ MÆc_T­¬ng D­¬ng");
	return
else
	Say("Ng­¬i vÉn ch­a t×m ®­îc 3 lo¹i th¶o d­îc Êy µ? Hay lµm r¬i däc ®­êng råi?",0);
	return
end;

end;


-- Ê²Ã´ÈÎÎñÒ²Ã»ÓĞµÄÄ¬ÈÏ×´Ì¬
function main_default()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","T¹i sao c¸c ng­êi c¶ ngµy cø ®i ®i l¹i l¹i ? Cßn ta l¹i ph¶i b¾t c¸ kiÕm tiÒn chø?")
	elseif i == 2 then  
		Talk(1,"","Tõ T­¬ng D­¬ng ®i vÒ phİa t©y lµ Vâ §ang ph¸i, may ra ë ®ã cã thÓ trŞ liÖu ®­îc bÖnh t×nh cña phô th©n.")
	else
		Talk(1,"","Hµn tæng qu¶n ®ång ı nhËn ta lµm gia ®inh, hy väng tõ ®©y ta kh«ng cßn vÊt v¶ n÷a.")
	end
end;

function no()

end;