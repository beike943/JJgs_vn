-------������GMָ��-----
--Ϊ�˷������ʹ�ã���ʱ����������Щ������Ҫ������---
--���ļ����ս���Ȩ����ɽ��-�����顣

-- �����ռ�����ͷ�ļ�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\collection\\task_head.lua");
Include("\\script\\task\\boss\\boss_pos.lua");
Include("\\script\\online\\laborday06\\laborday_head.lua");
-- �Ի�֮ҹͷ�ļ�
Include("\\script\\shinynight_head.lua");
--�峤�Ĺ���������
Include("\\script\\online\\zgc_public_fun.lua")
--�����ûͷ�ļ�
Include("\\script\\online\\abluemoon\\abluemoon_init.lua");
Include("\\script\\online\\viet_event\\factionboss\\head_factionboss.lua");
--�ճ�����ͷ�ļ�
Include("\\script\\task\\richangrenwu\\init_task.lua")
--��ս����boss
Include("\\script\\online_activites\\tiaozhansilingboss\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");--���������ļ�
Include("\\script\\online_activites\\2011_03\\boss\\eventboss.lua")
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\meridian\\meridian_exp_exchg_zhenqi.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")

function tianzhansilingboss(nMapId)
	do	return	end
    if gf_CheckEventDateEx(VET_201008_SILING_EVENT_NUMBER) == 0 then
        return 0;
    end
    SetGlbValue(1033,nMapId)
    --print("MAP_ID = ***************"..MAP_ID[nMapId][1])
    mf_OpenMission(MISSION_ID,MAP_ID[nMapId][1])
    AddSiLingDing(nMapId); --������鶦
    AddTanMuXiang()
    --print("nMapId = ******************"..nMapId)
end

function GS_VET_201103_EventBoss_SpawnBoss(nMapId,nX,nY)
	VET_201103_EventBoss_SpawnBoss(nMapId,nX,nY);
end

function UPLevel(lvl)
     SetLevel(lvl,8000)
     SetStrength(1999);
     SetDexterity(999);
     SetEnergy(999);
     SetObserve(999);
     SetVitality(999);
     Earn(100000000);
     AddItem(0,105,1,1)   ----����ring��
     AddItem(0,102,5,1)
     AddItem(0,102,10,1)
     AddItem(0,102,15,1)
     AddItem(0,102,20,1)
     if (lvl>=50)   then    --��������
     AddItem(0,0,1,1)
     AddItem(0,2,14,1)
     AddItem(0,5,27,1)
     AddItem(0,1,40,1)
     AddItem(0,3,53,1)
     AddItem(0,10,64,1)
     AddItem(0,9,75,1)
     AddItem(0,8,86,1)
     end
     RestoreAll()
end
-----------------����ѧϰ----------------------
function AddSkillSL(Route)     ---ѧϰ���ּ���
     if (Route==1) then
     for i=21,32 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng Thi�u L�m t�c gia");
     elseif (Route==2) then
     for i=45,57 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng Thi�u L�m thi�n t�ng");
     elseif (Route==3) then
     for i=33,44 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng Thi�u L�m v� t�ng");
     end
end

function AddSkillTM(Route)    ---ѧϰ���ż���
     if (Route==1) then
     for i=58,74 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng ���ng M�n hi�p kh�ch");
     end
end

function AddSkillEM(Route)    ---ѧϰ���Ҽ���
     if (Route==1) then
     for i=75,89 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng Nga My xu�t gia");
     elseif (Route==2) then
     for i=90,102 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng Nga My t�c gia");
     end
end

function AddSkillGB(Route)   ---ѧϰؤ�＼��
     if (Route==1) then
     for i=103,113 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng C�i Bang T�nh y");
     elseif (Route==2) then
     for i=114,124 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng C�i Bang � y");
     end
end

function AddSkillWD(Route)  ---ѧϰ�䵱����
     if (Route==1) then
     for i=125,146 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng V� �ang ��o gia");
     elseif (Route==2) then
     for i=147,159 do LearnSkill(i) end
     Msg2Player("B�n h�c ���c k� n�ng V� �ang t�c gia");
     end
end
-------------------------���ӵ���---------------------------
function AddCloth(sex)   --�����·�
     if (sex=="Nam ti�u chu�n") then
     for i=1,18 do AddItem(0,100,i,1) end
     for i=1,18 do AddItem(0,101,i,1) end
     for i=1,18 do AddItem(0,103,i,1) end
     elseif (sex=="Nam kh�i ng�") then
     for i=19,36 do AddItem(0,100,i,1) end
     for i=19,36 do AddItem(0,101,i,1) end
     for i=19,36 do AddItem(0,103,i,1) end
     elseif (sex=="N� g�i c�m") then
     for i=37,54 do AddItem(0,100,i,1) end
     for i=37,54 do AddItem(0,101,i,1) end
     for i=37,54 do AddItem(0,103,i,1) end
     elseif (sex=="Ki�u n�") then
     for i=55,72 do AddItem(0,100,i,1) end
     for i=55,72 do AddItem(0,101,i,1) end
     for i=55,72 do AddItem(0,103,i,1) end
     end
