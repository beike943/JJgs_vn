Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
g_nWaterInterval = 10*60;	--½½Ë®¼ä¸ô

g_tbSentence = 
{
	[1] = "Mçi khi ta nhí ®Õn ng­¬i, thiªn h¹ r¬i 1 h¹t c¸t; mçi khi ta nhí ®Õn ng­¬i trong v­ên rông 1 c¸nh hoa, b©y giê ngµy ngµy ta ®Òu d¹o b­íc trong biÓn hoa. ",
	[2] = "Ta cho ng­¬i biÕt, trªn thÕ gian nµy cã 1 ng­êi lu«n ®îi ng­¬i, bÊt luËn lµ ng­¬i ®ang ë ®©u, trong thêi gian nµo, ng­¬i cø biÕt r»ng lu«n cã mét ng­êi nh­ vËy.",
}

function main()
	local nPlantTime = GetTask(ABLUEMOON_PLANT_TIME);
	local nElapseTime = GetTime() - nPlantTime;
	local nNpcIdx = GetTargetNpc();
	local nMyRoseIdx = GetTask(ABLUEMOON_ROSE_INDEX);
	if nMyRoseIdx == 0 or nMyRoseIdx ~= nNpcIdx then	--Èç¹ûË÷Òý²»Ò»Ñù
		return 0;
	end;
	local szNpcName = GetNpcName(nNpcIdx);
	if check_team() == 0 then
		return 0;
	end;
	if get_female_name() ~= get_rose_owner_name(szNpcName) then	--Èç¹ûÅ®·½Ãû×ÖºÍ»¨µÄÖ÷ÈËµÄÃû×Ö²»Ò»Ñù
		return 0;
	end;
	local nGrow = floor(GetTask(ABLUEMOON_GROW_TYPE)/10);
	if strsub(szNpcName,strlen(szNpcName)-5,strlen(szNpcName)) == "Hoa hång" then	--³¤³ÉÁË
		if GetSex() == 1 then
			Talk(1,"","Hoa hång cña ng­¬i ®· lín, mau gäi ng­êi yªu ®Õn h¸i ®i.");
		else
			if GetName() ~= get_rose_owner_name(szNpcName) then
				return 0;
			end;
			local selTab = {
						"§­îc th«i! (h¸i hoa hång)/#get_rose("..nNpcIdx..")",
						"§Ó ta suy nghÜ l¹i/nothing",
						}
			Say("Trång loµi hoa hång nµy rÊt khã, ®Ó minh chøng cho t×nh yªu cña hai ng­¬i, ng­¬i cã ®ång ý v× h¾n mµ tiÕp nhËn 1 lÇn thö th¸ch kh«ng?",getn(selTab),selTab);
		end;
		return 0;
	end;
	if GetSex() == 2 then
		Talk(1,"","Hoa ¬i, h·y mau në!");
		return 0;
	end;
	if nElapseTime <= g_nWaterInterval then
		Talk(1,"","Thêi gian t­íi c¸ch lÇn sau cßn <color=yellow>"..tf_GetTimeString(g_nWaterInterval-nElapseTime).."<color>.");
		return 0;
	end;
	local selTab = {
			"§­îc, ta muèn t­íi/#water_rose("..nNpcIdx..")",
			"§îi mét l¸t råi t­íi/nothing",
			}
	Say("B©y giê ng­¬i muèn t­íi sao?",getn(selTab),selTab);
end;

function get_rose_owner_name(szRoseName)
	return strsub(szRoseName,3,strlen(szRoseName)-12);
end;

function get_rose(nNpcIdx)
	if check_team() == 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0;
	end;
	local nType = mod(GetTask(ABLUEMOON_GROW_TYPE),10);
	local nExpAward80,nExpAward50 = 0,0;
	if nType == 1 then
		nExpAward80 = 19999999;
		nExpAward50 = 9999999;
	else
		nExpAward80 = 9999999;
		nExpAward50 = 6999999;	
	end;
	SetNpcLifeTime(nNpcIdx,0);
	local nRetcode,nItemIdx = AddItem(2,0,1161,1);
	SetItemParam(nItemIdx,0,nType);
	Msg2Player("B¹n nhËn ®­îc 1 r­¬ng hoa hång");
	local nOldIdx = PlayerIndex;
	local szFemaleName = GetName();
	local szMaleName = "";
	local nRandSentence = random(1,getn(g_tbSentence));
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 1 then
			Say("<color=red>"..szFemaleName.."<color> nãi víi b¹n:"..g_tbSentence[nRandSentence],0);
			if GetLevel() >= 80 then
				ModifyExp(nExpAward80);
				Msg2Player("B¹n nhËn ®­îc "..nExpAward80.." ®iÓm kinh nghiÖm");
			elseif GetLevel() >= 50 then
				ModifyExp(nExpAward50);
				Msg2Player("B¹n nhËn ®­îc "..nExpAward50.." ®iÓm kinh nghiÖm");
			end;
			szMaleName = GetName();
		end;
		SetTask(ABLUEMOON_PLANT_TIME,0);
		SetTask(ABLUEMOON_GROW_TYPE,0);
		SetTask(ABLUEMOON_ROSE_INDEX,0);
		SetTask(ABLUEMOON_ROSE_ID,0);
	end;
	PlayerIndex = nOldIdx;
	local szColor = "";
	if nType == 1 then
		szColor = "Tö";
	else
		szColor = " lam";
	end;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if nType == 1 then
		nNpcIdx = CreateNpc("Mai Quý Hoa Tö",szFemaleName.." hoa hång tÝm",nMapID,nMapX,nMapY)
	else
		nNpcIdx = CreateNpc("Mai Quý Hoa Lam",szFemaleName.." hoa hång lam",nMapID,nMapX,nMapY)
	end;
	Msg2Global(szFemaleName.." h¸i "..szMaleName.." trång "..szColor.." hoa hång, vµ nãi: "..g_tbSentence[nRandSentence]);
	AddGlobalCountNews("<color=red>"..szFemaleName.."<color> ®· h¸i <color=red>"..szMaleName.."<color> trång"..szColor.." hoa hång, vµ nãi: "..g_tbSentence[nRandSentence]);
	WriteLog("[Hoa hång Thè TiÓu Nha]:"..szFemaleName.." h¸i "..szMaleName.." - Hoa hång. nType:"..nType.."£¬Level:"..GetLevel());
