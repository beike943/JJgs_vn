--´ËÄË»¥¶¯¶¯×÷°ó¶¨Ö®½Å±¾¡£
--Èë¿Úº¯ÊýÊÇmain£¬ÊäÈë²ÎÊý£±Îª»¥¶¯¶¯×÷µÄË÷Òý£¬²ÎÊý£²Îª»¥¶¯¶¯×÷ÊÇ·ñ³É¹¦
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")					--´å³¤µÄ¹«¹²º¯Êý
Include("\\script\\task\\marriage\\map_att_head.lua")					--½á»é¶þÆÚÍ·ÎÄ¼þ
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\online\\newyear08\\newyear08_head.lua") --07Ê¥µ®°ÝÊ¦»î¶¯
Include("\\script\\lib\\lingshi_head.lua"); --ÁéÊ¯Í·ÎÄ¼þ
Include("\\script\\online\\spring2014\\sp_head.lua")

INTERACTIVE_SHARE_RIDE = 0		-- Ë«ÈË¹²Æï
INTERACTIVE_SHARE_HAND = 1		-- Ë«ÈËÐ¯ÊÖ
INTERACTIVE_SHARE_BACK = 2		-- GG±³MM
INTERACTIVE_SHARE_CHEST = 3		-- GG±§MM
INTERACTIVE_KISS = 4			-- Ç×ÎÇ
INTERACTIVE_COMFORT = 5			-- °²Î¿
INTERACTIVE_KOTOW = 6			-- °Ý
INTERACTIVE_HELP = 7			-- °ïÃ¦
INTERACTIVE_SORROW = 8			-- ±¯ÉË
INTERACTIVE_READY_GO = 9		-- ³ö·¢
INTERACTIVE_ACT_UP = 10			-- µ÷Æ¤
INTERACTIVE_CRAZY = 11			-- ·¢¿ñ
INTERACTIVE_KNEE_DOWN = 12		-- ¹òÏÂ
INTERACTIVE_SHY = 13			-- º¦Ðß
INTERACTIVE_BOW	= 14			-- ¾Ï¹ª
INTERACTIVE_CLAPS = 15			-- ÅÄÊÖ
INTERACTIVE_MARRIAGE = 16		-- Çó»é
INTERACTIVE_ANGRY = 17			-- ÉúÆø
INTERACTIVE_VICTORY = 18		-- Ê¤Àû
INTERACTIVE_COOL = 19			-- Ë£¿á
INTERACTIVE_LAY_DOWN = 20		-- ÌÉÏÂ
INTERACTIVE_DEFY = 21			-- ÌôÐÆ
INTERACTIVE_PUZZLED = 22		-- ÒÉ»ó
INTERACTIVE_FAINT = 23			-- ÔÎµ¹
INTERACTIVE_BYEBYE = 24 		-- ÕÐÊÖ
INTERACTIVE_CONFIDENCE = 25		-- ×ÔÐÅ
INTERACTIVE_GENTLE = 26			-- ×÷Ò¾
INTERACTIVE_SIT = 27			-- ×øÏÂ

--2007Äê´º½Ú»î¶¯TaskID¼ÇÂ¼
TaskID_spring2007_kotow_seq = 986
TaskID_spring2007_HASH_1st = 987
TaskID_spring2007_HASH_2nd = 988
TaskID_spring2007_HASH_3rd = 989
--2007ÇåÃ÷½Ú»î¶¯TaskID¼ÇÂ¼
tomb_sweep_2007_date_seq = 852
tomb_sweep_2007_times_count = 853
tomb_sweep_2007_goods_use_diff = 854
--2008ÇåÃ÷½Ú
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_times_count = 1851
tomb_sweep_2008_goods_use_diff = 1859