end
function AddWeapon(tp)   ---��������
    if(tp=="H� uy�n") then
    	for i=1,13 do AddItem(0,0,i,1) end
    elseif(tp=="Ki�m") then
    	for i=14,26 do AddItem(0,2,i,1) end
    elseif(tp=="C�n") then
    	for i=27,39 do AddItem(0,5,i,1) end
    elseif(tp=="�m kh�") then
    	for i=40,52 do AddItem(0,1,i,1) end
    elseif(tp=="�ao") then
    	for i=53,63 do AddItem(0,3,i,1) end
    elseif(tp=="C�m") then
    	for i=64,74 do AddItem(0,10,i,1) end
    elseif(tp=="B�t") then
    	for i=75,85 do AddItem(0,9,i,1) end
    elseif(tp=="Tr��ng") then
    	for i=86,96 do AddItem(0,8,i,1) end
    end
end

function CollectionTaskStart(nMapId, nNpcId, nObjId, nObjType)
	SetGlbValue(100, 333)
end

function CollectionTaskClose(nMapId, nNpcId, nObjId, nObjType)
	print(format("GlobaleValue(%d):%d", 100, GetGlbValue(100)));
end


function createDataCall(nRandomSeed)

	randomseed(nRandomSeed);

	createCollecEvent();

end;


function closeDataCall(nState)

	closeCollectEvent();

end;
-------------------------�ٻ�BOSS---------------------------
function createBoss(Random1,Random2,Random3)
--�ٻ�����������
	x=random(1,Pos[Random1][1]) --ͬһ��ͼ�϶���������һ��ˢ
	npcIndex = CreateNpc(Boss[1][1],Boss[1][2],Pos[Random1][2],Pos[Random1][x+2][1],Pos[Random1][x+2][2],-1,1,1,30)
	msg="��˵�ưԱ������ֵı���������ͻȻ��"..Pos[Random1][Pos[Random1][1]+3].."���֣�����������ı��"
		for i=1,3 do
		AddLocalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

--�ٻ�ǹ��Ӯ��
	y=random(1,Pos[Random2][1]) --ͬһ��ͼ�϶���������һ��ˢ
	npcIndex = CreateNpc(Boss[2][1],Boss[2][2],Pos[Random2][2],Pos[Random2][y+2][1],Pos[Random2][y+2][2],-1,1,1,30)
	msg="��˵��ʼ�ʵ���������ǹ��Ӯ���Ѿ���Ϊ��Ӱ������"..Pos[Random2][Pos[Random2][1]+3].."���֣��������ֽ�����һ��Ѫ���ȷ磡"
		for i=1,3 do
		AddLocalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

--�ٻ�������
	z=random(1,Pos[Random3][1]) --ͬһ��ͼ�϶���������һ��ˢ

	npcIndex = CreateNpc(Boss[3][1],Boss[3][2],Pos[Random3][2],Pos[Random3][z+2][1],Pos[Random3][z+2][2],-1,1,1,30)
	msg="�ഫ��ʮ��ǰ������ͷ������������ͻȻ��"..Pos[Random3][Pos[Random3][1]+3].."Ӱ�֣���ҸϿ�ȥһ�÷��ݣ�"
		for i=1,3 do
		AddLocalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end
function createNewResBoss(nBossType,nPosType)
	local tbMapID = 
		{
			{606,1363,3074,"T�i nguy�n chi�n"},
			{606,1465,2978,"T�i nguy�n chi�n"},
			{606,1364,2886,"T�i nguy�n chi�n"},
			{606,1268,2979,"T�i nguy�n chi�n"},
		}
	
	local tbMsg = 
		{
			{"Nghe n�i minh ch� l�c l�m x�ng b� s�n tr�i ph�a b�c �ang � ", " hi�n th�n, ch�c �ang c� �m m�u!"},
			{"Nghe n�i th� v� th�n t�n c�a T�n Th�y Ho�ng l� Th��ng Th�n Doanh Thi�n �� xu�t hi�n t�i ", " v� l�m s�p c� m�t tr�n h�o ki�p!"},
			{"Nghe n�i h�n ma L�nh H��ng L�ng 10 n�m tr��c t�ng l� hoa kh�i Giang T�n Th�n nay xu�t hi�n t�i ", "mau ��n �� xem th� dung nhan ki�u di�m c�a n�ng!"},
		}
			
	local nNpcIndex = CreateNpc(Boss[nBossType][1],Boss[nBossType][2],tbMapID[nPosType][1],tbMapID[nPosType][2],tbMapID[nPosType][3])
	SetNpcScript(nNpcIndex, "\\script\\task\\boss\\bossnewres_ondeath.lua")
	SetNpcLifeTime(nNpcIndex, 3*60*60)
	
	
	if SubWorldID2Idx(tbMapID[nPosType][1]) >= 0 then
		local szMsg = tbMsg[nBossType][1]..tbMapID[nPosType][4]..tbMsg[nBossType][2]
		Msg2Global(szMsg)
	end
end

function OpenPunishFlag(bOpen)
	 SetPunishFlagEnable(bOpen)
end

