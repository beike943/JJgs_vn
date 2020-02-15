-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务杀手令牌文件(相关Npc:襄阳卓天行)                  
-- Edited by starry night                                 
-- 2005/09/15 PM 9:27                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\task\\killer\\cangbaotu_head.lua");

function main()

	Say("有什么需要帮忙的?",
			2,
			"晚辈这里有个令牌,请前辈给看看/Task_Check",
			"没什么事/Task_Exit");
			
end;
			

function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --判断杀手令数量
		Say("Зy l?l謓h b礽 s竧 th?nh蕋 ph萴 阯g T﹜ H? b猲 trong c?ch鴄 nhi襲 甶襲 th莕 b?trong ch鑓 l竧 kh玭g th?gi秈 th輈h h誸 頲.",
				2,
				"5金,请您鉴定一下/Task_Confirm",
				"先不了/Task_Exit");
	else
		Say("你身上也没有令牌啊,别逗我了!",0);
	end;
		
end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>卓天行<color>:",
						   "L謓h b礽 n祔 xem ra ch糿g c?g?c bi謙.",
						   "Ta c?m閠 輙 th竛h dc 甶 l筰 trong giang h?r蕋 c莕 thi誸, t苙g ngi xem nh?kh玭g u鑞g c玭g c馻 ngi v藋.",
						   " t?ti襫 b鑙"}
					
local str2 = { "<color=green>卓天行<color>:",
						 	 "B猲 di l謓h b礽 c?萵 ch鴄 m閠 b秐 v? b猲 tr猲 m韎 ch?l?nh鱪g k?hi謚",
               "K?hi謚?",
               "<color=yellow>T祅g B秓 у<color> do ngi mang n 琻g nhi猲l?ph秈 tr?l筰 cho ngi r錳. N鉯 th藅 ta gi?r錳 c騨g kh玭g c遪  s鴆  甶 qu穘g 阯g d礽 nh?v藋.",
						   " t?ti襫 b鑙 ch?gi竜!"}
						 
local str3 = { "<color=green>卓天行<color>:",
							 "?y c遪 c?<color=yellow>Ph竜 hoa truy襫 tin<color>厖",
							 "Ph竜 hoa truy襫 tin?",
							 "Зy l?v藅 ph萴 m?Nh蕋 Ph萴 Л阯g S竧 Th?hay s?d鬾g, ch?c莕 ra ngo礽 th祅h t l猲 th?s?c?S竧 th?u m鬰 n ti誴 鴑g. Ngi nh﹏ c?h閕 n祔 tr?h筰 cho i T鑞g.",
							 " t?ti襫 b鑙 ch?gi竜!"}

	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then
			
				n = random(1,100);

				if n <= 35 then --35％得到玉灵散10个
					TalkEx("",str1);
					--AwardMedicine();
					AddItem(1,0,14,10,1);
				elseif n > 35 and n <= 50 then --15%得到五花玉露丸5个				
					AddItem(1,0,15,5,1);
				elseif n > 50 and n <= 65 then --15%得到生生造化散5个				
					AddItem(1,0,16,5,1);	
				elseif n > 65 and n <= 95 then --30％得到一张藏宝图
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);		
				else --5％获取一个顶级杀手传信烟火					
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;	 
			end;
	else
		
		Say("Ti襫 c馻 ngi u?",0);
	
	end;
	
end;