end;
function water_rose(nNpcIdx)
	if check_team() == 0 then
		return 0;
	end;
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"","Ng­¬i kh«ng mang theo lé thñy µ, lé thñy trong <color=yellow>D­îc ®iÕm<color> cã b¸n ®Êy.");
		return 0
	end;
	DelItem(2,0,351,1);
	local nGrow = floor(GetTask(ABLUEMOON_GROW_TYPE)/10);
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	local szFemaleName = get_female_name();
	if nGrow == 1 then
		nNpcIdx = CreateNpc("MÇm Hoa hång","®Ó"..szFemaleName.." trång hoa hång",nMapID,nMapX,nMapY)
	elseif nGrow == 2 then
		nNpcIdx = CreateNpc(" nh¸nh hoa hång","®Ó"..szFemaleName.." nô hoa",nMapID,nMapX,nMapY)
	elseif nGrow == 3 then
		if mod(GetTask(ABLUEMOON_GROW_TYPE),10) == 1 then
			nNpcIdx = CreateNpc("Mai Quý Hoa Tö","®Ó"..szFemaleName.." - Hoa hång tÝm",nMapID,nMapX,nMapY)
		else
			nNpcIdx = CreateNpc("Mai Quý Hoa Lam","®Ó"..szFemaleName.." - Hoa hång lam",nMapID,nMapX,nMapY)
		end;
	end;
	SetNpcScript(nNpcIdx,"\\script\\online\\abluemoon\\rose_npc.lua");	
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		SetTask(ABLUEMOON_ROSE_INDEX,nNpcIdx);
		SetTask(ABLUEMOON_GROW_TYPE,GetTask(ABLUEMOON_GROW_TYPE)+10);
		SetTask(ABLUEMOON_PLANT_TIME,GetTime());
		Say("Chó ý: NÕu bªn n÷ ch­a h¸i hoa hång nµy tr­íc vµ ng­êi ch¬i kh¸c ®· trång hoa hång kh¸c, th× bªn n÷ sÏ kh«ng thÓ h¸i ®­îc hoa hång nµy, bªn nam còng gièng nh­ vËy.",0);
	end;
	PlayerIndex = nOldIdx;
end;

function check_team()
	if check_partner_sex() == 0 then
		Talk(1,"","Mét nhãm nam n÷ míi cã thÓ trång hoa hång.");
		return 0;
	end;
	if check_rose_id() == 0 then
		Talk(1,"","§©y kh«ng ph¶i tæ ®éi ban ®Çu cña b¹n, hai ng­êi ph¶i chung thñy míi trång ®­îc hoa hång.");
		return 0;
	end;
	return 1;
end;

function check_rose_id()
	local nID1,nID2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nID1 = GetTask(ABLUEMOON_ROSE_ID);
	PlayerIndex = GetTeamMember(2);
	nID2 = GetTask(ABLUEMOON_ROSE_ID);
	PlayerIndex = nOldIdx;
	if nID1 == nID2 then
		return 1;
	else
		return 0;
	end;	
end;

function check_partner_sex()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nSex1,nSex2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nSex1 = GetSex();
	PlayerIndex = GetTeamMember(2);
	nSex2 = GetSex();
	PlayerIndex = nOldIdx;
	if nSex1 ~= nSex2 then
		return 1;
	else
		return 0;
	end;
end;

function get_female_name()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 2 then
			local szName = GetName();
			PlayerIndex = nOldIdx;
			return szName,PlayerIndex;
		end;
	end;
	PlayerIndex = nOldIdx;
	return 0;
end;

function nothing()

end;