-------------------------MikeDai---------------------------
function MikeDai(route)
	local nRoute = tonumber(route)

	local nSkillStartID, nSkillEndID
	if nRoute == 2 then        --�����׼�
		AddItem(0, 3, 53, 1, 1)   -- �ӵ�
		AddItem(0, 5, 27, 1, 1)   -- �ӹ�
		nSkillStartID	= 21
		nSkillEndID	= 31
	elseif nRoute == 3  then   --��������
		AddItem(0, 8, 86, 1, 1)   -- ����
		nSkillStartID	= 45
		nSkillEndID	= 56
	elseif nRoute == 4  then   --��������
		AddItem(0, 0, 1, 1, 1)    -- ��ȭ��
		nSkillStartID	= 33
		nSkillEndID	= 43
	elseif nRoute == 6  then   --����
		AddItem(0, 1, 40, 1, 1)   -- �Ӱ�����
		AddItem(2, 11, 0, 1000, 1)-- �Ӱ���
		AddItem(2, 3, 6, 500, 1)  -- �ӻ���
		nSkillStartID	= 58
		nSkillEndID	= 73
	elseif nRoute == 8  then   --���ҷ��
		AddItem(0, 2, 14, 1, 1)   -- �ӽ�
		nSkillStartID	= 75
		nSkillEndID	= 88
	elseif nRoute == 9  then   --�����׼�
		AddItem(0, 10, 64, 1, 1)  -- ����
		nSkillStartID	= 90
		nSkillEndID	= 101
	elseif nRoute == 11 then   --ؤ�ﾻ��
		AddItem(0, 0, 1, 1, 1)    -- ��ȭ��
		nSkillStartID	= 103
		nSkillEndID	= 112
	elseif nRoute == 12 then   --ؤ������
		AddItem(0, 5, 27, 1, 1)   -- �ӹ�
		nSkillStartID	= 114
		nSkillEndID	= 123
	elseif nRoute == 14 then   --�䵱����
		AddItem(0, 2, 14, 1, 1)   -- �ӽ�
		nSkillStartID	= 125
		nSkillEndID	= 145
	elseif nRoute == 15 then   --�䵱�׼�
		AddItem(0, 9, 75, 1, 1)   -- �ӱ�
		nSkillStartID	= 147
		nSkillEndID	= 158
	elseif nRoute == 17 then   --����ǹ��
		AddItem(0, 6, 97, 1, 1)   -- ��ǹ
		nSkillStartID	= 720
		nSkillEndID	= 731
	elseif nRoute == 18 then   --���Ź���
		AddItem(0, 4, 108, 1, 1)  -- �ӹ�
		nSkillStartID	= 733
		nSkillEndID	= 744
	elseif nRoute == 20 then   --�嶾а��
		AddItem(0, 7, 1, 1, 1)    -- ��˫��
		nSkillStartID	= 364
		nSkillEndID	= 377
	elseif nRoute == 21 then   --�嶾��ʦ
		AddItem(0, 11, 1, 1, 1)   -- ��צ
		nSkillStartID	= 347
		nSkillEndID	= 363
	else
		return
	end

	for nSkillID = nSkillStartID, nSkillEndID, 1
	do
		LearnSkill(nSkillID)
		while LevelUpSkill(nSkillID) == 1
		do
		end
	end

	SetPlayerRoute(nRoute)

	SetLevel(99,999 * 5)

	SetStrength(999)
	SetDexterity(999)
	SetVitality(999)
	SetEnergy(999)
	SetObserve(999)

	RestoreAll()

	AddItem(0, 105, 1,  1, 1)	-- ����
end

