--=============================================
--create by baiyun 2009.8.27
--describe:Ô½ÄÏ°æ9ÔÂ·İÖĞÇï»î¶¯×ß¾üµÆÁı½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_functions.lua");
--pk×´Ì¬¶ÔÕÕ±í
t_pk_states = {
	[0] = {0, 0, "Tr¹ng th¸i luyÖn c«ng"},
	[1] = {1, 0, "D¹ng chiÕn ®Êu 1"},
	[2] = {1, 1, "D¹ng chiÕn ®Êu 2"},
	[3] = {1, 2, "D¹ng chiÕn ®Êu 3"},
	[4] = {2, 0, "§å s¸t"},
};

function main()
	local nNpcIndex = GetTargetNpc()
	local nAwardFlag = GetUnitCurStates(nNpcIndex, 4);--ÊÇ·ñÒÑ¾­ÓĞµÚÒ»¸öÍæ¼Òµã»÷»ñµÃ½±Àø
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	
	local nState1 = get_flag_bit(nActiveFlag, 1);--ÒÔÏÂËÄÖÖ×´Ì¬Íæ¼Òµã»÷µÄÅĞ¶Ï¼ÇÂ¼
	local nState2 = get_flag_bit(nActiveFlag, 2);
	local nState3 = get_flag_bit(nActiveFlag, 3);
	local nState4 = get_flag_bit(nActiveFlag, 4);
	local nPkFlag1, nPkFlag2 = GetPKFlag();	--È¡µÃÁ½¸öÖµ±íÊ¾µÄPK×´Ì¬
	local nPkFlag = get_pk_flag(nPkFlag1, nPkFlag2);
	
	
	if nActiveFlag == 1111 then
		Talk(1, "", "Nghe ®ån <color=yellow>Hoµng Kim LÖnh Bµi<color> cña <color=green>Hoµng Kim Th­¬ng Nh©n<color> - BiÖn Kinh (171/178) cã thÓ gióp nh©n sÜ vâ l©m cÊp tèc th¨ng ®Õn cÊp 73, ®¹t 3000 ®iÓm danh väng. Ngoµi ra, trªn con hµnh tr×nh b«n tÈu, nh©n sÜ cßn ®­îc hç trî thªm nhiÒu lo¹i trang bŞ, vò khİ cÊp cao khi së h÷u ®­îc Hoµng Kim LÖnh Bµi nµy. Chi tiÕt xin tham kh¶o thªm t¹i trang chñ <color=red>http://volam2.zing.vn<color>");
		if nAwardFlag == 0 then
--			ModifyExp(500000);
--			Talk(1, "", "Thu ®­îc phÇn th­ëng may m¾n 500000 kinh nghiÖm");
--			Msg2Player("Thu ®­îc phÇn th­ëng may m¾n 500000 kinh nghiÖm");
			AddUnitStates(nNpcIndex, 4, 1);
		end
		return 0;
	end
	
	if active_denglong(nNpcIndex, nPkFlag) == 0 then
		return 0;
	end
	
end

function get_pk_flag(nPkFlag1, nPkFlag2)
	for i = 0, getn(t_pk_states) do
		if t_pk_states[i][1] == nPkFlag1 and t_pk_states[i][2] == nPkFlag2 then
			return i;
		end
	end
	return 0;
end

function active_denglong(nNpcIndex, nPkFlag)
	local nMapId = SubWorldIdx2ID(SubWorld);
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	local nResult = 1;
	local szMsg;
	if nPkFlag == 0 then
		Talk(1, "", "D¹ng PK cña ®¹i hiÖp lµ <color=red>"..t_pk_states[nPkFlag][3].."<color> kh«ng thÓ kİch ho¹t Lß N­íng");
		return 0;
	else
		if get_flag_bit(nActiveFlag, nPkFlag) == 0 then
			AddUnitStates(nNpcIndex, 5, set_flag_bit(nActiveFlag, nPkFlag, 1) - nActiveFlag);
		end
		local szPkMsg = "<enter>";
		
		for i = 1, 4 do
			if get_flag_bit(GetUnitCurStates(nNpcIndex, 5), i) == 0 then
				szPkMsg = szPkMsg ..t_pk_states[i][3].."<enter>";
				nResult = 0;
			end
		end
		
		szMsg = "D¹ng PK cña ®¹i hiÖp lµ <color=red>"..t_pk_states[nPkFlag][3].."<color>, hiÖn t¹i cÇn kİch ho¹t Lß N­íng cÇn:"..szPkMsg.."Ng­êi ch¬i cã d¹ng PK míi cã thÓ kİch ho¹t Lß N­íng";
	end
	if GetUnitCurStates(nNpcIndex, 5) ~= 1111 then
		Talk(1, "", szMsg);
	else
		local nTimeStart = GetUnitCurStates(nNpcIndex, 6);
		local nMissionTime = 55 - floor((GetTime() - nTimeStart) / 60);--¼ÆËãmissionÓ¦¸Ã¿ªÆô³ÖĞøµÄÊ±¼ä
		if nMissionTime >= 5 then--Èç¹ûÊ±¼äĞ¡ÓÚ5·ÖÖÓ£¬Ôò²»¿ªÆômissionÁË£¬ÒòÎªË¢ÅÖÍÃ×ÓÖÁÉÙÒª5·ÖÖÓµÄÊ±¼ä
			local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);

			SetGlbValue(1014, nNpcIndex);
			SetGlbValue(1015, nMapId);
			SetGlbValue(1016, nMapX);
			SetGlbValue(1017, nMapY);
			SetGlbValue(1018, nMissionTime);
			
			OpenMission(MISSION_ID, nMapId);
			Talk(1, "", "Lß N­íng ®· kİch ho¹t thµnh c«ng! Xin h·y ®îi thá ngäc bĞo ó xuÊt hiÖn!");
		end
	end
	return nResult;
end

function get_flag_bit(nFlag, nBit)--È¡µÃµÚ1£¬2£¬3£¬4ÆäÖĞÒ»Î»
	if nBit == 1 then
		return mod(nFlag, 10);
	elseif nBit == 2 then
		return floor(mod(nFlag, 100) / 10);
	elseif nBit == 3 then
		return floor(mod(nFlag, 1000) / 100);
	else
		return floor(nFlag / 1000);
	end
end

function set_flag_bit(nFlag, nBit, nValue)--ÉèÖÃµÚ1,2,3,4ÆäÖĞÒ»Î»
	if nBit == 1 then
		return nFlag - get_flag_bit(nFlag, nBit) + nValue;
	elseif nBit == 2 then
		return nFlag - get_flag_bit(nFlag, nBit) * 10 + nValue * 10;
	elseif nBit == 3 then
		return nFlag - get_flag_bit(nFlag, nBit) * 100 + nValue * 100;
	else
		return nFlag - get_flag_bit(nFlag, nBit) * 1000 + nValue * 1000;
	end
end