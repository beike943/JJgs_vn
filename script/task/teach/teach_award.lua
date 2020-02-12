
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务奖励发放文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================
Include("\\script\\task\\world\\task_award.lua")

Teach_Award_List = {

	Award_01 = {
		strAwardType = "дn g苝 D?T萿",
		funAwardGive = function()
			Earn(100);
			ModifyExp(20);
			ModifyReputation(20,0);
		end,
	},
	
	Award_02 = {
		strAwardType = "Ch?Ti謒 v?kh",
		funAwardGive = function()
			AddItem(0,0,1,1,1,2,77);
			GivePlayerExp(SKeyXinShou,"wuqidian")
			Msg2Player("你得到1件武器");
		end,
	},
	
	Award_03 = {
		strAwardType = "Ch?ti謒 trang ph鬰",
		funAwardGive = function()
			local i=GetBody();
			if i==1 then 
				AddItem(0,100,1,1,1,2,94);
			elseif i==2 then
				AddItem(0,100,19,1,1,2,94);
			elseif i==3 then
				AddItem(0,100,37,1,1,2,94);
			else
				AddItem(0,100,55,1,1,2,94);
			end
			Earn(100);
			GivePlayerExp(SKeyXinShou,"fuzhuangdian")
			ModifyReputation(4,0);
		end,
	},
	
	Award_04 = {
		strAwardType = "Ch?Kim ho祅",
		funAwardGive = function()
		    local i = GetBody();
		    if i==1 or i==2 then
			    AddItem(0,102,101,1,1,2,95,2,98);
			else
			    AddItem(0,102,102,1,1,2,95,2,98);
			end;
			GivePlayerExp(SKeyXinShou,"shipindian")
			Msg2Player("您获得一件装备!");
		end,
	},
	
	Award_05 = {
		strAwardType = "Ch?Dc 甶誱",
		funAwardGive = function()
			AddItem(1,0,2,20,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"yaodian")
			Msg2Player("您将获得20个金疮药");
		end,
	},
	
	Award_06 = {
		strAwardType = "Ch?T筽 h鉧",
		funAwardGive = function()
			AddItem(2,5,1,2,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"zahuodian")
			Msg2Player("您会获得2鉴定符！");
		end,
	},

	Award_07 = {
		strAwardType = "V?binh th祅h m玭",
		funAwardGive = function()
			Earn(50);
			GivePlayerExp(SKeyXinShou,"chengmenweibin")
			ModifyReputation(4,0);
		end,
	},
	
	Award_08 = {
		strAwardType = "V?s",
		funAwardGive = function()
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"wushi")
		end,
	},

	Award_09 = {
		strAwardType = "Ch?t鰑 l莡",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"jiulou")
			Earn(100);
			ModifyReputation(4,0);
		end,
	},
	
	Award_10 = {
		strAwardType = "Ti猽 s",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"biaoshi")
			ModifyReputation(4,0);
			Earn(100);
		end,
	},
	
	Award_11 = {
		strAwardType = "trao i nhi謒 v?v韎 ngi kh竎",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(4,0)
			GivePlayerExp(SKeyXinShou,"yeshou2")
		end,
	},
	
	Award_12 = {
		strAwardType = "Nhi謒 v?k誸 giao h秓 h鱱",
		funAwardGive = function()
			local nPreservedPlayerIndex = PlayerIndex
			local nMemCount = GetTeamSize()
			local z=GetBody();
			
			local nGoods = {
				{0,2,15},
				{0,5,28},
				{0,1,41},
				{0,0,2}
			}
			
			if (nMemCount == 0) then -- 如果玩家到这一步未组队，则返回
				return
			elseif (nMemCount == 1) then --如果玩家单人组队完成任务
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			else
				
				for i=1,nMemCount do
					PlayerIndex = GetTeamMember(i)
					local i=random(getn(nGoods));
					
					AddItem(nGoods[i][1],nGoods[i][2],nGoods[i][3],1,1);
					ModifyExp(100);			
					Msg2Player("您获得一件装备!");
				end;
			
			if z==1 then 
				AddItem(0,100,2,1,1,4,45);
			elseif z==2 then
				AddItem(0,100,20,1,1,4,45);
			elseif z==3 then
				AddItem(0,100,38,1,1,4,45);
			else
				AddItem(0,100,56,1,1,4,45);
			end
				
				PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			end;
			
		end,
	},
	
	Award_13 = {
		strAwardType = "Hi觰 v?c竎 m玭 ph竔",
		funAwardGive = function()
		    
		    local i=GetBody();
			if i==1 then 
				AddItem(0,103,2,1,1,2,11);
			elseif i==2 then
				AddItem(0,103,20,1,1,2,11);
			elseif i==3 then
				AddItem(0,103,38,1,1,2,11);
			else
				AddItem(0,103,56,1,1,2,11);
			end
		
			Earn(100);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"menpaiwenti")
	end,
	},

	Award_14 = {
		strAwardType = "B竎h Hi觰 Sinh nh薾 x衪 v?m玭 ph竔",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(2,0);
		end,
	},

	Award_15 = {
		strAwardType = "Chuy謓 giang h",
		funAwardGive = function()
		    
		    local i=GetBody();
			if i==1 then 
				AddItem(0,101,2,1,1,2,12);
			elseif i==2 then
				AddItem(0,101,20,1,1,2,12);
			elseif i==3 then
				AddItem(0,101,38,1,1,2,12);
			else
				AddItem(0,101,56,1,1,2,12);
			end
		
			Earn(100);
			GivePlayerExp(SKeyXinShou,"yeshou4")
			ModifyReputation(4,0);
		end,
	},
};

-- 给玩家发奖励，传入奖励的表，如果表为空，则直接读取默认的 Teach_Award_List
function GivePlayerAward_Teach(strAward, aryAward)

	if aryAward==nil or type(aryAward) ~= "table" then
		aryAward = Teach_Award_List;
	end;

	local i,j
		for i,j in aryAward do
			if j.strAwardType==strAward then
				j:funAwardGive();
				return 1;
			end;
		end;

	return 0;
	
end;