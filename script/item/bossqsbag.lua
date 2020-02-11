-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII Boss包裹脚本                  
-- Edited by Starry                                 
-- 2005/11/21 PM 15:56                                    
                                                          
-- ======================================================
function OnUse()

local i = 0;
local j = 0;
local nCount = 0;
local nLuckyNum = 0;
	DelItem(2,1,200,1,1);

	--50%出金锡
	if random(1,100) <= 50 then
		AddItem(2,1,149,1,1);
	end;
	
	--50%出陨铁
	if random(1,100) <= 50 then
		AddItem(2,2,8,1,1);
	end;
	
	--50%出陨铁碎片
	if random(1,100) <= 50 then
		AddItem(2,2,7,1,1);
	end;
		
	--50%出小块金锡
	if random(1,100) <= 50 then
		AddItem(2,1,148,1,1);
	end;
		
	--10%出龙骨
	if random(1,100) <= 10 then
		AddItem(2,1,116,1,1);
	end;
		
	--10%出醉仙菊
	if random(1,100) <= 10 then
		AddItem(2,1,117,1,1);
	end;
			
	--10%出尸王肋骨
	if random(1,100) <= 10 then
		AddItem(2,1,118,1,1);
	end;
	
	--10%出苍狼牙
	if random(1,100) <= 10 then
		AddItem(2,1,113,1,1);
	end;
	
	--10%出雷炎金沙
	if random(1,100) <= 10 then
		AddItem(2,1,146,1,1);
	end;			
	
	--10%出防水油绸
	if random(1,100) <= 10 then
		AddItem(2,1,114,1,1);
	end;		
	
	--10%出天衣无缝
	if random(1,100) <= 10 then
	  AddItem(2,1,147,1,1);
	end;
	
	--10%出墨油
	if random(1,100) <= 10 then
	  AddItem(2,1,136,1,1);
	end;
	
	--10%出染料
	if random(1,100) <= 10 then
	  AddItem(2,1,153,1,1);
	end;
	
	--10%出装备
	if random(1,100) <= 10 then
	
		for i=1,getn(BossBagData) do
			nCount = nCount + BossBagData[i][1];
		end;
		
		nLuckyNum = random(1,nCount);
		nCount = 0;
		
		for i=1,getn(BossBagData) do
			nCount = nCount + BossBagData[i][1];
			if nCount>=nLuckyNum then
				j = random(2,3);
				return AddItem(BossBagData[i][j][1],BossBagData[i][j][2],BossBagData[i][j][3],BossBagData[i][j][4],BossBagData[i][j][5],BossBagData[i][j][6],BossBagData[i][j][7],BossBagData[i][j][8],BossBagData[i][j][9],BossBagData[i][j][10],BossBagData[i][j][11]);					
			end;
		end;
	end;
end;

BossBagData = {
	--5级香囊,5级玉佩：反弹伤害15%
	[1] = {390,{0,102,5,1,1,7,2,0,0,0,0},{0,102,10,1,1,7,2,0,0,0,0}},
	--5级护身符,5级戒指:力量13、根骨13、身法13
	[2] = {200,{0,102,15,1,1,5,95,5,94,5,96},{0,102,20,1,1,5,98,5,94,5,97}},
	--5级护身符,5级戒指:内功13、根骨13、洞察13
	[3] = {200,{0,102,15,1,1,5,98,5,94,5,97},{0,102,20,1,1,5,98,5,94,5,97}},
	--5级护身符,5级戒指：洞察13、身法13、根骨13	
	[4] = {200,{0,102,15,1,1,5,97,5,96,5,94},{0,102,20,1,1,5,97,5,96,5,94}},
	--5级护身符,5级戒指：减需求2
	[5] = {10,{0,102,15,1,1,2,109,0,0,0,0},{0,102,20,1,1,2,109,0,0,0,0}},	
}