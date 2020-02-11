--剑侠情缘盒
--authored by pengbo
--==========================================任务变量===========================================
PUT_ALREADY = 801  --记录存入外装的次数，当将所有的外装都存入后主对话框将存入外装的选项去除
CELECLOTH_ALREADY = 802  --记录是否存入剑网2两周年庆外装
NEWYEARCLOTH_ALREADY = 803 --记录是否存入2007年新年装
MATCHERCLOTH_ALREADY = 804 --记录是否存入主婚人外装
--MARRIAGECLOTH_ALREADY = 805 --记录是否存入新郎or新娘外装
tTask = {802,803,804}

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
					{109,177},
					--魁梧男
					{109,178},
					--性感女
					{109,179},
					--娇小女
					{109,180}
				}

tAllcloth = {{tCele2cloth,"剑网2两周年庆外装"},{tNewyear7,"2007年新年装外装"},{tMatchercloth,"主婚人外装"}}				
--新郎外装      --  标准男,魁梧男
--================================================先不开放=====================================
--tGroomcloth = {
--							  {{109,173},{109,174}},  --少林
--							  {{109,201},{109,202}},  --唐门
--							  {{109,197},{109,198}},  --丐帮
--							  {{109,217},{109,218}},  --武当
--							  {{109,205},{109,206}},  --杨门
--							  {{109,209},{109,210}}   --五毒
--							 }
--新娘外装      --性感女,娇小女
--tBridecloth = {
--								{{109,203},{109,204}},  --唐门
--								{{109,195},{109,196}},  --峨嵋
--								{{109,199},{109,200}},  --丐帮
--								{{109,191},{109,192}},  --武当
--								{{109,207},{109,208}},  --杨门
--								{{109,211},{109,212}}   --五毒
--							}
--==============================================================================================

tAlreadyput = {{"我想存入剑网2周年庆外装/#PutClothInBox(1)","我想取出剑网2周年庆外装"},
							 {"我想存入2007年新年装外装/#PutClothInBox(2)","我想取出2007年新年装外装"},
							 {"我想存入主婚人外装/#PutClothInBox(3)","我想取出主婚人外装"}
							}
			
function OnUse()
	local tSay = {
		"我要领取剑侠情缘盒附带的外装/GetDefaultCloth",
		"我要领取存入的外装/GetOutCloth",
		"我想了解剑侠情缘盒有什么用处/AboutBox",
		"没有什么事/Leave"
	}
	local putAlready = GetTask(PUT_ALREADY)
	if putAlready < 3 then  --当存入全部外装后去除该选项
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
  return OnUse()
end

function PutInBox()
	local player_sex = GetBody()
	local putAlready = 0
	local tSay = {}
	for i = 1,3 do
		putAlready = GetTask(tTask[i])
		if putAlready == 0 then
			tinsert(tSay,tAlreadyput[i][1])
		end
	end
--	putAlready = GetTask(MARRIAGECLOTH_ALREADY)
--	if putAlready == 0 then
--		if player_sex <= 2 then 
--			tinsert(tSay,"我想存入新郎外装/#PutClothInBox(4)")
--		else
--			tinsert(tSay,"我想存入新娘外装/#PutClothInBox(5)")
--		end	
--	end
	tinsert(tSay,"我不想存入任何外装/end_say")
	Say("<color=green>剑侠情缘盒<color>：大侠想存入哪些外装呢？",getn(tSay),tSay)
end

function PutClothInBox(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if nIndex < 3 then
		if GetItemCount(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2]) < 1 then
			Say("<color=green>剑侠情缘盒<color>：你的背包里并没有完整的一套"..tAllcloth[nIndex][2]..",请检查后再存入宝盒中！",0)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2])< 1 then
    	Say("<color=green>剑侠情缘盒<color>：你的背包里并没有完整的一套"..tAllcloth[nIndex][2]..",请检查后再存入宝盒中！",0)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2])< 1 then
    	Say("<color=green>剑侠情缘盒<color>：你的背包里并没有完整的一套"..tAllcloth[nIndex][2]..",请检查后再存入宝盒中！",0)
    else	
    	for i = 1,3 do 
    		DelItem(0,tAllcloth[nIndex][1][player_sex][i][1],tAllcloth[nIndex][1][player_sex][i][2],1)
    	end
    	Msg2Player("你已经将"..tAllcloth[nIndex][2].."存入到剑侠情缘盒里了！")
    	SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
    	SetTask(tTask[nIndex],1)
    end
	elseif nIndex == 3 then
			if DelItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1) ~= 1 then
				Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套主婚人外装,请检查后再存入宝盒中！",0)
		  else 
		  	Msg2Player("你已经将主婚人外装存入到剑侠情缘盒里了！")
				SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
				SetTask(MATCHERCLOTH_ALREADY,1)
		  end