tomb_sweep_2007_start_goodsID = 675
--½á»é¶þÆÚÏà¹ØÈÎÎñID
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Tb_frag = {}
	Tb_frag[568] = "Gi¸p Méc d­¬ng"
	Tb_frag[569] = "Êt Méc ©m"
	Tb_frag[570] = "BÝnh háa d­¬ng"
	Tb_frag[571] = "§inh Háa ©m"
	--½á»é¶þÆÚ¹ÖÎïÊôÐÔ
	Monster_attr = {}
	Monster_attr[13]={2750,19}
	Monster_attr[14]={3850,23}
	Monster_attr[15]={4950,28}
	Monster_attr[16]={6050,34}
	Monster_attr[17]={7150,41}
	Monster_attr[18]={8250,48}
	Monster_attr[19]={9350,54}
	Monster_attr[20]={10450,58}
	Monster_attr[21]={11550,61}
	Monster_attr[22]={12650,65}
	Monster_attr[23]={13750,67}
	Monster_attr[24]={14850,71}
	Monster_attr[25]={15950,73}
	Monster_attr[26]={17050,76}
	Monster_attr[27]={18150,79}
	Monster_attr[28]={19250,83}
	Monster_attr[29]={21550,85}
	Monster_attr[30]={23050,98}
	Monster_attr[31]={24550,106}
	Monster_attr[32]={26050,112}
	Monster_attr[33]={27550,114}
	Monster_attr[34]={29050,118}
	Monster_attr[35]={30550,123}
	Monster_attr[36]={32050,127}
	Monster_attr[37]={33550,133}
	Monster_attr[38]={35050,140}
	Monster_attr[39]={36550,148}
	Monster_attr[40]={38050,155}
	Monster_attr[41]={40000,167}
	Monster_attr[42]={41950,175}
	Monster_attr[43]={43900,181}
	Monster_attr[44]={45850,187}
	Monster_attr[45]={47800,192}
	Monster_attr[46]={49750,200}
	Monster_attr[47]={51700,205}
	Monster_attr[48]={53650,213}
	Monster_attr[49]={55600,230}
	Monster_attr[50]={58400,245}
	Monster_attr[51]={61200,248}
	Monster_attr[52]={64000,260}
	Monster_attr[53]={66800,266}
	Monster_attr[54]={69600,272}
	Monster_attr[55]={72400,280}
	Monster_attr[56]={75200,288}
	Monster_attr[57]={78000,296}
	Monster_attr[58]={80800,304}
	Monster_attr[59]={83600,312}
	Monster_attr[60]={86400,320}
	Monster_attr[61]={89400,331}
	Monster_attr[62]={92400,339}
	Monster_attr[63]={95400,350}
	Monster_attr[64]={98400,359}
	Monster_attr[65]={101400,362}
	Monster_attr[66]={104400,379}
	Monster_attr[67]={107400,383}
	Monster_attr[68]={110400,391}
	Monster_attr[69]={113400,404}
	Monster_attr[70]={117750,412}
	Monster_attr[71]={117750,426}
	Monster_attr[72]={117750,449}
	Monster_attr[73]={117750,467}
	Monster_attr[74]={117750,492}
	Monster_attr[75]={117750,511}
	Monster_attr[76]={117750,526}
	Monster_attr[77]={117750,541}
	Monster_attr[78]={117750,557}
	Monster_attr[79]={117750,573}
	Monster_attr[80]={117750,588}
	Monster_attr[81]={117750,604}
	Monster_attr[82]={117750,619}
	Monster_attr[83]={117750,641}
	Monster_attr[84]={117750,656}
	Monster_attr[85]={117750,672}
	Monster_attr[86]={117750,687}
	Monster_attr[87]={117750,703}
	Monster_attr[88]={117750,724}
	Monster_attr[89]={117750,740}
	Monster_attr[90]={117750,755}
	Monster_attr[91]={117750,777}
	Monster_attr[92]={117750,792}
	Monster_attr[93]={117750,819}
	Monster_attr[94]={117750,824}
	Monster_attr[95]={117750,828}
	Monster_attr[96]={117750,832}
	Monster_attr[97]={117750,836}
	Monster_attr[98]={117750,840}
	Monster_attr[99]={117750,845}
	Tb_ma_monster = {
		{2,"Diªu LËp Thµnh","Gia ®inh cña TrÇn c«ng tö"},
		{4,"Diªu LËp Thµnh","Gia ®inh cña TrÇn c«ng tö"},
		{5,"A Vi",	"§¹o tÆc h¸o s¾c TrÇn c«ng tö"},	
	}
