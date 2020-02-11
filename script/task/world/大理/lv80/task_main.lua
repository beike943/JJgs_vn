-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí80ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/13 PM 20:39

--´ó»ïÈ¥¿´¡¶½ğ¸Õ¡·È¥ÁË£¬¶À×ÔÒ»ÈË¼Ó°àing¡­¡­ 

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--´ò°Ü¶Î³Ğ¶÷ºóÓë¶ş»Ê×Ó¶Ô»°
function task_000_00()
	
local strTalk = {
	"§oµn Thõa ¢n ®· bŞ ®¸nh b¹i råi, lÏ nµo ng­¬i l¹i nèi gi¸o cho giÆc?",
	"{NhŞ Hoµng Tö} c­íp ng«i, l¹i cÊu kÕt víi {Xi Háa gi¸o} ph¶n lo¹n, ®©y ®­îc xem lµ viÖc chİnh nghÜa sao?",
	"C¸i g× lµ cÊu kÕt víi Xi Háa gi¸o? C¸i g× lµ ph¶n lo¹n? Ng­¬i ch¶ hiÓu g× chØ nãi bõa th«i.",
	"Ch¶ ph¶i ng­¬i ®· tranh ng«i cña {Tam Hoµng Tö} sao? {Tam Hoµng Tö} lªn ng«i lµ do ı cña {Tiªn ®Õ}, ng­¬i nªn tõ bá ı ®Şnh nµy ®i.",
	"C¸i g× lµ th¸nh ı cña tiªn ®Õ? Phô hoµng chØ muèn ta lµ ng­êi kÕ vŞ, ®¸ng tiÕc lµ L·o tam ®· lµm gi¶ th¸nh chØ, ®Çy ta ®Õn §¹i Lı cßn vu khèng ta cÊu kÕt víi Xi Háa gi¸o ®Ó t¸c lo¹n. Ng­êi kÕ vŞ chİnh lµ ta!",
	"Hõm, {Tam Hoµng Tö} d¸m gi¶ th¸nh chØ µ?",
	"ChiÕu th­ thËt cña Tiªn Hoµng ®ang ë trong tay ta, nh­ng ®¸ng tiÕc lµ kh«ng cã c¬ héi ®Ó chøng minh mµ th«i.",
	"VËy t¹i h¹ cã thÓ gióp ®iÖn h¹ ®em {chiÕu th­} nµy ®Õn {§æng Quèc S­}, «ng Êy cã thÓ chøng minh thËt gi¶.",
	"§æng Quèc S­ tuy ®· ph¸i binh ®Õn chiªu mé ta, nh­ng còng cÇn chøng minh ®©y ®İch thËt lµ bót tİch cña Hoµng th­îng, ng­¬i ®em ®Õn ®ã gióp ta.",
	"T¹i h¹ sÏ ®em th­ nµy ®Õn cho {§æng Quèc S­} x¸c minh, cã g× sÏ th«ng b¸o ngay cho §iÖn h¹.",
	"Ng­¬i ®i mau ®i, nhí b¶o träng!",
	}
	TalkEx("",strTalk);
	AddItem(2,0,381,1);--µÃµ½¶ş»Ê×ÓµÄĞÅÎï
	TaskTip("§em chiÕu th­ ®Õn cho §æng Quèc S­.");
	Msg2Player("§em chiÕu th­ ®Õn cho §æng Quèc S­.");
	SetTask(TASK_DL_LV80_ID,3);
	GivePlayerAward("Level_76","xn_step_1");
	GivePlayerExp(SkeyDali,"duanchengen")
	return

end;