-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 三级杀手包裹脚本                  
-- Edited by Starry                                 
-- 2005/12/5 PM 14:09                                    
                                                          
-- ======================================================
function OnUse()

local i = 0;
local j = 0;
local k = 0; 
local nCount = 0;
local nLuckyNum = 0;
local nNum = 0; 

	DelItem(2,1,207,1,1);
	
	--100%出高级药品:3个九转
	--AddItem(1,0,32,3,1);
	
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
	
	--14%出神秘物品
	if random(1,100) <= 14 then
		local m = random(1,getn(SecretItem));
			AddItem(SecretItem[m][1],SecretItem[m][2],SecretItem[m][3],1,1);
	end; 
	
	nNum = random(1,1000);
	--20.3%出定制装备
	if nNum <= 203 then
	
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
		end;
		
		nLuckyNum = random(1,nCount);
		nCount = 0;
		
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
			if nCount>=nLuckyNum then
				k = getn(KillerBagData[i]);
				j = random(2,k);
				return AddItem(KillerBagData[i][j][1],KillerBagData[i][j][2],KillerBagData[i][j][3],KillerBagData[i][j][4],KillerBagData[i][j][5],KillerBagData[i][j][6],KillerBagData[i][j][7],KillerBagData[i][j][8],KillerBagData[i][j][9],KillerBagData[i][j][10],KillerBagData[i][j][11]);					
			end;
		end;
	end;
	
end;

KillerBagData = {
	--5级护身,5级戒指:经验提高3%;
	[1] = {14,{0,102,5,1,1,2,99,0,0,0,0},{0,102,15,1,1,2,99,0,0,0,0}},
	--5级护身,5级戒指:减需求2
	[2] = {29,{0,102,5,1,1,2,109,0,0,0,0},{0,102,15,1,1,2,109,0,0,0,0}},
	--40级武器,5级护身,5级戒指:力量13	根骨13	身法13;内功13	根骨13	洞察13;洞察13	身法13	根骨13
	[3] = {51,{0,102,5,1,1,5,95,5,94,5,96},
						{0,102,15,1,1,5,95,5,94,5,96},
						{0,102,5,1,1,5,98,5,94,5,97},
						{0,102,15,1,1,5,98,5,94,5,97},
						{0,102,5,1,1,5,97,5,96,5,94},
						{0,102,15,1,1,5,97,5,96,5,94},
						{0,0,8,1,1,3,86,4,98,2,64},
						{0,2,21,1,1,3,86,4,98,2,64},
						{0,0,8,1,1,3,85,4,95,2,63},
						{0,1,47,1,1,3,85,4,96,2,63},
						{0,9,80,1,1,3,85,4,97,2,63},
						{0,2,21,1,1,5,42,4,98,1,99},
						{0,10,69,1,1,3,86,4,98,2,64},
						{0,8,91,1,1,3,86,4,98,2,64},
						{0,5,34,1,1,3,85,4,95,2,63},
						{0,3,58,1,1,3,85,4,95,2,63},
						{0,6,102,1,1,3,85,4,95,2,63},
						{0,4,113,1,1,3,85,4,96,2,63},
						{0,11,6,1,1,3,86,4,98,2,64},
						{0,7,6,1,1,3,85,4,96,2,63},
					},
	}

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
