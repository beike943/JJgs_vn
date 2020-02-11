Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnUse(nItemIndex)
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("C«ng cô nµy chØ dïng ®­îc trong ChiÕn tr­êng Th¶o cèc.");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("T¹m thêi kh«ng thÓ dïng c«ng cô nµy.");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--ÊÇ·ñÆïÂí
		Msg2Player("Trªn ngùa kh«ng thÓ nhÆt l­¬ng th¶o.");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("ÊÖÀïÎÕ×ÅÎäÆ÷£¬²É¼¯Á¸²Ý±äµÃÒì³£À§ÄÑ¡£");
--		return 0;
--	end;
	if nMapX < 1598 or nMapY < 3227 or nMapX > 1737 or nMapY > 3512 then	--Èç¹û×ø±êÐ¡ÓÚÕâÁ½¸öµÄ»°¾ÍÊÇ·Ç·¨Î»ÖÃ
		Msg2Player("Khu vùc nµy kh«ng cã l­¬ng th¶o");
		return 0;
	end;
	local nPosIndex = Get_ResIndex_ByPos(nMapX,nMapY);
	if nPosIndex < 1 or nPosIndex > 110 then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: hoe_item.lua trÞ vÞ trÝ ph¶n håi Get_ResIndex_ByPos b¸o lçi"..nPosIndex);
		Msg2Player("HÖ thèng b¸o lçi: B¹n kh«ng nhËn ®­îc tµi nguyªn nµo hÕt");
		return 0;
	end;
	local nGroup,nBit = 0,0;
	nGroup = floor(nPosIndex/32);
	nBit = mod((nPosIndex-1),32)+1;
	if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 0 then
		if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,1));
			Msg2Player("§ang thu thËp l­¬ng th¶o……......");
			CastState("state_fetter",1,5*18)
			ProgressSlot(5*18);	--5Ãë
			SetItemUseLapse(nItemIndex,5);	--ÀäÈ´Ê±¼ä£º5Ãë
		else
			Msg2Player("Kh«ng thÓ lµm ®éng t¸c nµy ë tr¹ng th¸i ngåi")
		end;
	else
		Msg2Player("Khu nµy ®· bÞ ®µo qua!");
	end;
	return 1;
end;

function OnProgressCallback()
	local nTime = GetTime();
	local n1MIN2TYPE = BT_GetData(PT_1MIN2TYPE);
	local n1MIN3TYPE = BT_GetData(PT_1MIN3TYPE);
	local n1MIN3TYPEDOUBLE = BT_GetData(PT_1MIN3TYPEDOUBLE);
	local n1MINDOUBLE = BT_GetData(PT_1MINDOUBLE);
	local n3MINDOUBLE = BT_GetData(PT_3MINDOUBLE);
	if nTime - n1MIN2TYPE <= 60 then
		Get_Resource(2);	--Ò»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇÖÐ¼¶Á¸²Ý
	elseif nTime - n1MIN3TYPE <= 60 then
		Get_Resource(3);	--Ò»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ¸ß¼¶Á¸²Ý
	elseif nTime - n1MIN3TYPEDOUBLE <= 60 then
		Get_Resource(3,2);	--Ò»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶¸ß¼¶Á¸²Ý
	elseif nTime - n1MINDOUBLE <= 60 then
		Get_Random_Resource(2);	--Ò»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶Á¸²Ý
	elseif nTime - n3MINDOUBLE <= 180 then
		Get_Random_Resource(2);	--Èý·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶Á¸²Ý
	else
		Get_Random_Resource();
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;