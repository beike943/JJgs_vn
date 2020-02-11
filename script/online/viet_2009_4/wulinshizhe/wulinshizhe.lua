--=============================================
--create by baiyun 2009.4.15
--describe:Ô½ÄÏ°æ4ÔÂ»î¶¯ ½£ÏÀÇéÔµweb,ÎäÁÖÊ¹ÕßNPC
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

--ÈÎÎñ±äÁ¿
WL_TASK_GET_ITEM_DATE = 2146;					--»ñµÃÁ¬ĞÄµ¤µÄÈÕÆÚ
WL_TASK_ALREADY_GET_EXP = 2147;				--Ê¹ÓÃÁ¬ĞÄµ¤ÒÑ¾­»ñµÃµÄ¾­ÑéÊı
JXWEB_EXT = 1;

WL_ROLE_LEVEL_LIMIT = 50;							--»î¶¯µÈ¼¶ÏŞÖÆ
WL_GET_MAX_EXP = 60000000;						--Ê¹ÓÃÁ¬ĞÄµ¤×î¶à»ñµÃ60000000¾­Ñé
WL_GET_EACH_EXP = 3000000;						--Ê¹ÓÃÁ¬ĞÄµ¤Ã¿´Î»ñµÃµÄ¾­Ñé

JXWEB_EXPIRED_DATE = 09052924	

--------------------------------------
--main()
--Ö÷º¯Êı
--------------------------------------
function main()
	Say(
			"§Ó chµo mõng sù kiÖn <color=gold>Open Beta game Vâ L©m Web<color>, trong kho¶ng thêi gian tõ  <color=gold>ngµy 01-05-2009 ®Õn 24 giê ngµy 23-05-2009<color>, tÊt c¶ vâ l©m nh©n sÜ khi tham gia game Vâ L©m Web vµ ®¹t ®­îc c¸c thµnh tİch trong game, khi ®ã cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng, th«ng tin chi tiÕt t¹i trang chñ game Vâ L©m Web.",
			2,
			"T¹i h¹ ®Õn nhËn phÇn th­ëng Hç Trî T©n Thñ!/WLGetReward",
			"T¹i h¹ chØ ghĞ ngang!/WLDoNothing"
		)
end

--------------------------------------
--WLGetReward()
--ÁìÈ¡½±Àø
--------------------------------------
function WLGetReward()
	--ÅĞ¶Ï»î¶¯ÈÕÆÚ
	if tonumber(date("%Y%m%d%H")) <= 2009043024 or tonumber(date("%Y%m%d%H")) > 2009052324 then
		Talk(1, "", "Ho¹t ®éng nµy vÉn ch­a më.");
		return 0;
	end
	
	local nExtVal = GetExtPoint(JXWEB_EXT)	
	--ÅĞ¶ÏÀ©Õ¹µã£¬ÅĞ¶ÏÍæ¼ÒÊÇ·ñÓĞ×Ê¸ñÁìÈ¡
	if nExtVal ~= 1 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng", 1, "ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./WLDoNothing");
		return 0;
	end

	
	--ÅĞ¶Ï½ñÌìÊÇ·ñÒÑ¾­»ñµÃÁ¬ĞÄµ¤
	if GetTask(WL_TASK_GET_ITEM_DATE) >= tonumber(date("%y%m%d")) then 
		Talk(1, "", "H«m nay ng­¬i ®· nhËn Liªn T©m §an råi.");
		return 0;
	end
	
	-----ÅĞ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin lçi, ") == 0 then
		return 0
	end
	
	--¸ø½±ÀøÎïÆ·
	PayExtPoint(JXWEB_EXT,1)
	SetTask(WL_TASK_GET_ITEM_DATE, tonumber(date("%y%m%d")));
	
end

function WLDoNothing()
end