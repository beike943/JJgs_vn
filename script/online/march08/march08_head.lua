--Ô½ÄÏ°æÈıÔÂ»î¶¯Í·ÎÄ¼ş
--by vivi
--2008/03/05

--ÈÎÎñ±äÁ¿
TASK_MARCH_FENHONG = 2412; --¼ÇÂ¼Íæ¼ÒÊ¹ÓÃ·ÛºìÃµ¹åµÄ´ÎÊı
TASK_MARCH_HONG = 2413;    --¼ÇÂ¼Íæ¼ÒÊ¹ÓÃºìÃµ¹åµÄ´ÎÊı
TASK_MARCH_AWARD_TIME = 2414; --¼ÇÂ¼Íæ¼Ò¶Ò»»Ãµ¹åµÄÈÕÆÚ
TASK_MARCH_AWARD_NUM = 2415; --¼ÇÂ¼Íæ¼Ò¶Ò»»Ãµ¹åµÄ´ÎÊı

MARCH_TRIGGER_ID = 111;        --´¥·¢Æ÷id
KILL_MARCH_ID = 704;         --×Ô¶¨ÒåID

FENHONG_EXP = 5000;            --·ÛºìÃµ¹å¾­Ñé
HONG_EXP = 15000;							 --ºìÃµ¹å¾­Ñé
TOTAL_EXP = 10000000;          --Ã¿ÃûÍæ¼Ò»ñµÃµÄ×î¸ß¾­Ñé£¨Ãµ¹å£©

--Ãµ¹åµôÂäºÍ¶Ò»»ÈÕÆÚ
function get_march_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20080325 then
		return 1;
	else
		return 0;
	end
end

function check_rose_date()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20080331 then
		return 1;
	else
		return 0;
	end	
end

--Àñ¹Ù¶Ô»°Èë¿Ú
function talk_march()
	Say("<color=green>LÔ Quan<color>: Thu thËp hoa hång nép cho LÔ Quan nhËn phÇn th­ëng. Dïng 7 hoa hång phÊn + 3 hoa hång ®á + 1 lé thñy nhËn ®­îc 100.000 ®iÓm kinh nghiÖm, mçi ngµy mçi nh©n vËt chØ cã thÓ ®æi 1 lÇn. LÇn thø t­, lÇn thø t¸m ng­êi ch¬i sÏ nhËn thªm 1 b×nh Bång Lai Tiªn Thñy. Chó ı,  nh©n vËt cÊp 40 trë lªn míi cã thÓ tham gia ho¹t ®éng nµy, B¹n ®ång ı ®æi kh«ng?",
		2,
		"õ, ta muèn ®æi./confirm_march_change",
		"T¹m thêi, kh«ng muèn ®æi./nothing")
end

function confirm_march_change()
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d"));
	
	if nLv <= 40 then
		Talk(1,"","<color=green>LÔ Quan<color>: Xin lçi, ng­êi ch¬i cÊp 40 trë lªn míi cã thÓ tham gia ho¹t ®éng nµy.");
		return
	end
	if GetTask(TASK_MARCH_AWARD_TIME) >= nDate then
		Talk(1,"","<color=green>LÔ Quan<color>: Mçi ngµy mçi nh©n vËt chØ cã thÓ ®æi 1 lÇn.");
		return
	end
	if GetItemCount(2,0,1164) < 7 or GetItemCount(2,0,1162) < 3 or GetItemCount(2,0,351) < 1 then
		Talk(1,"","<color=green>LÔ Quan<color>: Muèn ®æi cÇn 7 hoa hång phÊn + 3 hoa hång ®á + 1 lé thñy, d­êng nh­ vÉn ch­a ®ñ?");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,0,1164,7) == 1 and DelItem(2,0,1162,3) == 1 and DelItem(2,0,351,1) == 1 then
		SetTask(TASK_MARCH_AWARD_TIME,nDate);
		SetTask(TASK_MARCH_AWARD_NUM,GetTask(TASK_MARCH_AWARD_NUM)+1);
		ModifyExp(100000);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm.");
		if GetTask(TASK_MARCH_AWARD_NUM) == 4 or GetTask(TASK_MARCH_AWARD_NUM) == 8 then
			AddItem(2,1,1012,1);
		end
	end
end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end