Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

FK_TEMPLATE = "Du Ph­¬ng ®¹i phu";
FK_NAME = "Chñ qu¶n thu thËp";
FK_SPAWN_POINTS = 
{
	{100, 1403, 2916},	
	{150, 1727, 3175},	
	{200, 1447, 2908},	
	{300, 1760, 3632},	
	{350, 1351, 2900},	
};

FK_HEAD1 = "Ta cã thÓ gióp ®­îc g× cho c¸c h¹?";
FK_MENU1 = 
{
	"Ta muèn b¸o danh/FK_DoApply",
	"Ta chØ ghÐ ch¬i/gf_DoNothing"
}

FK_MENU1_1 = 
{
	[0] = "Xin chän v­ên c©y"
}
for i=1, getn(FG_PLAYER_SPAWN_POINTS) do
	tinsert(FK_MENU1_1, FG_PLAYER_SPAWN_POINTS[i][3].."/#FK_DoEnter("..i..")");
end

function FK_Result(content)
	Talk(1, "", content);
end

function FK_GetPlayerName(playerIndex)
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = playerIndex;
	local name = GetName();
	PlayerIndex = oldPlayerIndex;
	return name;
end

function FK_Check()
	local teamSize = GetTeamSize();
	if 0 == teamSize then
		FK_Result("RÊt tiÕc, ho¹t ®éng cÇn tæ ®éi míi cã thÓ tham gia, h·y t×m ®ång ®éi cña m×nh ®Õn ®i");
		return 0;
	end
	if 5 > teamSize then
		FK_Result("RÊt tiÕc, ho¹t ®éng cÇn tæ ®éi trªn 5 ng­êi míi cã thÓ tham gia, h·y t×m thªm ®ång ®éi ®i nµo");
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		FK_Result("RÊt tiÕc, chØ cã ®éi tr­ëng míi ®­îc phÐp b¸o danh");
		return 0;
	end
	for i=1, teamSize do
		local playerIndex = GetTeamMember(i);
		--WriteLog("FK_Check::playerIndex: "..playerIndex);
		if 1 ~= FG_CheckPlayer(playerIndex) then
			FK_Result("Xin lçi, "..FK_GetPlayerName(playerIndex).."Kh«ng tháa ®iÒu kiÖn, kh«ng thÓ vµo b¶n ®å thu thËp");
			return 0;
		end
	end
	return 1;
end

function FK_DoApply()
	--WriteLog("FK_DoApply::called");
	if 1 == FK_Check() then	
		--WriteLog("FK_DoApply::test1");
		gf_PageSay(FK_MENU1_1, 1, 6);
	end
end

function FK_DoEnter(index)
	--WriteLog("FK_DoEnter::index: "..index);
	if 1 == FK_Check() then
		local mapID = FG_GetGatherMap(SubWorldIdx2ID(SubWorld));
		--WriteLog("FK_DoEnter::FG_GetState("..mapID.."): "..FG_GetState(mapID));
		if FG_STATE_INITING ~= FG_GetState(mapID) then
			FK_Result("RÊt tiÕc, thêi gian b¸o danh ®· kÕt thóc");
			return
		end
		if 1 == FG_IsZoneFull(mapID, index) then
			FK_Result("RÊt tiÕc, khu vùc v­ên c©y nµy ®· ®Çy");
		else
			FG_TeamEnter(mapID, index);
		end
	end
end

function main()
--	Say(FK_HEAD1, getn(FK_MENU1), FK_MENU1);
end