function main(nInteractiveIndex, bSuccess)
	--½á»é¶þÆÚÏà¹Ø£ºÈÎºÎÏà¹Ø¶¯×÷
	if bSuccess ~= 0 then
		ON_All()
	end
	if (nInteractiveIndex == INTERACTIVE_KOTOW) and (bSuccess ~= 0) then	--°Ý¶¯×÷
		ON_KOTOW()
	end
	if (nInteractiveIndex == INTERACTIVE_GENTLE) and (bSuccess ~= 0) then	--°Ý¶¯×÷
		ON_GENTLE()
	end
	if (nInteractiveIndex == INTERACTIVE_SHARE_HAND) and (bSuccess ~= 0) then
		ON_SHARE_RIDE_HAND()
	end
	if bSuccess ~= 0 then --¸úËæÓÐÀñ
		gen_sui_you_li(nInteractiveIndex);
	end
	if bSuccess ~= 0 and nInteractiveIndex == INTERACTIVE_GENTLE then
		sp_InteractiveToNpc();
	end
end
--==================================ËùÓÐ¶¯×÷=============================
function ON_All()
        local szMateName = GetMateName();
	--ÅÐ¶ÏÊÇ·ñ½á»é
	if szMateName == nil or szMateName == "" then
		return
	end
        local nPlayerIndexSave = PlayerIndex;--±£´æÔ­PlayerIndex
        local nMateIndex = 0;                --ÅäÅ¼Ë÷Òý
        local nTeamSize = GetTeamSize();
        for i = 1 , nTeamSize do
	    PlayerIndex = GetTeamMember(i)
	    if szMateName == GetName() then
	        nMateIndex = PlayerIndex;
		PlayerIndex = nPlayerIndexSave;
		break
	    end
        end
        if nMateIndex == 0 then
            Talk(1, "", "<color=green>Chó ý<color>: Xin x¸c nhËn b¹n vµ ý trung nh©n ®· tæ ®éi!");
            return
        end
	--¼ì²âÊÇ·ñ½ÓÈÎÎñ
	local map_id_save = GetTask(task_map_id_TaskID)
	local att_seq = GetTask(task_att_seq_TaskID)
	if map_id_save == 0 or map_id_save == nil then
		return
	end
	if att_seq == 0 or att_seq == nil then
		return
	end
	--¼ì²âµ±Ç°µØÍ¼ÊÇ·ñÎªÈÎÎñµØÍ¼
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= map_id_save then
		return
	end
	--¿Õ¼äºÍ¸ºÖØÅÐ¶Ï
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--µØÍ¼ÏàÍ¬µÄÊ±ºò
	local frag_ID = {0,568,569,570,571,583,592}
	if Tb_task_reel_att[map_id_save][att_seq][1] == nil or Tb_task_reel_att[map_id_save][att_seq][2] == nil then
		return
	end
	if Tb_task_reel_att[map_id_save][att_seq][1] == floor(att_X/8) and Tb_task_reel_att[map_id_save][att_seq][2] == floor(att_Y/16) then
		local moster_frag_ran = random(1,10)
		if moster_frag_ran == 9 then		--Ë¢¹Ö
			--Ëæ»ú¹ÖÎïµÈ¼¶
			local monster_level = random(1,5)
			for i = 1 ,getn(Tb_ma_monster) do
				if monster_level <= Tb_ma_monster[i][1] then
					monster_level = i
					break
				end
			end
			--´´½¨¹ÖÎï
			local Player_level = GetLevel()
				--ÅÐ¶Ï¸ÄµÈ¼¶µÄ¹ÖÎïÊÇ·ñ´æÔÚ
			if Monster_attr[Player_level] == nil then
				return
			end
				--¿ªÊ¼´´½¨
			local monster_index = CreateNpc(Tb_ma_monster[monster_level][2],Tb_ma_monster[monster_level][3],GetWorldPos())
				--ÅÐ¶Ï¹ÖÎïË÷ÒýÊÇ·ñÕý³£
			if monster_index == 0 or monster_index == nil then
				return
			end
				--ÉèÖÃ¹ÖÎïÊôÐÔºÍËÀÍö½Å±¾Â·¾¶
				SetNpcScript(monster_index,"\\script\\task\\marriage\\ma_monster_death.lua")
				SetUnitCurStates(monster_index,0,Player_level)
				SetUnitCurStates(monster_index,1,Monster_attr[Player_level][1])
				SetTask(map_id_save,0)
				SetTask(task_att_seq_TaskID,0)		
                                SetTask(2286, monster_index);--¼ÇÂ¼Ò»ÏÂ´´½¨³öÀ´µÄNPCË÷Òý
                                PlayerIndex = nMateIndex;
                                SetTask(2286, monster_index);--¼ÇÂ¼Ò»ÏÂ´´½¨³öÀ´µÄNPCË÷Òý
                                PlayerIndex = nPlayerIndexSave;
                else		--Ö±½Ó¸øËéÆ¬

			local ran_num = random(1,100)
			for i = 2, getn(Tb_task_reel_att[map_ID].map_att) do
				if ran_num <= Tb_task_reel_att[map_ID].map_att[i] then
					if AddItem(2,1,frag_ID[i],1) == 1 then
						Talk(1,"","<color=green>ChØ dÉn<color>: Chóc mõng b¹n nhËn ®­îc 1 <color=yellow>"..Tb_frag[frag_ID[i]].."<color>, nhÊp chuét ph¶i ®Ó sö dông vËt phÈm!")
						SetTask(map_id_save,0)
						SetTask(task_att_seq_TaskID,0)
						break
					end
				end
			end
		end
	else
		Talk(1,"","B¹n kh«ng ®Õn ®­îc ®Þa ®iÓm chØ ®Þnh v× kh«ng cã vËt phÈm cÇn thiÕt")
		return
	end