-- �Ի�֮ҹ��ʼ
function ShinyNight_Start(system, multiple, szVoteName)
	-- DEBUG
	if (szVoteName ~= nil) then
		print(format("ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	end

	SetGlbValue(GAMESVRGLB_SYSTEM, system)
	SetGlbValue(GAMESVRGLB_MULTIPLE, multiple)
	WriteLog(format("ShinyNight start: %s(%1.1f)", map_sysnames[system], multiple / 100))

	local strTaskName = {"Chi�n tr��ng", "Th��ng h�i", "Nhi�m v� s� m�n - ng�u nhi�n", "Nhi�m v� s� m�n tu�n ho�n", "Nhi�m v� s�t th�", "��u thuy�n r�ng"}
	local msg = ""
	if (szVoteName ~= "" and szVoteName ~= nil) then
		msg = "��m huy ho�ng h�m nay do "..szVoteName.."  quy�t ��nh! N�i dung c� th�:"..strTaskName[system]
	else
		msg = "��m huy h�m h�m nay �� ���c quy�t ��nh! N�i dung c� th�:"..strTaskName[system]
	end
	AddGlobalNews(msg)
end

-- �Ի�֮ҹ����
function ShinyNight_Close()
	-- DEBUG
	print("ShinyNight_Close()")
	SetGlbValue(GAMESVRGLB_SYSTEM, 0)
	SetGlbValue(GAMESVRGLB_MULTIPLE, 100)
	WriteLog("ShinyNight close......")
end


-- ���call��һ���̻���������npc
function random_shop(nWorld, nX, nY)
	local nNpcIndex = CreateNpc("Ch� c�m �� T�y Nam", "Th��ng nh�n T�y V�c", nWorld, nX, nY)

	-- ����npc����ʱ�䣺���Сʱ
	SetNpcLifeTime(nNpcIndex, 1800)

	-- ���ؽű�
	SetNpcScript(nNpcIndex, "\\script\\task\\tasklink\\xiyuhushang.lua")
end;


-- ����relay������ָ�����������boss��������Ҵ�
function call_faction_bt_boss(nPos1, nPos2, nPos3)
	local strBossName = {"Thanh Th�", "Huy�n Ch�n", "D��ng Di�n ��c", "���ng H�", "Ho�ng Ch�nh Nh�t", "C� M�c", "Tu� Minh"}
	local szBossMapID = {312, 204, 219, 305, 209, 407, 303}
	local szBossMapX = {1580, 1378, 1676, 1570, 1482, 1710, 1673}
	local szBossMapY = {3386, 3241, 3307, 3007, 3244, 3211, 3387}
	local strBossScript = {"\\script\\task\\faction_boss\\qingshu.lua",
						   "\\script\\task\\faction_boss\\xuanzhen.lua",
						   "\\script\\task\\faction_boss\\yangwulang.lua",
						   "\\script\\task\\faction_boss\\tangxi.lua",
						   "\\script\\task\\faction_boss\\huangzhengjian.lua",
						   "\\script\\task\\faction_boss\\gumo.lua",
						   "\\script\\task\\faction_boss\\huiming.lua"}

	-- ������ֱ��7��bossȫ���г���
	-- �ж��ǲ��������壬��������������
	local nCurWeekDay = tonumber(date("%w"))
	if (nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) then
		local nNpcIndex = 0;
		for i = 1, 7 do
			nNpcIndex = CreateNpc(strBossName[i], strBossName[i], szBossMapID[i], szBossMapX[i], szBossMapY[i])
			SetNpcLifeTime(nNpcIndex, 1800)
			SetNpcScript(nNpcIndex, strBossScript[i])
		end
		local msg = "Cao th� c�a c�c ��i ph�i hi�n �ang t�p trung b�n ngo�i, v� b�ng h�u n�o �� b�o danh mau nhanh ch�ng ��n ��!"
		AddGlobalNews(msg)
	end

	-- �е�һ��boss
	--local nNpcIndex = CreateNpc(strBossName[nPos1], strBossName[nPos1], szBossMapID[nPos1], szBossMapX[nPos1], szBossMapY[nPos1])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos1])

	-- �еڶ���boss
	--nNpcIndex = CreateNpc(strBossName[nPos2], strBossName[nPos2], szBossMapID[nPos2], szBossMapX[nPos2], szBossMapY[nPos2])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos2])

	-- �е�����boss
	--nNpcIndex = CreateNpc(strBossName[nPos3], strBossName[nPos3], szBossMapID[nPos3], szBossMapX[nPos3], szBossMapY[nPos3])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos3])
end;
--********************************************̫���������񴴽�������************************************
function taixujwl_liu_crt()
--============================����������======================
local lingbao_map_ID = 218					--�鱦ɽ�ĵ�ͼID
local taixu_jwl_hammer_date_glbID = 507		--��������Ʒʹ�����
local taixu_liu_killed_date_glbID = 508		--��������ɱ�������
local taixu_jwl_liu_crt_att_glbID_srt = 511	--��¼��������������ʼλ��
local taixu_jwl_liu_crt_att_glbID_end = 550	--��¼�����ʱ���������λ��
--============================�ű����߼�����====================
local glb_use_date_seq = GetGlbValue(taixu_jwl_hammer_date_glbID)
local att_seq_random = 0					--���ȡ�õ�����
	if glb_use_date_seq ~= zgc_pub_day_turn(1) then		--û����ʹ��Ī�������������
		return
	else									--����ʹ�����������ȡ�õ�ͼ����
		if (zgc_pub_day_turn(1) - GetGlbValue(taixu_liu_killed_date_glbID)) <= 1 then		--�ж������Ƿ��Ѿ���������������
			return
		else								--���������Ϳ�ʼ����
			for i = taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end do
				local GlbDate = GetGlbValue(i)
				if GlbDate == 0 or GlbDate == nil then
					att_seq_random = random(taixu_jwl_liu_crt_att_glbID_srt,(i-1))
					break
				end
			end
		end
	end
	--ȡ�ô洢������
	local att_inf_save = GetGlbValue(att_seq_random)
	if att_inf_save == 0 or att_inf_save == nil then
		return
	end
	--����ת��
	local att_X = floor(att_inf_save/10000)		--X����
	local att_Y = att_inf_save - (att_X * 10000)
	local npc_index = CreateNpc("Th� r�n L�u","Th� r�n L�u",218,att_X,att_Y,-1,1,0,0)
	SetNpcScript(npc_index,"\\script\\task\\taixu_jwl_up\\taixu_liu_ondeath.lua")
	SetNpcLifeTime(npc_index,7200)
	Msg2SubWorld("Th� r�n L�u �� xu�t hi�n � Linh B�o s�n!")
