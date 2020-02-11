--逍遥盒
--authored by pengbo
tWenkui_cloth = {
	{  --标准男
		{"文魁花锦袍(紫)",259},{"文魁花锦袍(蓝)",260}
	},
	{  --魁梧男
		{"文魁花锦袍(紫)",261},{"文魁花锦袍(蓝)",262}
	},
	{  --性感女
		{"文魁花锦裳(红)",263},{"文魁花锦裳(粉)",264},{"文魁花锦裳(绿)",265},{"文魁花锦裳(蓝)",266},
		{"文魁花锦裳(黄)",267},{"文魁花锦裳(橙)",268},{"文魁花锦裳(黑)",269}
	},
	{  --娇小女
		{"文魁花锦裳(红)",270},{"文魁花锦裳(粉)",271},{"文魁花锦裳(绿)",272},{"文魁花锦裳(蓝)",273},
		{"文魁花锦裳(黄)",274},{"文魁花锦裳(橙)",275},{"文魁花锦裳(黑)",276}	
	},
}

tXiaoyao_cloth = {
		{  --标准男    -头,衣服,裤子
			{{"普通棕",437},{"潇洒绿",431},{"华贵紫",419},{"飘逸蓝",425},{"神秘黑",413}}, --少林
			{{"普通棕",440},{"潇洒绿",434},{"华贵紫",422},{"飘逸蓝",428},{"神秘黑",416}}, --唐门
			{{"普通棕",439},{"潇洒绿",433},{"华贵紫",421},{"飘逸蓝",427},{"神秘黑",415}}, --丐帮
			{{"普通棕",438},{"潇洒绿",432},{"华贵紫",420},{"飘逸蓝",426},{"神秘黑",414}}, --武当
			{{"普通棕",441},{"潇洒绿",435},{"华贵紫",423},{"飘逸蓝",429},{"神秘黑",417}}, --杨门
			{{"普通棕",442},{"潇洒绿",436},{"华贵紫",424},{"飘逸蓝",430},{"神秘黑",418}}, --五毒
		},
		{  --魁梧男
			{{"普通棕",467},{"潇洒绿",461},{"华贵紫",449},{"飘逸蓝",455},{"神秘黑",443}}, --少林
			{{"普通棕",470},{"潇洒绿",464},{"华贵紫",452},{"飘逸蓝",458},{"神秘黑",446}}, --唐门
			{{"普通棕",469},{"潇洒绿",463},{"华贵紫",451},{"飘逸蓝",457},{"神秘黑",445}}, --丐帮
			{{"普通棕",468},{"潇洒绿",462},{"华贵紫",450},{"飘逸蓝",456},{"神秘黑",444}}, --武当
			{{"普通棕",471},{"潇洒绿",465},{"华贵紫",453},{"飘逸蓝",459},{"神秘黑",447}}, --杨门
			{{"普通棕",472},{"潇洒绿",466},{"华贵紫",454},{"飘逸蓝",460},{"神秘黑",448}}, --五毒
		},
		{  --性感女
			{"藕荷绿",308,408,208},{"罗兰紫",309,409,209},{"冰海蓝",310,410,210},{"梦境粉",311,411,211},{"玫瑰红",312,412,212}
		},
		{  --娇小女
		  {"藕荷绿",298,398,198},{"罗兰紫",299,399,199},{"冰海蓝",300,400,200},{"梦境粉",301,401,201},{"玫瑰红",302,402,202}
		}
}

function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
			Say("<color = green>逍遥盒<color>:大侠想要哪种外装呢？请随意挑选：",3,
			"我想要文魁花锦袍/give_wenkui",
			"我想要逍遥装/give_xiaoyao",
			"我再考虑一下/leave"
					)
	else
		Say("<color = green>逍遥盒<color>:大侠想要哪种外装呢？请随意挑选：",2,
				"我想要逍遥裳/give_xiaoyao",
				"我再考虑一下/leave"
				)
	end
end

function give_xiaoyao()
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local tSay = {}
	local choice = 0
	if player_route < 5 then
		choice = 1
	elseif player_route < 7 then
		choice = 2
	elseif player_route < 13 then
		choice = 3
	elseif player_route < 16 then
		choice = 4
	elseif player_route < 19 then
		choice = 5
	else
		choice = 6
	end
	if player_sex < 3 then
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][1][i][1].."/#xy_give_cloth("..tXiaoyao_cloth[player_sex][choice][i][2]..")")
		end
		tinsert(tSay,"我再考虑一下/end_say")
		Say("<color=green>逍遥盒<color>:大侠想要哪种科考外装呢？请随意挑选：",getn(tSay),tSay)
	else 
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][i][1].."/#xy_give_cloth1("..tXiaoyao_cloth[player_sex][i][2]..")")
		end
		tinsert(tSay,"我再考虑一下/end_say")
		Say("<color=green>逍遥盒<color>:大侠想要哪种科考外装呢？请随意挑选：",getn(tSay),tSay)
	end
end

function xy_give_cloth(nIndex)
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
		Say("<color=green>逍遥盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex,1)
end

function xy_give_cloth1(nIndex)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>逍遥盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex+100,1)
	AddItem(0,110,nIndex+200,1)
end

function end_say()
	return OnUse()
end

function leave()

end