end
--====================================°Ý=================================
function ON_KOTOW()
	if master_prentice() == 1 then			-- Èç¹ûÊ¦Í½ÓÐÏìÓ¦£¬ÏÈ¸ÉÍêÊ¦Í½µÄÊÂÇéÔÙËµ
		return
	end
	kotow_tomb_sweep_2008()					--2007ÇåÃ÷½Ú
	marriage_check_kotow()				--½á»é
	newyear08_bai()               --2007Ê¥µ®»î¶¯
end
--*******************************2007ÄêÇåÃ÷½Ú****************************
function kotow_tomb_sweep_2007()
	local Plyaer_level = GetLevel()
	if Plyaer_level < 11 then								--µÈ¼¶ÅÐ¶Ï
		return
	end
	if tomb_sweep_2007_date_chk() ~= 1 then				--ÔÚ»î¶¯ÆÚ¼äÓÐÐ§
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--ÔÚ°Ý¼ÀµØÍ¼ÓÐÐ§
		return
	end
	if att_X < 1660 then								--×ø±êÏÞÖÆ
		Talk(1,""," cóng tÕ ®¹i hiÖp, tiÕp tôc n÷a xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2007_date_seq)		--»ñµÃ×î½üµÄ°Ý¼ÀÈÕÆÚ
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","LÇn ®Çu cóng tÕ lµ thµnh t©m nhÊt.")
		return
	end
	--¿ÉÒÔ½øÐÐ°Ý¼À
	local prize_diff = GetTask(tomb_sweep_2007_goods_use_diff)
	local exp_times = 1
	local Player_level = GetLevel()
	local exp_num = floor(Player_level * Player_level * Player_level *Player_level / 50)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end
			--Ôö¼ÓÈÎÎñ¾íÖá
	if Plyaer_level < 40 then
		Say("Ng­¬i muèn nhËn lo¹i nhiÖm vô nµo: §¬n gi¶n, h¬i khã?",
		3,
		"§¬n gi¶n/#task_teel_add(2)",
		"Khã/#task_teel_add(5)",
		"Sao còng ®­îc/#task_teel_add(9)"
		)
	elseif Plyaer_level >= 40 and Plyaer_level <= 60 then
		Say("Ng­¬i muèn nhËn lo¹i nhiÖm vô nµo: §¬n gi¶n, h¬i khã?",
		2,
		"§¬n gi¶n/#task_teel_add(5)",
		"Sao còng ®­îc/#task_teel_add(9)"
		)
	else
		task_teel_add(9)
	end
	if random(1,100) <= (10 + prize_diff) then						--½±ÀøB
		exp_times = 10
	end
	local kotow_times_save = GetTask(tomb_sweep_2007_times_count)
	if kotow_times_save == 7 then				--½±ÀøD
		exp_times = exp_times + 15
		--ModifyReputation(100,0)
	end
	--Ôö¼Ó¾­Ñé
	exp_num = exp_num * exp_times
	ModifyExp(exp_num)
	if exp_times == 1 then
		Msg2Player("NhËn ®­îc khÝch lÖ cña ®¹i hiÖp ta c¶m thÊy vâ c«ng tiÕn bé v­ît bËc, kinh nghiÖm giang hå ®· t¨ng "..exp_num.." ®iÓm!")
	else
		Msg2Player("Mét c¬n giã l¹nh thæi qua, b¹n c¶m thÊy g©n cèt toµn th©n rÊt dÔ chÞu, kinh nghiÖm giang hå ®· t¨ng lªn"..exp_num.." ®iÓm!")
	end
	--½±Àø¸øÓÚ½áÊøºóµÄ´¦Àí
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2007_times_count,1)
	else
		SetTask(tomb_sweep_2007_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2007_date_seq,zgc_pub_day_turn(1))
	--¼ÀÆ·Ò»´ÎÓÐÐ§
	SetTask(tomb_sweep_2007_goods_use_diff,0)
