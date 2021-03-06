
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 挂机地图进入脚本头文件
-- Edited by peres
-- 2005/07/18 PM 14:55

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================


RES_MAPID = 120;
RES_MAPX  = 121;
RES_MAPY  = 122;


aryLifePos = {

	-- 深山，伐木技能传送点
	[1] = {{707,1436,3045},
		   {707,1591,3097},
		   {707,1567,2853},
			},
	
	-- 深山，制皮技能传送点
	[2] = {{707,1436,3045},
		   {707,1591,3097},
		   {707,1567,2853},
			},
	
	-- 农田，收耕技能传送点
	[3] = {{704,1376,3168},
		   {704,1383,2939},
		   {704,1522,2961},
			},

	-- 农田，采药技能传送点
	[4] = {{704,1376,3168},
		   {704,1383,2939},
		   {704,1522,2961},
			},

	-- 矿坑，挖矿技能传送点
	[5] = {{705,1381,3183},
		   {705,1594,2925},
		   {705,1391,2918},
			},

	-- 树丛，抽丝技能传送点
	[6] = {{706,1444,2915},
		   {706,1541,2928},
		   {706,1441,3118},
			},
}

-- 每张地图对应的技能
aryLifeMapSkill = {
	[704] = {3,4},
	[705] = {5},
	[707] = {1,2},
	[706] = {6}
}


-- 打开当前挂机地图所需要对应的状态
function openLifeState(nMapID)

local i=0;

	for i=1, getn(aryLifeMapSkill[nMapID]) do
		if GetLifeSkillLevel(aryLifeMapSkill[nMapID][i],0)>0 then
			-- 设置可以使用挂机技能
			SetTask(1922,nMapID)
			if	SubWorldID2Idx(nMapID) >= 0 then
				SetCanUseGather(1)
			end
		end
	end
	
	-- 设置已经进入了挂机地图
	SetInGatherMap(1)
end

-- 清楚挂机地图的所有状态
function clearLifeState()

	SetCanUseGather(0)
	SetTask(1922,0)
	SetInGatherMap(0)
	
end