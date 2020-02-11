--2012Äê4ÔÂ¹²Á¦»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201203_KuiZheng_tbMain = "T¹i h¹ muèn kİch ho¹t ®éng Chung Søc/func_main"

VET_201203_KuiZheng_tbSay = {
	"§ång ®¹o muèn kİch ho¹t lo¹i nµo?<color=green>tæ ®éi tèi thiÓu cã 2 thµnh viªn vµ nhiÒu nhÊt lµ cã 5 thµnh viªn; sè l­îng hÖ ph¸i cµng nhiÒu gi¶i th­ëng cµng tèt<color>",
	"T¹i h¹ muèn kİch ho¹t ho¹t ®éng Chung Søc (miÔn phİ)/activate_gongli",
	"T¹i h¹ muèn kİch ho¹t ho¹t ®éng Chung Søc (tiªu hao 50 xu/ng­êi)/activate_gongli_ib",
	"T¹i h¹ muèn kİch ho¹t nhËn th­ëng tèi ®a ho¹t ®éng Chung Søc ngµy h«m nay/activate_daily_final",
	"Kh«ng cÇn ®©u/do_nothing",
}

VET_201203_GongLi_TaskGroup = TaskManager:Create(5,2)
VET_201203_GongLi_TaskGroup.DaySeq = 1
VET_201203_GongLi_TaskGroup.Times1 = 2
VET_201203_GongLi_TaskGroup.Times2 = 3
VET_201203_GongLi_TaskGroup.Tag = 4

VET_201203_EXP_Award_Free = {
	[2] = "1000000",
	[3] = "1050000",
	[4] = "1100000",
	[5] = "1250000",
};
VET_201203_EXP_Award_IB = {
	[2] = "6250000",
	[3] = "6500000",
	[4] = "6750000",
	[5] = "7000000",
};
VET_201203_COIN_FINAL_AWARD  = {
    {3, 3434, 304000, 1},
    {3, 1400, 308000, 1},
    {3, 1200, 354000, 1},
    {3, 1200, 358000, 1},
    {3, 1000, 404000, 1},
    {3, 1000, 408000, 1},
    {3, 616, 464600, 1},
    {3, 150, 1000500, 1},
};


function func_main()
	gf_Say(VET_201203_KuiZheng_tbSay)
end

function activate_gongli()
	--¶Ó³¤
	if GetName() ~= GetCaptainName() then
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t ho¹t ®éng");
		return 0;
	end
	--¶ÓÔ±×ÔÉíÌõ¼ş
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(2,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia","Thµnh viªn<color=green>"..sName.."<color>kh«ng ®ñ ®iÒu kiÖn");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--¶ÓÎéÈËÊı
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","Tæ ®éi tèi thiÓu <color=green>2<color> ng­êi, nhiÒu nhÊt <color=green>5<color> ng­êi míi ®­îc kİch ho¹t ho¹t ®éng Chung Søc")
		return 0;
	end
	--Ìì´Î
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÊÇ·ñÃâ·ÑÁì¹ı
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) >= 1 then
			Talk(1,"","Mçi ngµy nhËn phÇn th­ëng ho¹t ®éng Chung Søc miÔn phİ tèi ®a 1 lÇn");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Thµnh viªn<color=green>"..sName.."<color>sè lÇn nhËn th­ëng ho¹t ®éng Chung Søc miÔn phİ qu¸ 1 lÇn");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÖÁÉÙÁ½ÖÖÁ÷ÅÉ
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ®éi tèi thiÓu ph¶i cã 2 hÖ ph¸i kh¸c nhau míi cã thÓ nhËn th­ëng");
		return 0;
	end
	local nExp = tonumber(VET_201203_EXP_Award_Free[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_gongli_ib()
	--¶Ó³¤
	if GetName() ~= GetCaptainName() then
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t ho¹t ®éng");
		return 0;
	end
	--¶ÓÔ±×ÔÉíÌõ¼ş
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		local sName = GetName();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia","Thµnh viªn<color=green>"..sName.."<color>kh«ng ®ñ ®iÒu kiÖn");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--¶ÓÎéÈËÊı
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","Tæ ®éi tèi thiÓu <color=green>2<color> ng­êi, nhiÒu nhÊt <color=green>5<color> ng­êi míi ®­îc kİch ho¹t ho¹t ®éng Chung Søc")
		return 0;
	end
	--Ìì´Î
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÊÇ·ñÁì¹ı4´ÎÁË
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) >= 4 then
			Talk(1,"","Mçi ngÇy nhËn phÇn th­ëng ho¹t ®éng Chung Søc thu phİ tèi ®a lµ 4 lÇn");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Thµnh viªn<color=green>"..sName.."<color> sè lÇn nhËn th­ëng ho¹t ®éng Chung Søc  qu¸ 4 lÇn");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÖÁÉÙ2ÖÖÁ÷ÅÉ
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ®éi tèi thiÓu ph¶i cã 2 hÖ ph¸i kh¸c nhau míi cã thÓ nhËn th­ëng");
		return 0;
	end	
	--xuÊıÁ¿ÅĞ¶Ï
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30230) < 50 then
			Talk(1,"","Trong hµnh trang kh«ng ®ñ Xu vËt phÈm<color=green>50<color>c¸i");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Thµnh viªn<color=green>"..sName.."<color>Trong hµnh trang kh«ng ®ñ Xu vËt phÈm<color=green>50<color>c¸i")
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	local nExp = tonumber(VET_201203_EXP_Award_IB[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30230,50) ~= 1 then print("line 198 : gongli.lua error") end
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_daily_final()
	--¶Ó³¤
	if GetName() ~= GetCaptainName() then
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t ho¹t ®éng");
		return 0;
	end
	--¶ÓÔ±×ÔÉíÌõ¼ş
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia","Thµnh viªn<color=green>"..sName.."<color>kh«ng ®ñ ®iÒu kiÖn");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--¶ÓÎéÈËÊı
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","Téi ®éi tèi thiÓu <color=green>2<color> ng­êi, nhiÒu nhÊt <color=green>5<color> ng­êi míi ®­îc kİch ho¹t ho¹t ®éng Chung Søc")
		return 0;
	end
	--Ìì´Î
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÊÇ·ñÁì¹ı5´ÎÁË
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) + VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) ~= 5 then
			Talk(1,"","Mçi ngµy nhËn th­ëng ho¹t ®éng Chung Søc 5 lÇn míi ®ñ ®iÒu kiÖn kİch ho¹t phÇn th­ëng tèi ®a");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Thµnh viªn<color=green>"..sName.."<color>Sè lÇn nhËn th­ëng ho¹t ®éng Chung Søc kh«ng ®ñ 5 lÇn");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--ÖÁÉÙ2ÖÖÁ÷ÅÉ
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ®éi tèi thiÓu ph¶i cã 2 hÖ ph¸i kh¸c nhau míi cã thÓ nhËn th­ëng");
		return 0;
	end	
	--ÊÇ·ñÁìÈ¡¹ı
	nOldPlayerIndex =PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Tag) ~= 0 then
			Talk(1,"","§ång ®¹o ®· nhËn th­ëng tèi ®a råi");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Thµnh viªn<color=green>"..sName.."<color>®· nhËn th­ëng tèi ®a råi");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,1);
		gf_EventGiveRandAward(VET_201203_COIN_FINAL_AWARD,10000,1,"Ho¹t ®éng Chung Søc","PhÇn th­ëng tèi ®a mçi ngµy")
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function do_nothing()
end