--===============================================暂时不开放============================		  
--	elseif nIndex == 4 then
--		if player_route < 5 then         --少林
--			choice = 1
--		elseif player_route < 7 then     --唐门
--			choice = 2
--		elseif player_route < 13 then    --丐帮
--			choice = 3
--		elseif player_route < 16 then		 --武当		
--			choice = 4
--		elseif player_route < 19 then		 --杨门
--			choice = 5
--		else
--			choice = 6										 --五毒
--		end
--		if DelItem(0,tGroomcloth[choice][player_sex][1],tGroomcloth[choice][player_sex][2],1)~=1 then
--			Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套与您体形和流派对应的新郎外装,请检查后再存入宝盒中！",0)
--		else
--			Msg2Player("你已经将新郎外装存入到剑侠情缘盒里了！")
--			SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
--			SetTask(MARRIAGECLOTH_ALREADY,1)
--		end
--	elseif nIndex == 5 then
--		if player_route < 7 then
--			choice = 1
--		elseif player_route < 10 then
--			choice = 2
--		elseif player_route < 13 then
--			choice = 3
--		elseif player_route < 16 then
--			choice = 4
--		elseif player_route < 19 then
--			choice = 5
--		else 
--			choice = 6
--		end
--		if DelItem(0,tBridecloth[choice][sex][1],tBridecloth[choice][sex][2],1)~=1 then
--			Say("<color=green>剑侠情缘盒<color>：你的背包里并没有一套与您体形和流派对应的新娘外装,请检查后再存入宝盒中！",0)
--		else
--			Msg2Player("你已经将新娘外装存入到剑侠情缘盒里了！")
--			SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
--			SetTask(MARRIAGECLOTH_ALREADY,1)
--		end
--====================================================================================================
	end
end
		
function GetOutCloth()
	local player_sex = GetBody()
	local putAlready = GetTask(PUT_ALREADY)
	local tSay = {}
	local i1 = GetTask(CELECLOTH_ALREADY)
	local i2 = GetTask(NEWYEARCLOTH_ALREADY)
	local i3 = GetTask(MATCHERCLOTH_ALREADY)
--	local i4 = GetTask(MARRIAGECLOTH_ALREADY)
	if i1 == 1 then
			tinsert(tSay,"我想取出剑网2周年庆外装/#GetCloth(1)")
	end
	if i2 == 1 then
		 tinsert(tSay,"我想取出2007年新年装外装/#GetCloth(2)")
	end
	if i3 == 1 then
		 tinsert(tSay,"我想取出主婚人外装/#GetCloth1(1)")
	end
--	if i4 == 1 then
--		if player_sex < 3 then
--			tinsert(tSay,"我要取出新郎外装/#GetCloth1(2)")
--		else 
--			tinsert(tSay,"我要取出新娘外装/#GetCloth1(3)")
--		end
--	end
	if putAlready == 0 then 
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
--============================暂时不开放===============
--	elseif nIndex == 2 then
--		if player_route < 5 then         --少林
--			choice = 1
--		elseif player_route < 7 then     --唐门
--			choice = 2
--		elseif player_route < 13 then    --丐帮
--			choice = 3
--		elseif player_route < 16 then		 --武当		
--			choice = 4
--		elseif player_route < 19 then		 --杨门
--			choice = 5
--		else
--			choice = 6										 --五毒
--		end
--		AddItem(0,tGroomcloth[choice][player_sex][1],tGroomcloth[choice][player_sex][2],1)
--	elseif nIndex == 3 then
--		if player_route < 7 then
--			choice = 1
--		elseif player_route < 10 then
--			choice = 2
--		elseif player_route < 13 then
--			choice = 3
--		elseif player_route < 16 then
--			choice = 4
--		elseif player_route < 19 then
--			choice = 5
--		else 
--			choice = 6
--		end
--		AddItem(0,tBridecloth[choice][sex][1],tBridecloth[choice][sex][2],1)
	end
end
		

function AboutBox()
	Say("<color=green>剑侠情缘盒<color>:打开该宝盒可以免费获取2005年圣诞外装、2007年元旦外装、2006年新年外装。同时，你也可以在盒子里存入与自己体形相符合的2007年新年装、剑网2两周年庆外装、主婚人外装和结婚外装；在存入后就可以免费获取这些存入的外装！",
		1,
		"我了解了/end_say")
end

function Leave()

end