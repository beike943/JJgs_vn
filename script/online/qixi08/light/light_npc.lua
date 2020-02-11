--µãµÆ»áÊ¥»ðÌ¨npc
--by vivi
--2008/07/21

Include("\\script\\online\\qixi08\\light\\light_head.lua");

function main()
	if GetMissionV(AOYUN_LIGHT_MISSION_STATE) ~= AOYUN_LIGHT_STATE_STARTED then
		Talk(1,"","Th¾p ®Ìn ch­a b¾t ®Çu, xin chuÈn bÞ.");
		return
	end
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	local sPlyLetter = GetMissionS(AOYUN_LIGHT_PLAYER_SEQ);
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	SetCurrentNpcSFX(nNpcIdx,909,2,0);
	for i=1,getn(tLightNpc) do
		if tLightNpc[i][2] == nNpcName then
			sPlyLetter = sPlyLetter..tLetter[i];
			SetMissionS(AOYUN_LIGHT_PLAYER_SEQ,sPlyLetter);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,GetName().." ®· th¾p §Ìn "..i..".");
			break;
		end
	end
	if strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) >= strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) then
		if GetMissionS(AOYUN_LIGHT_PLAYER_SEQ) == GetMissionS(AOYUN_LIGHT_DENG_SEQ) then
			local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
			aoyun_light_tongguan(nGuanType,1);
			if nGuanType < 5 then
				Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Chóc mõng b¹n v­ît qua ¶i thø "..nGuanType.." Héi th¾p ®Ìn. Sau 20 gi©y b¾t ®Çu ¶i kÕ tiÕp.");
				SetMissionS(AOYUN_LIGHT_PLAYER_SEQ,"");
				SetMissionV(AOYUN_LIGHT_GUAN_TYPE,GetMissionV(AOYUN_LIGHT_GUAN_TYPE)+1);
				aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_READY);
			else
				Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Chóc mõng b¹n v­ît qua ¶i thø "..nGuanType.." Héi th¾p ®Ìn. Sau 20 gi©y dän khu thi ®Êu.");
				aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);
			end
		else
			local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
			aoyun_light_tongguan(nGuanType,0);
			local sSeq = aoyun_light_right_seq(1);
			local sPlySeq = aoyun_light_right_seq(2);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"ThËt ®¸ng tiÕc b¹n vÉn ch­a v­ît qua ¶i nµy. Thø tù chÝnh x¸c ph¶i lµ: "..sSeq);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Thø tù th¾p ®Ìn cña ®éi b¹n lµ: "..sPlySeq);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"KÕt thóc th¾p ®Ìn, ®éi ngò sÏ chuyÓn ra ngoµi ¶i sau 20 gi©y.");
			aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);		
		end		
	end	
end

function aoyun_light_tongguan(nType,nSuc)
	local nTeamSize = GetTeamSize();
	local nOldPIdx = PlayerIndex;
	if nTeamSize == 0 or nTeamSize == 1 then
		if nSuc == 1 then
			if GetTask(TSK_AOYUN_LIGHT_GUAN) <= nType then 
				SetTask(TSK_AOYUN_LIGHT_GUAN,nType);
			end
			if nType == 5 then
				SetTask(TSK_AOYUN_LIGHT_NUM,GetTask(TSK_AOYUN_LIGHT_NUM)+1);
			end
		else
			if GetTask(TSK_AOYUN_LIGHT_NUM) < 10 then --Ê®´Îºó¾Í²»ÇåÁË
				SetTask(TSK_AOYUN_LIGHT_NUM,0);
			end
		end
	else	
		for i=1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if nSuc == 1 then
				if GetTask(TSK_AOYUN_LIGHT_GUAN) <= nType then 
					SetTask(TSK_AOYUN_LIGHT_GUAN,nType);
				end
				if nType == 5 then
					SetTask(TSK_AOYUN_LIGHT_NUM,GetTask(TSK_AOYUN_LIGHT_NUM)+1);
				end
			else
				if GetTask(TSK_AOYUN_LIGHT_NUM) < 10 then --Ê®´Îºó¾Í²»ÇåÁË
					SetTask(TSK_AOYUN_LIGHT_NUM,0);
				end
			end
		end
	end
	PlayerIndex = nOldPIdx;
end
