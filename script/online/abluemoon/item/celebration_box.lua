--剑侠情缘盒
--authored by pengbo
--==========================================任务变量===========================================
ABLUEMOON_KEEP_XOYO = 638; --剑侠情缘盒是否存入了逍遥盒
ABLUEMOON_KEEP_MOON = 639; --剑侠情缘盒是否存入了月亮盒
EASTER_EGG = 819  --彩蛋记录，
CELECLOTH_ALREADY = 802  --记录是否存入剑网2两周年庆外装
NEWYEARCLOTH_ALREADY = 803 --记录是否存入2007年新年装
MATCHERCLOTH_ALREADY = 804 --记录是否存入主婚人外装
CHAOHUA_ALREADY = 816 --记录是否存入朝华外装,1代表存入朝华装，0代表没存入
XINYUAN_ALREADY = 817 --记录是否存入新元外装,1代表存入新元装，0代表没存入
XIANYU_ALREADY = 818 --记录是否存入纤羽外装,1代表存入纤羽装，0代表没存入
PAPACLOTH_ALREADY = 820 --记录是否存入趴趴客栈外装,1代表存入,0代表没有存入

tTask = {803,804,816,817,818,820}

--2005年圣诞装
tXmas = {     --头,上衣,裤子
          --标准男
					{{108,109},{109,109},{110,73}},
					--魁梧男
					{{108,110},{109,110},{110,74}},
					--性感女
					{{108,112},{109,112},{110,76}},
					--娇小女
					{{108,111},{109,111},{110,75}}
				}

--2007年元旦装
tYuandan7 = {     --头,上衣,裤子
          --标准男
					{{108,139},{109,185},{110,81}},
					--魁梧男
					{{108,140},{109,186},{110,82}},
					--性感女
					{{108,141},{109,187},{110,83}},
					--娇小女
					{{108,142},{109,188},{110,84}}
				}

--2007年新年装
tNewyear7 = {     --头,上衣,裤子
          --标准男
					{{108,195},{109,255},{110,85}},
					--魁梧男
					{{108,196},{109,256},{110,86}},
					--性感女
					{{108,197},{109,257},{110,87}},
					--娇小女
					{{108,198},{109,258},{110,88}}
				}

--剑网2两周年庆外装				
tCele2cloth = {     --头,上衣,裤子
          --标准男
					{{108,135},{109,181},{110,77}},
					--魁梧男
					{{108,136},{109,182},{110,78}},
					--性感女
					{{108,137},{109,183},{110,79}},
					--娇小女
					{{108,138},{109,184},{110,80}}
				}
				
--2006年新年装				
tNewyear6 = {     --一套
          --标准男
					{109,113},
					--魁梧男
					{109,114},
					--性感女
					{109,116},
					--娇小女
					{109,115}
				}
				
--主婚人外装
tMatchercloth = {    --一套
          --标准男
					{109,241},
					--魁梧男
					{109,242},
					--性感女
					{109,243},
					--娇小女
					{109,244}
				}

--新元外装
tXinyuan = {     --一套
					--标准男
					{109,495},
					--魁梧男
					{109,496},
					--性感女
					{109,497},
					--娇小女
					{109,498}
				}
				
--朝华外装
tChaohua = {		--一套
					--标准男	
					{109,499},
					--魁梧男
					{109,500},
					--性感女
					{109,501},
					--娇小女
					{109,502}		
				}
				
--纤羽外装
tXianyu = {				--男一套，女三件
					--标准男	
					{109,505},
					--魁梧男
					{109,506},
					--性感女
					{{108,485},{109,503},{110,225}},
					--娇小女
					{{108,486},{109,504},{110,226}}
				}

--趴趴外装
tPapaCloth = {
				--标准男
				{{108,510},{109,510},{110,510}},
				--魁梧男
				{{108,511},{109,511},{110,511}},
				--性感女
				{{108,513},{109,513},{110,513}},
				--较小女
				{{108,512},{109,512},{110,512}}
			}
				

tAllcloth = {{tNewyear7,"2007年新年装外装"},{tMatchercloth,"主婚人外装"}}		

tAlreadyput = {{"我想存入2007年新年装外装/#PutClothInBox(1)","我想取出2007年新年装外装"},
							 {"我想存入主婚人外装/#PutClothInBox(2)","我想取出主婚人外装"},
							 {"我想存入朝华外装/#PutClothInBox(3)","我想取出朝华外装"},
							 {"我想存入新元外装/#PutClothInBox(4)","我想取出新元外装"},
							 {"我想存入纤羽外装/#PutClothInBox(5)","我想取出纤羽外装"},
							 {"我想存入趴趴客栈外装/#PutClothInBox(6)","我想取出趴趴客栈外装"}
							}

