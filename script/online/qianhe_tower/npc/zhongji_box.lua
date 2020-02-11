Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(107,108,QHT_ZHONGJI_BOX_TIME);
end

function zhongji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thiªn TÇm B¶o R­¬ng cÊp trung" then
		return 0;
	end
	if GetItemCount(2, 1, 30435) < 6 or GetCash() < 1000 then
		Talk(1,"",format("Më b¶o r­¬ng cÇn tiªu hao %d M¶nh Hæ Phï vµ %d tiÒn vµng,tiÒn vµng trªn ng­êi kh«ng ®ñ th× kh«ng thÓ më", 6, 1));
		return 0;
	end
	if DelItem(2, 1, 30435, 6) ~= 1 or Pay(1000) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_two(npcIndex);
	AddRuntimeStat(22, 3, 0, 1);
end