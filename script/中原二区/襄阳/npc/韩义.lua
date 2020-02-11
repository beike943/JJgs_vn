
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈÎÎñÏµÍ³ÈËÎïÎÄ¼ş
-- Edited by peres
-- 2005/05/31 PM 15:17

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");

function main()

local strMain_001 = {
	"Xin hái, ng­êi lµ Hµn tæng qu¶n?",
	"§óng vËy! VŞ "..CTask:GetSexName().."Cã viÖc g× kh«ng?",
	"Nghe nãi Hµn phñ cã chiªu mé thªm gia ®inh?",
	"§õng nh¾c ®Õn chuyÖn nµy, ng­¬i còng biÕt thêi thÕ lo¹n l¹c triÒu ®×nh ®ang c¾t bít bæng léc. Ta ®ang muèn gi¶m n« gia ®©y, lµm g× cã chuyÖn tuyÓn thªm chø?",
	"Nãi vËy mét chót ngo¹i lÖ còng kh«ng cã sao?",
	"Th¸i Thó ®ang cã t©m sù, nÕu ng­¬i gióp ®­îc «ng Êy may ra cßn c¬ héi.",
	"Ta nhÊt ®Şnh sÏ lµm ®­îc.",
	"Th¸i Thó mua mét cç <color=yellow>Thanh Hoa Tõ Khİ<color> vËn chuyÓn vÒ gÇn ®Õn <color=yellow>T­¬ng D­¬ng<color> th× bŞ bän Thæ PhØ ë Phôc Ng­u S¬n c­íp ®i, còng v× chuyÖn nµy mµ mÊt ¨n mÊt ngñ.",
	"<color=yellow>Thanh Hoa Tõ Khİ<color> µ? Ta lËp tøc ®Õn <color=yellow>T­¬ng D­¬ng<color> ®em vÒ ngay!"
}
	-- ÄÃµ½ÁË´ÉÆ÷Ö®ºó
	if CTask:IsTaskStart("NhiÖm vô 2 Hµn tæng qu¶n_T­¬ng D­¬ng") then
		Say("Ha ha, qu¶ lµ cã b¶n lÜnh! Kh«ng ngê bän chóng còng bŞ ng­¬i h¹ gôc. B»ng h÷u ng­¬i nhÊt ®Şnh sÏ nhËn vµo phñ lµm viÖc.",0);
		CTask:FinishTask("NhiÖm vô 2 Hµn tæng qu¶n_T­¬ng D­¬ng");
		CTask:PayAward("NhiÖm vô 2 Hµn tæng qu¶n_T­¬ng D­¬ng");
		return
	end;

	if CTask:IsTaskStart("NhiÖm vô 2 Cæ MÆc_T­¬ng D­¬ng") and not CTask:IsTaskStart("NhiÖm vô 1 Hµn tæng qu¶n_T­¬ng D­¬ng") then
		CTask:TalkEx("task_001", strMain_001);
		return
	end;

	main_default();

end;

-- ¿ªÊ¼º«×Ü¹ÜµÄÈÎÎñ
function task_001()
	CTask:StartTask("NhiÖm vô 1 Hµn tæng qu¶n_T­¬ng D­¬ng");
	return
end;

function main_default()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","Kh«ng biÕt lÇn nµy lµ phóc hay häa ®©y…!")
	elseif i == 2 then  
		Talk(1,"","LÇn nµy tô häp ë Yªn Vò L©u nhÊt ®Şnh sÏ cã nhiÒu ng­êi ®Õn tham gia, ph¶i ®Ò phßng míi ®­îc.")
	else
		Talk(1,"","Kh«ng biÕt Thiªn Thiªn d¹o nµy thÕ nµo, mÊy n¨m råi mÑ con hä kh«ng ®­îc gÆp nhau.")
	end
end