tRouteCloth = {--少林 武当 峨嵋 丐帮 唐门 杨门 五毒
	{{0,108,73,0,109,73},{0,108,77,0,109,77}},
	{{0,108,74,0,109,74},{0,108,78,0,109,78},{0,108,82,0,109,82},{0,108,86,0,109,86}},
	{{},{},{0,108,81,0,109,81},{0,108,85,0,109,85}},--峨嵋 前两个为空
	{{0,108,75,0,109,75},{0,108,79,0,109,79},{0,108,83,0,109,83},{0,108,87,0,109,87}},
	{{0,108,76,0,109,76},{0,108,80,0,109,80},{0,108,84,0,109,84},{0,108,88,0,109,88}},
	{{0,108,105,0,109,105},{0,108,106,0,109,106},{0,108,107,0,109,107},{0,108,108,0,109,108}},
	{{0,108,123,0,109,125},{0,108,124,0,109,126},{0,108,125,0,109,127},{0,108,126,0,109,128}}
	}

		
function OnUse()
	local easter_egg = GetTask(EASTER_EGG)
	if easter_egg == 1 or easter_egg == 0 then 
		Talk(1,"main","<color=green>剑侠情缘盒<color>：还在为你背包里的趴趴客栈外装无处可放操心吗?现在可以存放进盒子里啦!存入任何一件就能领取一套哦!")
    SetTask(EASTER_EGG,2)	
	else return main()
	end
end

function main()
	local tSay = {
		"我要领取剑侠情缘盒赠送的外装/GetDefaultCloth",
		"我要领取存入的外装/GetOutCloth",
		"我要存取逍遥盒或者月亮盒/get_two_box",
		"我要领取门派外装/get_route_cloth",
		"我想了解剑侠情缘盒有什么用处/AboutBox",
		"关闭剑侠情缘盒/Leave"
	}
	local cloth_put = 0
	local insert_flag = 0
	for i = 1,6 do 
		cloth_put = GetTask(tTask[i])
		if cloth_put == 0 then
			insert_flag = insert_flag + 1
		end
	end
	if insert_flag > 0 then 
		tinsert(tSay,2,"我要将自己的外装装进剑侠情缘盒里/PutInBox")
	end
	Say("<color=green>剑侠情缘盒<color>：这位大侠，你需要什么帮助？",getn(tSay),tSay);
end

function GetDefaultCloth()
  local sSay = {
  			"我想要2005年圣诞套外装/GiveXmas",
  			"我想要2006年新年装外装/#GiveNewyear(1)",
  			"我想要2007年元旦装外装/#GiveNewyear(2)",
  			"我再考虑一下/end_say"
  			}
  Say("<color=green>剑侠情缘盒<color>：大侠想要哪种套装?请随意挑选:",getn(sSay),sSay)
 end

function GiveXmas()
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("你的背包空间不足,请整理后再来领取!",0)
	return
  end
  for i=1,3 do
  	AddItem(0,tXmas[player_sex][i][1],tXmas[player_sex][i][2],1)
  end
end
	
function GiveNewyear(nYear)
	local player_sex = GetBody()
  if nYear == 1 then
  	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
  		Say("<color=green>剑侠情缘盒<color>：你的背包空间不足,请整理后再来领取!",0)
  		return
  	end
  	AddItem(0,tNewyear6[player_sex][1],tNewyear6[player_sex][2],1)
  elseif nYear == 2 then
  	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
			Say("<color=green>剑侠情缘盒<color>：你的背包空间不足,请整理后再来领取!",0)
			return
  	end
  	for i =1,3 do
  		AddItem(0,tYuandan7[player_sex][i][1],tYuandan7[player_sex][i][2],1)
    end
  end
end

function end_say()
  return main()
end

function PutInBox()
	local player_sex = GetBody()
	local putAlready = 0
	local tSay = {}
	for i = 1,6 do
		putAlready = GetTask(tTask[i])
		if putAlready == 0 then
			tinsert(tSay,tAlreadyput[i][1])
		end
	end
	tinsert(tSay,"我不想存入任何外装/end_say")
	Say("<color=green>剑侠情缘盒<color>：大侠想存入哪些外装呢？",getn(tSay),tSay)
end