end
--*******************************2008ÇåÃ÷½Ú******************************
function kotow_tomb_sweep_2008()
	local Player_level = GetLevel()
	--µÈ¼¶ºÍ¸ºÖØ¼ì²â
	if Player_level < 11 then								--µÈ¼¶ÅÐ¶Ï
		return
	elseif Player_level ~= 99 then
		if Zgc_pub_goods_add_chk(1,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	if is_qingming_opened() ~= 1 then				--ÔÚ»î¶¯ÆÚ¼äÓÐÐ§
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--ÔÚ°Ý¼ÀµØÍ¼ÓÐÐ§
		return
	end
	if att_X < 1660 then								--×ø±êÏÞÖÆ
		Talk(1,""," cóng tÕ ®¹i hiÖp, tiÕp tôc n÷a xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2008_date_seq)		--»ñµÃ×î½üµÄ°Ý¼ÀÈÕÆÚ
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","LÇn ®Çu cóng tÕ lµ thµnh t©m nhÊt.")
		return
	end
	--¿ÉÒÔ½øÐÐ°Ý¼À
	local prize_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	local exp_times = 1
	local exp_num = floor(1500000*(Player_level * Player_level  / (80*80)))--Ãâ·ÑÇø
	--Msg2Player("»ñÈ¡Íæ¼ÒµÈ¼¶:"..Player_level)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end

	if GetLevel() ~= 99 then
		--ÊÕ·ÑÇøÎª½¡¿µ¾­Ñé×ª¾­Ñé200w*µÈ¼¶Ë¥¼õ,Ãâ·ÑÇøÎª¾­Ñé150w*µÈ¼¶Ë¥¼õ
	  --99¼¶ÎªÌìÊ±×¢½â2±¾£¬1-7¼¶ÁéÊ¯*1·ÅÈë¾ÛÁé¶¦
		if random(1,100) <= (10 + prize_diff) then						--½±ÀøB
			exp_times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--½±ÀøD
			exp_times = 10 --²»»áÔÚÁìÈ¡½±ÀøDµÄÊ±ºòÁìÈ¡½±ÀøA£¬ËùÒÔ±¶Êý²»ÀÛ¼Ó
			Msg2Player("B¹n ®· b¸i tÕ liªn tôc 8 ngµy nªn nhËn ®­îc nhiÒu ®iÓm kinh nghiÖm h¬n.")
			--ModifyReputation(100,0)--Ôö¼ÓÉùÍû
		end
		--Ôö¼Ó¾­Ñé
		--Ãâ·ÑÇøÔö¼Ó¾­Ñé
		exp_num = exp_num * exp_times
		
		ModifyExp(exp_num)
		
		if exp_times == 1 then
			Msg2Player("NhËn ®­îc khÝch lÖ cña ®¹i hiÖp ta c¶m thÊy vâ c«ng tiÕn bé v­ît bËc, kinh nghiÖm giang hå ®· t¨ng "..exp_num.." ®iÓm!")
		else
			Msg2Player("Mét c¬n giã l¹nh thæi qua, b¹n c¶m thÊy g©n cèt toµn th©n rÊt dÔ chÞu, kinh nghiÖm giang hå ®· t¨ng lªn"..exp_num.." ®iÓm!")
		end
	else--Íæ¼Ò¶ÎÎ»99
		local n99times = 1 --99¼¶Íæ¼Ò½±Àø±¶Êý
		if random(1,100) <= (10 + prize_diff) then						--½±ÀøB
			n99times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--½±ÀøD
			n99times = 10 --²»»áÔÚÁìÈ¡½±ÀøDµÄÊ±ºòÁìÈ¡½±ÀøA£¬ËùÒÔ±¶Êý²»ÀÛ¼Ó
			Msg2Player("B¹n ®· b¸i tÕ liªn tôc 8 ngµy nªn nhËn ®­îc nhiÒu phÇn th­ëng h¬n.")
			--ModifyReputation(100,0)--Ôö¼ÓÉùÍû
		end
		local nTemp = 1
		for nTemp = 1,n99times,1 do
			if Zgc_pub_goods_add_chk(2,2) == 1 then
				AddItem(2,1,3210,2)--»ñµÃÌìÊ±×¢½â2±¾
			else
				Msg2Player("Søc lùc cña b¹n kh«ng ®ñ, phÇn th­ëng b¸i tÕ lÇn nµy bÞ hñy, h·y dän dÑp hµnh trang råi quay l¹i b¸i tÕ!")
				return
			end --if zgc_pub_gooods_add_chk
			--======»ñµÃËæ»ú1-7ÁéÊ¯1¿Å,»ñµÃ7¼¶ÁéÊ¯µÄ¼¸ÂÊµ÷Õûµ½1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4¼¶ÁéÊ¯
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6¼¶ÁéÊ¯
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B¹n nhËn ®­îc "..lvLingShi.."(cÊp) Linh Th¹ch!")
		end--for
		nTemp = n99times*2
		Msg2Player("B¹n nhËn ®­îc Thiªn Thêi Chó Gi¶i "..nTemp.." quyÓn!")
	end--if_lv_99
	--Ôö¼ÓÈÎÎñ¾íÖá
	if Player_level < 80 then
		Say("Ng­¬i muèn nhËn lo¹i nhiÖm vô nµo: §¬n gi¶n, h¬i khã?",
		3,
		"§¬n gi¶n/#task_teel_add(random(1,3))",
		"Khã/#task_teel_add(random(1,6))",
		"Sao còng ®­îc/#task_teel_add(random(1,10))"
		)
	elseif Player_level >= 80 and Player_level <= 90 then
		Say("Ng­¬i muèn nhËn lo¹i nhiÖm vô nµo: §¬n gi¶n, h¬i khã?",
		2,
		"§¬n gi¶n/#task_teel_add(random(1,6))",
		"Sao còng ®­îc/#task_teel_add(random(1,10))"
		)
	else
		task_teel_add(random(1,10))
	end
	--½±Àø¸øÓÚ½áÊøºóµÄ´¦Àí
	local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2008_times_count,1)
	else
		SetTask(tomb_sweep_2008_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2008_date_seq,zgc_pub_day_turn(1))
	--¼ÀÆ·Ò»´ÎÓÐÐ§
	SetTask(tomb_sweep_2008_goods_use_diff,0)
end
--*******************************Ôö¼ÓÈÎÎñ¾íÖá****************************
function task_teel_add(add_diff)
	--Msg2Player(add_diff);--µ÷ÊÔÓÃ£¬ÒÑÉ¾£¡
	local add_flag = AddItem(2,0,add_diff+tomb_sweep_2007_start_goodsID-1,1)--2008MoxianÐÞ¸Ä,ÓÉµ÷ÓÃÕßÐ´Ëæ»úÊý
	if add_flag == 1 then
		Msg2Player("Trong lóc cóng b¸i b¹n v« t×nh ph¸t hiÖn mét tê giÊy!")
	end
	--¼ÀÆ·Ò»´ÎÓÐÐ§
	SetTask(tomb_sweep_2007_goods_use_diff,0)
	return
end
--===================================×÷Ò¾================================
function ON_GENTLE()

end
function ON_SHARE_RIDE_HAND()	--Ç£ÊÖ

end

function gen_sui_you_li(nInteractiveIndex)
	if Get_3festival_State() ~= 1 then
		return
	end
	local nMapId,nPlayerX,nPlayerY = GetWorldPos();
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	if GetNpcName(nNpcIdx) ~= tNewCehua[1][2] and GetNpcName(nNpcIdx) ~= tNewCehua[2][2] and GetNpcName(nNpcIdx) ~= tNewCehua[3][2] then
		return
	end
	if GetLevel() < 30 then
		Talk(1,"","§¼ng cÊp thÊp qu¸, tiÕp tôc phiªu b¹t giang hå ®Õn cÊp <color=yellow>30<color> h·y ®Õn.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
	local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
	local nDate = tonumber(date("%Y%m%d"));
	if nDistance > 20 then
		Talk(1,"","Xa qu¸, l¹i gÇn n÷a ®i");
	else
		local nActionIdx = GetMapTaskTemp(nMapId,2);
		if nActionIdx ~= nInteractiveIndex then
			Talk(1,"","§éng t¸c hiÖn t¹i lµ <color=yellow>"..tActionIndex[nActionIdx-4][1].."<color>, lµm sai råi.");
			return
		else
			if GetTask(TASK_GENSUI_DATE) ~= nDate then
				SetTask(TASK_GENSUI_TOTAL,0);
			end 
			if GetTask(TASK_GENSUI_TOTAL) == 10 then
				Talk(1,"","H«m nay b¹n l·nh phÇn th­ëng nhiÒu råi, ®Ó ®iÓm cho b»ng h÷u kh¸c, ngµy mai h·y tíi");
				return
			else
				local nRand = random(1,10000);
				for i=2,getn(tGensuiAward) do
					if nRand <= tGensuiAward[i][6] then
						AddItem(tGensuiAward[i][2],tGensuiAward[i][3],tGensuiAward[i][4],tGensuiAward[i][5],1);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tGensuiAward[i][1]..tGensuiAward[i][5].."c¸i");
						break;
					end
				end
				local nExp = floor(GetLevel()^3/80^3*tGensuiAward[1][1]);
				ModifyExp(nExp);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
				SetTask(TASK_GENSUI_TOTAL,GetTask(TASK_GENSUI_TOTAL)+1);
				SetTask(TASK_GENSUI_DATE,nDate);
			end
		end
	end					
end

--=============================07Ê¥µ®°ÝÊ¦»î¶¯===========================
function newyear08_bai()
	if get_chrims_state() ~= 1 then
		return
	end
 	local nLv = GetLevel();
 	local nTeamNum = GetTeamSize();
 	local nDate = tonumber(date("%Y%m%d"));
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	local nOldIdx = PlayerIndex;
 	if GetTask(TASK_BAI_DATE) >= nDate then
 		Talk(1,"","Mçi ngµy mét ng­êi chØ ®­îc l·nh gi¶i th­ëng 1 lÇn.");
 		return
 	end
 	if nLv < 11 then --Ãâ·ÑÇøÎÞ´ËÏÞÖÆ
 		Talk(1,"","<color=green>Th«ng b¸o: <color>: B¹n cßn ph¶i phiªu b¹t giang hå thªm Ýt l©u n÷a!");
 		return
 	end
 	if nTeamNum ~= 2 or nTeamNum == 0 then
		Talk(1,"","N¨m míi b¸i s­ häc vâ. Ho¹t ®éng b¸i s­ ph¶i cã 2 ng­êi tæ ®éi míi ®­îc l·nh th­ëng.");
		return
	end
	if GetTeamMember(1) == PlayerIndex then
		PlayerIndex = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		PlayerIndex = GetTeamMember(1);
	else
		WriteLog("Ho¹t ®éng b¸i s­ Gi¸ng Sinh 2007: link thµnh viªn ®éi ngò cã lçi.");
		return
	end
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLvTwo = GetLevel();
	local sName = GetName();
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --¾àÀëÅÐ¶Ï
		PlayerIndex = nOldIdx;
		Talk(1,"","N¨m míi b¸i s­ häc vâ. Kho¶ng c¸ch hµmh lÔ xa qu¸, l¹i gÇn lµm l¹i ®i");
		return
	end
	if nLv == 99 and nLvTwo == 99 then --99¼¶Íæ¼ÒÖ»ÄÜ°Ý99¼¶ ¸øÓè¾­Ñé
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%¸ÅÂÊ·­±¶
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b¹n hµnh lÔ víi "..sName.." xong, cïng thÇy ®µm ®¹o, lµm t¨ng thªm kinh nghiÖm giang hå"..nExp.."®iÓm.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Thµnh t©m thµnh ý"..sName.."thØnh gi¸o vâ häc, vâ c«ng tiÕn bé, nhËn ®­îc 2 phÇn th­ëng, ®¹t ®­îc"..nExp.." ®iÓm kinh nghiÖm giang hå")	;
		end
		return 0;
	end			
	if nLv >= nLvTwo then --·Ç99¼¶Èë¿Ú
		PlayerIndex = nOldIdx;
		Talk(1,"","N¨m míi b¸i s­ häc vâ. Ng­êi cÊp thÊp b¸i ng­êi cÊp cao h¬n míi cã th­ëng.");			
	else
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%¸ÅÂÊ·­±¶
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b¹n hµnh lÔ víi "..sName.." xong, cïng thÇy ®µm ®¹o, lµm t¨ng thªm kinh nghiÖm giang hå"..nExp.."®iÓm.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Thµnh t©m thµnh ý"..sName.."thØnh gi¸o vâ häc, vâ c«ng tiÕn bé, nhËn ®­îc 2 phÇn th­ëng, ®¹t ®­îc"..nExp.." ®iÓm kinh nghiÖm giang hå")	;
		end
	end
	PlayerIndex = nOldIdx;
end

function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--Èç¹û»¹Î´µ½Ê±¼ä
	elseif nDate > 20080412 then
		return 0;--ÒÑ¹ýÆÚ
	else
		return 1;
	end;
end;