end
--********************************************���������񴴽�Npc****************************************
Drug_grass_coordinate = {	--ҩ�˲�����
	{510,1585,2854},
	{510,1566,2880},
	{510,1557,2925},
	{510,1519,2877},
	{510,1507,2832},
	{510,1503,2787},
	{510,1536,2767},
	{510,1534,2821},
	{510,1476,2925},
	{510,1426,2914},
	{510,1469,2852},
	{510,1442,2764},
	{510,1414,2813},
	{510,1379,2856},
	{510,1344,2833},
	{510,1378,2785},
	{510,1288,2922},
	{510,1370,2923},
	{510,1322,2995},
	{510,1290,3057},
	{510,1332,3089},
	{510,1304,3168},
	{510,1574,2999},
	{510,1549,3042},
	{510,1549,3099},
	{510,1523,3085},
	{510,1514,3135},
	{510,1520,3206},
	{510,1415,3048},
	{510,1415,3114},
	{510,1381,3135},
	{510,1375,3185},
	{510,1414,3182},
	{510,1470,3088},
	{510,1516,2983},
}
Sun_bank_info = {			--����������Ϣ
	{"T�ch D��ng c�n h�ng","\\script\\������\\ɳĮ�Թ�\\npc\\��������.lua"},
	{"T�ch D��ng c�n ho�ng","\\script\\������\\ɳĮ�Թ�\\npc\\��������.lua"},
	{"T�ch D��ng c�n kh�i","\\script\\������\\ɳĮ�Թ�\\npc\\��������.lua"}
}
Sun_bank_coordinate ={		--����������
	{506,1440,2658},
	{506,1475,2659},
	{506,1363,2666},
	{506,1314,2667},
	{506,1252,2681},
	{506,1304,2722},
	{506,1295,2779},
	{506,1246,2712},
	{506,1274,2816},
	{506,1347,2742},
	{506,1347,2864},
	{506,1258,2852},
	{506,1249,2956},
	{506,1293,2922},
	{506,1255,3036},
	{506,1306,3021},
	{506,1325,3089},
	{506,1252,3142},
	{506,1330,3124},
	{506,1398,3136},
	{506,1405,3070},
	{506,1441,3156},
	{506,1562,3131},
	{506,1502,3075},
	{506,1450,3036},
	{506,1384,3016},
	{506,1410,2924},
	{506,1489,2932},
	{506,1545,3025},
	{506,1567,2910},
	{506,1534,2918},
	{506,1551,3020},
	{506,1549,2841},
	{506,1516,2870},
	{506,1454,2814},
	{506,1407,2856},
	{506,1457,2750},
	{506,1530,2712},
	{506,1390,2805},
	{506,1420,2772},
	{506,1614,2695},
	{506,1489,2698},
	{506,1525,2669},
	{506,1558,2662},
	{506,1447,2873},
	{506,1536,3146},
	{506,1547,3090},
	{506,1335,3153},
	{506,1474,2895},
	{506,1385,2748},
}
function north_west_task()

	local npc_index = 0
	--����Ҫ�˲�
	for i = 1,getn(Drug_grass_coordinate) do
		npc_index = CreateNpc("D��c Nh�n Th�o","D��c Nh�n Th�o",Drug_grass_coordinate[i][1],Drug_grass_coordinate[i][2],Drug_grass_coordinate[i][3])
		SetNpcLifeTime(npc_index,1500);
		SetNpcScript(npc_index,"\\script\\������\\ҩ����\\npc\\ҩ�˲�.lua")
	end
	--����������
	local sun_bank_diff = 0
	for i = 1,getn(Sun_bank_coordinate) do
		sun_bank_diff =( mod(i,3)+1)
		npc_index = CreateNpc(Sun_bank_info[sun_bank_diff][1],"T�ch D��ng c�n",Sun_bank_coordinate[i][1],Sun_bank_coordinate[i][2],Sun_bank_coordinate[i][3])
		SetNpcLifeTime(npc_index,1500);
		SetNpcScript(npc_index,Sun_bank_info[sun_bank_diff][2])
	end
end
--�����û
function abluemoon_start(nMapID)
	abluemoon_init(nMapID)
end
-- ����ս����������
function ReBattleBulidRank()
	ReBuildBattleData(5, 5)
end

-- ���¹���ս����˫������
function ReApplyCityWarADData(nType, nFlag)
	ApplyCityWarData(nType, nFlag)
end