function PutClothInBox(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if nIndex < 2 then
		if GetItemCount(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2]) > 0 then
			DelItem(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2],1)
			Msg2Player("你已经将"..tAllcloth[nIndex][2].."存入到剑侠情缘盒里了！")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2],1)
    	Msg2Player("你已经将"..tAllcloth[nIndex][2].."存入到剑侠情缘盒里了！")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2],1)
    	Msg2Player("你已经将"..tAllcloth[nIndex][2].."存入到剑侠情缘盒里了！")
    	SetTask(tTask[nIndex],1)	
    else
    	Say("<color=green>剑侠情缘盒<color>：你的背包里并没有"..tAllcloth[nIndex][2].."中任何一件,请检查后再存入宝盒中！",0)
    end
	elseif nIndex == 2 then
			if DelItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1) ~= 1 then
				Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套主婚人外装,请检查后再存入宝盒中！",0)
		  else 
		  	Msg2Player("你已经将主婚人外装存入到剑侠情缘盒里了！")
				SetTask(MATCHERCLOTH_ALREADY,1)
		  end
	elseif nIndex == 3 then
			if DelItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1) ~= 1 then
				 Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套朝华外装,请检查后再存入宝盒中！",0)
			else 
		  	Msg2Player("你已经将朝华外装存入到剑侠情缘盒里了！")
		  	SetTask(CHAOHUA_ALREADY,1)
		  end
	elseif nIndex == 4 then
			if DelItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1) ~= 1 then
				 Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套新元外装,请检查后再存入宝盒中！",0)
			else 
		  	Msg2Player("你已经将新元外装存入到剑侠情缘盒里了！")
		  	SetTask(XINYUAN_ALREADY,1)
		  end
	elseif nIndex == 5 then
			if player_sex < 3 then
				 if DelItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1) ~= 1 then
				 		Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套纤羽外装,请检查后再存入宝盒中！",0)
				 else 
				 		Msg2Player("你已经将纤羽外装存入到剑侠情缘盒里了！")
		  			SetTask(XIANYU_ALREADY,1)
		  	 end
		  else
		  		if GetItemCount(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2],1)
		  			 Msg2Player("你已经将纤羽外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2],1)
		  			 Msg2Player("你已经将纤羽外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2],1)
		  			 Msg2Player("你已经将纤羽外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    			else
				 		Say("<color=green>剑侠情缘盒<color>：你的背包里并没有纤羽外装中的任何一件,请检查后再存入宝盒中！",0)    				
    			end
    	end
	elseif nIndex == 6 then
			if GetItemCount(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2],1)
		  			 Msg2Player("你已经将趴趴客栈外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2],1)
		  			 Msg2Player("你已经将趴趴客栈外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2],1)
		  			 Msg2Player("你已经将趴趴客栈外装存入到剑侠情缘盒里了！")
    				 SetTask(tTask[nIndex],1)
    		else
				 		Say("<color=green>剑侠情缘盒<color>：你的背包里并没有趴趴客栈外装中的任何一件,请检查后再存入宝盒中！",0)    				
    		end
	end
end
		
function GetOutCloth()
	local player_sex = GetBody()
	local tSay = {}
	local i1 = GetTask(CELECLOTH_ALREADY)
	local i2 = GetTask(NEWYEARCLOTH_ALREADY)
	local i3 = GetTask(MATCHERCLOTH_ALREADY)
	local i4 = GetTask(CHAOHUA_ALREADY)
	local i5 = GetTask(XINYUAN_ALREADY)
	local i6 = GetTask(XIANYU_ALREADY)
	local i7 = GetTask(PAPACLOTH_ALREADY)
	if i1 == 1 then
			tinsert(tSay,"我想取出剑网2周年庆外装/#GetCloth(1)")
	end
	if i2 == 1 then
		 tinsert(tSay,"我想取出2007年新年装外装/#GetCloth(2)")
	end
	if i3 == 1 then
		 tinsert(tSay,"我想取出主婚人外装/#GetCloth1(1)")
	end
	if i4 == 1 then
		 tinsert(tSay,"我想取出朝华外装/#GetCloth1(2)")
	end
	if i5 == 1 then
		 tinsert(tSay,"我想取出新元外装/#GetCloth1(3)")
	end
	if i6 == 1 then
		 tinsert(tSay,"我想取出纤羽外装/#GetCloth(3)")
	end
	if i7 == 1 then
		tinsert(tSay,"我想取出趴趴客栈外装/#GetCloth(4)")
	end
	if i1 == 0 and i2 == 0 and i3 == 0 and i4 == 0 and i5 == 0 and i6 == 0 and i7 == 0 then 
		Say("<color=green>剑侠情缘盒<color>：你还没有存入任何外装,只有存入外装以后才能领取!",0)
	else
		tinsert(tSay,"我不想取出任何外装/end_say")
		Say("<color=green>剑侠情缘盒<color>：大侠要取出哪件外装?",getn(tSay),tSay)
	end
end

function GetCloth(nIndex)
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("你的背包空间已经装不下了，先整理一下再来吧！",0)
    return	
	end
	if nIndex == 1 then
		for i =1,3 do
			AddItem(0,tCele2cloth[player_sex][i][1],tCele2cloth[player_sex][i][2],1)
		end
	elseif nIndex ==2 then
		for i =1,3 do
			AddItem(0,tNewyear7[player_sex][i][1],tNewyear7[player_sex][i][2],1)
		end
	elseif nIndex == 3 then
		if player_sex < 3 then
			AddItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1)
		else
			for i =1,3 do
				AddItem(0,tXianyu[player_sex][i][1],tXianyu[player_sex][i][2],1)
			end
		end
	elseif nIndex == 4 then 
		for i = 1,3 do 
			AddItem(0,tPapaCloth[player_sex][i][1],tPapaCloth[player_sex][i][2],1)
		end
	end
end

function GetCloth1(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("你的背包空间已经装不下了，先整理一下再来吧！",0)
    return	
	end
	if nIndex == 1 then 
		AddItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1)
	end
	if nIndex == 2 then
		AddItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1)
	end
	if nIndex == 3 then
		AddItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1)
	end
end
		

function AboutBox()
	Say("<color=green>剑侠情缘盒<color>:打开该宝盒可以免费获取圣诞外装、元旦外装、新年外装。同时，你也可以在盒子里存入与自己体形相符合的2007年新年装、剑网2两周年庆外装其中的任何一件、主婚人外装、朝华、新元、纤羽外装、月亮盒和逍遥盒；在存入后就可以免费获取这些存入的物品！",
		1,
		"我了解了/end_say")
end

function Leave()

end

function get_two_box()
	local strtab = {
		"我要存入逍遥盒/#get_xoyo_box(1)",
		"我要取出逍遥盒/#get_xoyo_box(2)",
		"我要存入月亮盒/#get_xoyo_box(3)",
		"我要取出月亮盒/#get_xoyo_box(4)",
		"返回/main",
		"没事/Leave"	
		}
	Say("<color=green>剑侠情缘盒<color>：这位大侠，我最近可以存取逍遥盒和月亮盒了，多方便啊。",
		getn(strtab),
		strtab)	
end

function get_xoyo_box(nType)
	if nType < 1 or nType > 4 then
		return 
	end
	if nType == 2 or nType == 4 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你的背包空间已经装不下了，先整理一下再来吧！")
	    return	
		end	
	end
	if nType == 1 then
		if GetItemCount(2,1,1168) < 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你身上没有逍遥盒啊。");
			return
		else
			if DelItem(2,1,1168,1) == 1 then
				SetTask(ABLUEMOON_KEEP_XOYO,1);
				Talk(1,"","<color=green>剑侠情缘盒<color>：你的逍遥盒存入，你随时可以通过剑侠情缘盒取出。");
				return
			end
		end
	elseif nType == 2 then
		if GetTask(ABLUEMOON_KEEP_XOYO) ~= 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你没有逍遥盒在我这里哦。");
			return
		end
		if BigGetItemCount(2,1,1168) >= 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你不是已经有一个逍遥盒了吗。");
			return
		else			
			if AddItem(2,1,1168,1) == 1 then
				Talk(1,"","<color=green>剑侠情缘盒<color>：你的逍遥盒取出，你随时可以通过剑侠情缘盒存入。");
				return
			end	
		end
	elseif nType == 3 then
		if GetItemCount(2,1,1169) < 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你身上没有月亮盒啊。");
			return
		else
			if DelItem(2,1,1169,1) == 1 then
				SetTask(ABLUEMOON_KEEP_MOON,1);
				Talk(1,"","<color=green>剑侠情缘盒<color>：你的月亮盒存入，你随时可以通过剑侠情缘盒取出。");
				return
			end
		end		
	elseif nType == 4 then
		if GetTask(ABLUEMOON_KEEP_MOON) ~= 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你没有月亮盒在我这里哦。");
			return
		end		
		if BigGetItemCount(2,1,1169) >= 1 then
			Talk(1,"","<color=green>剑侠情缘盒<color>：你不是已经有一个月亮盒了吗。");
			return
		else			
			if AddItem(2,1,1169,1) == 1 then
				Talk(1,"","<color=green>剑侠情缘盒<color>：你的月亮盒取出，你随时可以通过剑侠情缘盒存入。");
				return
			end	
		end 
	end			
end 

function get_route_cloth()
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if nFaction == 0 then
		Talk(1,"","<color=green>剑侠情缘盒<color>：你还没有入门派哦。");
		return
	end
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
		Talk(1,"","<color=green>剑侠情缘盒<color>：你的背包空间已经装不下了，先整理一下再来吧！")
	   return	
	end	 
	if BigGetItemCount(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3]) >= 1 and BigGetItemCount(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6]) >= 1 then
		Talk(1,"","<color=green>剑侠情缘盒<color>：你不是有一套了吗？穿坏了再来拿。");
		return
	else 
		if AddItem(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3],1) == 1 and AddItem(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6],1) == 1 then
			Msg2Player("你获得了门派外装一套");
		end
	end
end