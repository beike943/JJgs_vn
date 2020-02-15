-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 藏宝图脚本                  
-- Edited by starry night                                 
-- 2005/10/15 PM 10:02                                    
                                                          
-- ======================================================

--引用藏宝图头文件
Include("\\script\\task\\killer\\cangbaotu_head.lua");

--五一活动帽子奖励
LABOR_CAP = {
	{0,103,17},	
	{0,103,18},
	{0,103,35},
	{0,103,36},
	{0,103,53},
	{0,103,54},
	{0,103,71},
	{0,103,72}
	}

function OnUse(nParticular)

	local nParticular = tonumber(nParticular);
	local nRow = tabPos:selectRowNum("PosID",nParticular);
	local nMapName = tabPos:getCell(nRow,"MapName");
	local nMapID = tonumber(tabPos:getCell(nRow,"MapID"));
	local nZone = 20;--控制范围
	local nWx1 = tonumber(tabPos:getCell(nRow,"WorldX"))+nZone;
	local nWx2 = tonumber(tabPos:getCell(nRow,"WorldX"))-nZone;
	local nWy1 = tonumber(tabPos:getCell(nRow,"WorldY"))+nZone;
	local nWy2 = tonumber(tabPos:getCell(nRow,"WorldY"))-nZone;
	local nMx = tabPos:getCell(nRow,"MapX");
	local nMy = tabPos:getCell(nRow,"MapY");
	local nPosID,nPx,nPy = GetWorldPos();
	local i,m = 0,0;

	if nPosID == nMapID and nPx >= nWx2 and nPx <= nWx1 and nPy >= nWy2 and nPy <= nWy1 then
		DelItem(2,14,nParticular,1,1);
		local nLuck = random(1,100);
		--15%挖出5金
		if nLuck <= 15 then
			Earn(50000);
		--60%挖出怪物
		elseif nLuck > 15 and nLuck <= 75 then
			CreateMonster();
		--10%挖出毒气
		elseif nLuck > 75 and nLuck <= 85 then
			CreateGas();
		--14%挖出随机3个神秘物品
		elseif nLuck > 85 and nLuck <= 99 then
			for i=1,3 do
				m = random(1,getn(SecretItem));
				AddItem(SecretItem[m][1],SecretItem[m][2],SecretItem[m][3],1,1);
			end
		else--1%五一劳动帽子
			i = random(1,getn(LABOR_CAP));
			AddItem(LABOR_CAP[i][1],LABOR_CAP[i][2],LABOR_CAP[i][3],1,1,2,random(131,132),2,102,-1,-1);
		end;
		
		--100%获得西北关卡门票
		local nNum = random(1,100);
		if nNum <= 26 then
			AddItem(2,0,1031,1);
			Msg2Player("碧瑶清心丹");
		elseif nNum <= 53 then
			AddItem(2,0,1032,1);
			Msg2Player("回龙索");			
		elseif nNum <= 80 then
			AddItem(2,0,1034,1);
			Msg2Player("烈阳精华");
		elseif nNum <= 85 then
			AddItem(2,0,1033,1);
			Msg2Player("碎石震");
		elseif nNum <= 90 then
			AddItem(2,0,1035,1);
			Msg2Player("五行旗幡");
		elseif nNum <= 95 then
			AddItem(2,0,1036,1);
			Msg2Player("磁沙罗盘");
		else
			AddItem(2,0,1037,1);
			Msg2Player("龙门宴请柬");
		end
		
	else
		Say("<color=yellow>"..nMapName.."  "..nMx.." "..nMy.."<color>",0);		
	end;
end;
