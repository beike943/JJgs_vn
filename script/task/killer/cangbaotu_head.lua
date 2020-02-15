-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 藏宝图头文件                  
-- Edited by starry night                                 
-- 2005/10/19 PM 16:07                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

--相关表格初始化
tabPos = new(KTabFile, "\\settings\\task\\killer\\cangbaotu_pos.txt");
tabMonster = new(KTabFile, "\\settings\\task\\killer\\cangbaotu_monster_mode.txt");
tabEquip = new(KTabFile, "\\settings\\task\\killer\\cangbaotu_equip.txt");

--产生怪物
function CreateMonster()

local nLevel = selectLevelArea();
local nRow = tabMonster:selectRowNum("Level",nLevel);
local nMonsterMode = tabMonster:getCell(nRow,"MonsterMode");
local nMonsterName = tabMonster:getCell(nRow,"MonsterName");
local nMapID,nWx,nWy = GetWorldPos();
local nNum = random(3,5);--设定怪物数量为3～5个
local argMonsterID = {};
local i = 0;
Msg2Player("出现宝藏妖怪，大侠小心!");

	nNum,argMonsterID = CreateNpc(nMonsterMode,nMonsterName,nMapID,nWx,nWy,-1,nNum,1,200);
	nNum = nNum-1;
	for i=0,nNum do				
		SetNpcScript(argMonsterID[i], "\\script\\task\\killer\\monster_fight.lua");
		SetNpcLifeTime(argMonsterID[i],600);
	end;

end;

--产生毒气损失当前2/3HP
function CreateGas()

local nlife = floor(GetLife()/2);

	 ModifyLife(nlife);
	 Msg2Player("宝藏地点突然冒出一股毒烟!");
	 --赋一个中毒魔法给玩家（"魔法字符串",伤害,持续时间）
	 CastState("state_poison_damage",nlife/360,1080);

end;

--奖励金钱:平均价格6.5G
function PayMoney()

local nLuck = random(1,100);

	if nLuck <= 47 then
		Earn(50000);
	elseif nLuck > 47 and nLuck <= 72 then
		Earn(10000);
	elseif nLuck > 72 and nLuck <= 82 then
		Earn(5000);
	elseif nLuck > 82 and nLuck <= 87 then
		Earn(1000);
	elseif nLuck > 87 and nLuck <= 95 then
		Earn(100000); 	
	elseif nLuck > 95 and nLuck <= 99 then
		Earn(500000);
	else
		Earn(1000000);
		
	end;	

end;

--奖励未鉴定装备
function PayEquip(nNum)
local i = 0;
local nRow = 0;
local nGenre = 0;
local nDetail = 0;
local nParticular = 0;

	for i=1,nNum do
		 
		nRow = random(3,tabEquip:getRow());
		nGenre = tonumber(tabEquip:getCell(nRow,"Genre"));
		nDetail = tonumber(tabEquip:getCell(nRow,"Detail"));
		nParticular = tonumber(tabEquip:getCell(nRow,"Particular"));

		AddItem(nGenre,nDetail,nParticular,1,1,-1,-1,-1,-1,-1,-1);

	end;
	
end;

SecretItem = {
	--龙骨
	[1] = {2,1,116},
	--尸王肋骨
	[2] = {2,1,118},
	--苍狼牙
	[3] = {2,1,113},
	--雷炎金沙
	[4] = {2,1,146},
	--防水油绸
	[5] = {2,1,114},
	--天衣无缝
	[6] = {2,1,147},
	--墨油
	[7] = {2,1,136},
	--染料
	[8] = {2,1,153},		
}