Include("\\script\\online_activites\\201409\\huadeng.lua")

function main()
	hd_DailyReset();
	if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Box) > 6 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("Mçi ngµy, mçi ng­êi nhËn ®­îc tèi ®a %d lÇn phÇn th­ëng", 6), 0);
		return 0;
	end
	local nTime = GetTime();
	if nTime - HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Limit) < 600 then
		local nLast = 600 - nTime + HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Limit);
		Say(format("<color=green>%s:<color>", "Thó C­ìi Nhá")..format("Cßn %d phót %d gi©y cã thÓ nhÊp vµo r­¬ng tiÕp theo", floor(nLast / 60), mod(nLast, 60)), 0);
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= "Thó C­ìi Nhá" then
		return 0;
	end
	gf_Modify("Exp", 5000000);
	gf_AddItemEx2({2,1,30721,1}, "B¶o R­¬ng Thó C­ng", "Ho¹t ®éng 09/2014", "Héi §Ìn Hoa Trung Thu", 0, 1);
	SetNpcLifeTime(GetTargetNpc(), 0);
	HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Limit, nTime);
	HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Box, HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Box) + 1)
end