-- ���ӿ�����ȡ���Ե�װ��
function AddItemL(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	if d == nil then d = 1 end
	if e == nil then e = 1 end
	if l1 == nil then l1 = -1 end
	if atr1 == nil then atr1 = -1 end
	if l2 == nil then l2 = -1 end
	if atr2 == nil then atr2 = -1 end
	if l3 == nil then l3 = -1 end
	if atr3 == nil then atr3 = -1 end
	local flag,idx = AddItem(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	SetEquipCanChouQu(idx, 1)
end

-- ������������֪ͨGS
function ReApplyGestRank()
	ApplyBWRankInfo()
end

--�����Ὺʼ���
--�����Ժ�Relay�ص�ִ�еĺ����������ַ����Ա��ⲻͬͷ�ļ�֮��ĳ�����ͻ
--function biwudahuiqianzou_init()
--	dofile("script/biwudahui/tournament/callback_function.lua");
--end;

--ʥ�𴫵ݴ��ݻ��ʼ��
function shenghuochuandi_init(nType)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate == 20080804 then
		if nType == 1 then
			Msg2Global("Ho�t ��ng r��c �u�c b�t ��u l�c 20:00, nh�ng ng��i tham gia d�a theo ch� th� c�a quy�n tham gia, chu�n b� r��c �u�c.");
		elseif nType == 2 then
			SetGlbValue(200,1);
			Msg2Global("Ho�t ��ng r��c �u�c ch�nh th�c b�t ��u, khi �u�c chuy�n ��n l� b�t ��u r��c, nh�ng ng��i ch�a ��n l��t th� s�n s�ng, nh�ng ng��i c� v� chu�n b� c� v�.");
		elseif nType == 3 then
			SetGlbValue(200,0);
			Msg2Global("Ho�t ��ng r��c �u�c �� th�nh c�ng m� m�n, c�m �n m�i ng��i �� tham gia, ch�ng ta c�ng ch�c m�ng th�nh c�ng n�y.");
			if GetTask(547) ~= 0 then
				Msg2Player("Trong 2 ph�t nh�n ��i �u�c t��ng �ng �� nh�n ph�n th��ng cu�i.")
			end
		elseif nType == 4 then
			dofile("script/online/aoyun08/aoyun_init.lua");
		end
	end
end

function AddItemOnce(a,b,c,d,e)
	if GetItemCount(a,b,c) < 1 then
		AddItem(a,b,c,d,e)
	end
end

function MikeDai2(route)
	local nRoute = tonumber(route)

	local nSkillStartID, nSkillEndID
	if nRoute == 2 then        --�����׼�
		AddItemOnce(0, 3, 53, 1, 1)   -- �ӵ�
		AddItemOnce(0, 5, 27, 1, 1)   -- �ӹ�
		nSkillStartID	= 21
		nSkillEndID	= 31
	elseif nRoute == 3  then   --��������
		AddItemOnce(0, 8, 86, 1, 1)   -- ����
		nSkillStartID	= 45
		nSkillEndID	= 56
	elseif nRoute == 4  then   --��������
		AddItemOnce(0, 0, 1, 1, 1)    -- ��ȭ��
		nSkillStartID	= 33
		nSkillEndID	= 43
	elseif nRoute == 6  then   --����
		AddItemOnce(0, 1, 40, 1, 1)   -- �Ӱ�����
		AddItemOnce(2, 11, 0, 1000, 1)-- �Ӱ���
		AddItemOnce(2, 3, 6, 500, 1)  -- �ӻ���
		nSkillStartID	= 58
		nSkillEndID	= 73
	elseif nRoute == 8  then   --���ҷ��
		AddItemOnce(0, 2, 14, 1, 1)   -- �ӽ�
		nSkillStartID	= 75
		nSkillEndID	= 88
	elseif nRoute == 9  then   --�����׼�
		AddItemOnce(0, 10, 64, 1, 1)  -- ����
		nSkillStartID	= 90
		nSkillEndID	= 101
	elseif nRoute == 11 then   --ؤ�ﾻ��
		AddItemOnce(0, 0, 1, 1, 1)    -- ��ȭ��
		nSkillStartID	= 103
		nSkillEndID	= 112
	elseif nRoute == 12 then   --ؤ������
		AddItemOnce(0, 5, 27, 1, 1)   -- �ӹ�
		nSkillStartID	= 114
		nSkillEndID	= 123
	elseif nRoute == 14 then   --�䵱����
		AddItemOnce(0, 2, 14, 1, 1)   -- �ӽ�
		nSkillStartID	= 125
		nSkillEndID	= 145
	elseif nRoute == 15 then   --�䵱�׼�
		AddItemOnce(0, 9, 75, 1, 1)   -- �ӱ�
		nSkillStartID	= 147
		nSkillEndID	= 158
	elseif nRoute == 17 then   --����ǹ��
		AddItemOnce(0, 6, 97, 1, 1)   -- ��ǹ
		nSkillStartID	= 720
		nSkillEndID	= 731
	elseif nRoute == 18 then   --���Ź���
		AddItemOnce(0, 4, 108, 1, 1)  -- �ӹ�
		nSkillStartID	= 733
		nSkillEndID	= 744
	elseif nRoute == 20 then   --�嶾а��
		AddItemOnce(0, 7, 1, 1, 1)    -- ��˫��
		nSkillStartID	= 364
		nSkillEndID	= 377
	elseif nRoute == 21 then   --�嶾��ʦ
		AddItemOnce(0, 11, 1, 1, 1)   -- ��צ
		nSkillStartID	= 347
		nSkillEndID	= 363
	else
		return
	end

	for nSkillID = nSkillStartID, nSkillEndID, 1
	do
		LearnSkill(nSkillID)
		while LevelUpSkill(nSkillID) == 1
		do
		end
	end

	SetPlayerRoute(nRoute)

	SetLevel(99,22222 * 5)

	SetStrength(22222)
	SetDexterity(22222)
	SetVitality(22222)
	SetEnergy(22222)
	SetObserve(22222)

	RestoreAll()

	AddItemOnce(0, 105, 1,  1, 1)	-- ����
end
function create_lanhua_boss_viet(nIndex)
	local nWeek = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nWeek >= 1 and nWeek <= 4 and nHour == 18) or nHour == 22 then
		return
	end
	local tbMapID = 
		{
			{606,1219,3129,"T�i nguy�n chi�n"},
			{606,1295,3111,"T�i nguy�n chi�n"},
			{606,1229,3053,"T�i nguy�n chi�n"},
			{606,1398,2948,"T�i nguy�n chi�n"},
		}
	local nNpcIndex = CreateNpc("lanhua_viet","Lan Hoa",tbMapID[nIndex][1],tbMapID[nIndex][2],tbMapID[nIndex][3])
	SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")
	SetNpcLifeTime(nNpcIndex,3*60*60)
	nNpcIndex = CreateNpc("yingzi_viet","Anh T�",tbMapID[nIndex][1],tbMapID[nIndex][2],tbMapID[nIndex][3])
	SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")
	SetNpcLifeTime(nNpcIndex,3*60*60)
	if SubWorldID2Idx(tbMapID[nIndex][1]) > 0 then
		Msg2Global("C� ng��i nh�n th�y Lan Hoa v� Anh T� xu�t hi�n t�i "..tbMapID[nIndex][4])
	end
end

function create_npcs(nDay)
	--if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
	--		return
	--	end
	
	local	t_denglong_sets = {
		[0] = {"Thi�u L�m", {204, 1526, 3269}},--������
		[1] = {"Nga My", {303, 1552, 3232}},--����һ
		[2] = {"���ng M�n", {305, 1530, 2921}},--���ڶ�
		[3] = {"C�i Bang", {209, 1515, 3265}},--������
		[4] = {"V� �ang", {312, 1707, 3477}},--������
		[5] = {"Ng� ��c", {407, 1555, 3286}},--������
		[6] = {"D��ng M�n", {219, 1655, 3301}},--������
	};
	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091206 or nDate < 091106 then
--		return 0;
--	end
	local nNpcIndex = 0;
	local nNpcLifeTime = 57 * 60;--��Ϊsystemtimetask.txt������Щ�����ʱ���Ѿ���ռ�ã����Ա���΢��������ʱ��
	nNpcIndex = CreateNpc("L� n��ng b�nh", "L� N��ng", gf_UnPack(t_denglong_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\npc_zoujundenglong.lua");
	AddUnitStates(nNpcIndex, 6, GetTime());--��¼NPC������ʱ��
	AddGlobalNews("Y�n ti�c Th�t N��ng ���c chi�u ��i t�i ["..t_denglong_sets[nDay][1].."]. M�i ��ng ��o ��n tham d�!");
end

function call_faction_boss(nTime)	
	do return end
	local tBossMapPos = {
										[0] = {"Thi�u L�m", {204, 1526, 3269}},
										[1] = {"Nga My", {303, 1554, 3235}},
										[2] = {"���ng M�n", {305, 1530, 2921}},
										[3] = {"C�i Bang", {209, 1515, 3265}},
										[4] = {"V� �ang", {312, 1707, 3477}},
										[5] = {"Ng� ��c", {407, 1555, 3286}},
										[6] = {"D��ng M�n", {219, 1655, 3301}},
									}
	local nDay = tonumber(date("%w"));
	local msg = "C� ng��i th�y c�c cao th� m�n ph�i �� xu�t hi�n t�i "..tBossMapPos[nDay][1]..", c�c v� b�ng h�u h�y mau ��n t� th�!"
	AddGlobalNews(msg)
	SetGlbValue(GLB_TSK_BOSS,0)
	call_faction_boss_new(nTime,tBossMapPos[nDay][2][1],tBossMapPos[nDay][2][2],tBossMapPos[nDay][2][3])
end

function call_niansou()
	local	t_niansou_set = {
		[0] = {"Thi�u L�m", {204, 1526, 3269}},--������
		[1] = {"Nga My", {303, 1552, 3232}},--����һ
		[2] = {"���ng M�n", {305, 1530, 2921}},--���ڶ�
		[3] = {"C�i Bang", {209, 1515, 3265}},--������
		[4] = {"V� �ang", {312, 1707, 3477}},--������
		[5] = {"Ng� ��c", {407, 1555, 3286}},--������
		[6] = {"D��ng M�n", {219, 1655, 3301}},--������
	};
	local nDate = tonumber(date("%y%m%d"));
	local nDay = tonumber(date("%w"));
--	if nDate > 100228 or nDate < 100129 then
--		return 0;
--	end
	
	-- if nTime == 2 and nDay ~= 0 and nDay ~= 6 then
	
	local nTime = tonumber ( date ("%H") )
	if (nTime >= 0 and nTime <= 7 ) or ( nTime >= 22 and nTime <= 24 ) then
		return 0;
	end	
	
	local nNpcIndex = 0;
	local nNpcLifeTime = 30 * 60;  --------------
	nNpcIndex = CreateNpc("��i Ni�n Th�", "Ni�n Th�", gf_UnPack(t_niansou_set[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua");	
	local szMsg = "C� ng��i th�y Ni�n Th� xu�t hi�n t�i ["..t_niansou_set[nDay][1].."]. C�c v� b�ng h�u h�y mau thu ph�c!"
	AddGlobalNews(szMsg);
	Msg2Global(szMsg)
end

--��ʼ���ճ�����
function InitDaliyTask(nPersonalTask, nTeamTask)
    local szFileName = "\\script\\gmscript.lua";
    if DAILY_TASK_0912_SWITCH == 1 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, nPersonalTask);
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, nTeamTask);
        if SubWorldID2Idx(100) >= 0 then --ֻһ̨������д�빲���Ϳ�����
            local nOldIndex = PlayerIndex;
            PlayerIndex = FirstPlayer();
            AddRelayShareData("richangrenwu_type", 0, 0, szFileName, "nothing", 0, "type", "dd", nPersonalTask, nTeamTask);
            PlayerIndex = nOldIndex;
        end
    end
end
function conf_res_protect_info()
	local Tb_conf_res_protect_info = {
		--{100,"Ȫ�ݵġ���Դ���������Ѿ���ʼ��"},
		{300,"Nhi�m v� b�o h� T�i nguy�n � Th�nh �� �� b�t ��u"},
		--{350,"�����ġ���Դ���������Ѿ���ʼ��"},
	}
	if Zgc_pub_week_day() ~= 3 then
		return
	end
	for i = 1 ,getn(Tb_conf_res_protect_info) do
		local city_belog_name = GetCityWarInfo(Tb_conf_res_protect_info[i][1],"base")
		--�жϱ����Ƿ�ռ��
		if city_belog_name ~= "" or city_belog_name ~= nil then
			Msg2SubWorld(Tb_conf_res_protect_info[i][2])
			AddGlobalNews(Tb_conf_res_protect_info[i][2])
		end
	end
end
--function GmAddGenuineQi(nValue)
--	ActivityAwardGenuineQiDaily(nValue)
--end
--
--function GmAddGenuineQiByType(nType, nValue)
--	AwardGenuineQiByType(nValue, nType)
--end

--function GmAddGenuineQiActivity(nValue)
--	return ActivityAwardGenuineQiDaily(nValue)
--end
--
--function GmGetGenuineQiCapacityActivity()
--	return ActivityGetDailyGenuineQiLeftCapacity()
--end
--
--function GmGetGenuineQiActivity()
--	return ActivityGetDailyAwardGenuineQi()
--end
--
--function GmAddGenuineQiIB(nValue)
--	return IBAwardGenuineQiDaily(nValue)
--end
--
--function GmGetGenuineQiCapacityIB()
--	return IBGetDailyGenuineQiLeftCapacity()
--end
--
--function GmGetGenuineQiIB()
--	return IBGetDailyAwardGenuineQi()
--end

--��ɽboss
function Create_LSB_BOSS(nRand)
	--print("Create_LSB_BOSS",nRand);
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
	if nRand == 1 then
		--ˢ������
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_LM");
	elseif nRand == 2 then
		--ˢ���踮��
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FB");
	elseif nRand == 3 then
		--ˢ���踮��
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FN");
	end
end

--����������������
function Relay_Generate_LuckNum()
	dofile("script/online/olympic/oly_relaycall.lua");
end


--���˻����
function Relay_Clean_Data()
	dofile("script/online/olympic/oly_relay_clean.lua");
end

--��սǧѰ���ƽ�BOSS
function Qht_Relay_Create_Gold_boss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\qianhe_tower\\qht_head.lua", format("qht_relay_create_gold_boss(%d)", tonumber(nRandomSeed)));	
end

--��սǧѰ����ʱ��������
function Qht_Relay_Clean()
	dofile("script/online/qianhe_tower/qht_relay_call.lua")
end

--׷�ش���������ս
function Dzt_CreateBoss()
	dofile("script/online/dazitie/dzt_relay.lua")
end

function Dzt_Close()
	dofile("script/online/dazitie/dzt_relay_close.lua");
end

--�������
function exgsvr_SavePlayerTasks()
	exgsvr_func_save_player_task()
end

--�����ɻ�ֿ�BOSS
function Cc_CreateBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\collect_card\\cc_relay_call.lua", format("cc_Relay_Callboss(%d)", tonumber(nRandomSeed)));	
end

--����ˢ��
function sp_CreateNianShou(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\spring2014\\sp_head.lua", format("sp_RealyCreateNianShou(%d)", tonumber(nRandomSeed)));	
end

-- ������������֪ͨGS
function ReApplyGestRank()
	print("ReApplyGestRank...")
	ApplyBWRankInfo()
end

--�����Ὺʼ���
--�����Ժ�Relay�ص�ִ�еĺ����������ַ����Ա��ⲻͬͷ�ļ�֮��ĳ�����ͻ
function biwudahuiqianzou_init()
	SendScript2VM("\\script\\biwudahui\\tournament\\callback_function.lua", "callback_open_biwudahui()");
end;

--����BOSS
function wb_CreateBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\world_boss\\wb_head.lua", format("wb_RelayCallCreateBoss(%d)", tonumber(nRandomSeed)));	
end

--���ﻨ��
function hd_CallNpc(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201409\\huadeng.lua", format("hd_CreateLantern(%d)", tonumber(nRandomSeed)));	
end

--�ڵ��߲���
function ibc_CallBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\item_buchang\\ibc_head.lua", format("ibc_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
end
