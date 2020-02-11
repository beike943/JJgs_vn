--月亮盒
--authored by pengbo
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

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

tLinglong = {  -- 头,衣服,裤子
		{{207,213}, {281,287}, {281,287}, "玲珑裳（红）"},  --红
		{{208,214}, {282,288}, {282,288}, "玲珑裳（黄）"},  --黄
		{{209,215}, {283,289}, {283,289}, "玲珑裳（粉）"},  --粉
		{{210,216}, {284,290}, {284,290}, "玲珑裳（紫）"},  --紫
		{{211,217}, {285,291}, {285,291}, "玲珑裳（蓝）"},  --蓝
		{{212,218}, {286,292}, {286,292}, "玲珑裳（绿）"},  --绿
}

tXiaoyao_cloth = {
		{  --标准男    -头,衣服,裤子
			{{"普通棕",437},{"潇洒绿",431},{"华贵紫",419},{"飘逸蓝",425},{"神秘黑",413}}, --少林
			{{"普通棕",438},{"潇洒绿",432},{"华贵紫",420},{"飘逸蓝",426},{"神秘黑",414}}, --唐门
			{{"普通棕",439},{"潇洒绿",433},{"华贵紫",421},{"飘逸蓝",427},{"神秘黑",415}}, --丐帮
			{{"普通棕",440},{"潇洒绿",434},{"华贵紫",422},{"飘逸蓝",428},{"神秘黑",416}}, --武当
			{{"普通棕",441},{"潇洒绿",435},{"华贵紫",423},{"飘逸蓝",429},{"神秘黑",417}}, --杨门
			{{"普通棕",442},{"潇洒绿",436},{"华贵紫",424},{"飘逸蓝",430},{"神秘黑",418}}, --五毒
		},
		{  --魁梧男
			{{"普通棕",467},{"潇洒绿",461},{"华贵紫",449},{"飘逸蓝",455},{"神秘黑",443}}, --少林
			{{"普通棕",468},{"潇洒绿",462},{"华贵紫",450},{"飘逸蓝",456},{"神秘黑",444}}, --唐门
			{{"普通棕",469},{"潇洒绿",463},{"华贵紫",451},{"飘逸蓝",457},{"神秘黑",445}}, --丐帮
			{{"普通棕",470},{"潇洒绿",464},{"华贵紫",452},{"飘逸蓝",458},{"神秘黑",446}}, --武当
			{{"普通棕",471},{"潇洒绿",465},{"华贵紫",453},{"飘逸蓝",459},{"神秘黑",447}}, --杨门
			{{"普通棕",472},{"潇洒绿",466},{"华贵紫",454},{"飘逸蓝",460},{"神秘黑",448}}, --五毒
		},
		{  --性感女
			{"藕荷绿",408,408,208},{"罗兰紫",409,409,209},{"冰海蓝",410,410,210},{"梦境粉",411,411,211},{"玫瑰红",412,412,212}
		},
		{  --娇小女
		  {"藕荷绿",398,398,198},{"罗兰紫",399,399,199},{"冰海蓝",400,400,200},{"梦境粉",401,401,201},{"玫瑰红",402,402,202}
		}
}

tLinglongPart = {{108,"玲珑头冠"},{109,"玲珑服饰"},{110,"玲珑下装"}}

tRose_headwear = {
		{{117,120},"红玫瑰"},
		{{118,121},"粉玫瑰"},
		{{119,122},"黄玫瑰"},
		{{203,205},"蓝玫瑰"},
		{{204,206},"紫玫瑰"}
		} --编号
		
function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
		Say("男性角色不能使用月亮盒！",0)
		return
	else
		Say("<color=green>月亮盒<color>:大侠想要哪种外装呢？请随意挑选：",5,
				"我想要文魁花锦裳/give_wenkui",
				"我想要逍遥裳/give_xiaoyao",
				"我想要玲珑裳/give_linglong",
				"我想要玫瑰头饰/give_rose_headwear",
				"我再考虑一下/leave"
				)
	end
end

function give_wenkui()
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tWenkui_cloth[player_sex]) do
		tinsert(tSay,tWenkui_cloth[player_sex][i][1].."/#wk_give_cloth("..tWenkui_cloth[player_sex][i][2]..")")
	end
	tinsert(tSay,"我再考虑一下/end_say")
	Say("<color=green>月亮盒<color>:大侠想要哪种科考外装呢？请随意挑选：",getn(tSay),tSay)
end

function give_linglong()
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..")")
	end
	tinsert(tSay,"我再考虑一下/end_say")
	Say("<color=green>月亮盒<color>:大侠想要哪种玲珑裳呢？请随意挑选：",getn(tSay),tSay)
end

function give_rose_headwear()
	local player_sex = GetBody()
	local sex = player_sex-2
	local tSay = {}
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("<color=green>月亮盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	for i = 1,getn(tRose_headwear) do
		tinsert(tSay,tRose_headwear[i][2].."/#rh_give_cloth("..tRose_headwear[i][1][sex]..")")
	end
	tinsert(tSay,"我再考虑一下/end_say")
	Say("<color=green>月亮盒<color>:大侠想要哪种玫瑰头饰呢？请随意挑选：",getn(tSay),tSay)
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
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
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
	AddItem(0,109,nIndex,1)
	AddItem(0,110,nIndex-200,1)
end
	
function rh_give_cloth(nIndex)
  if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Say("<color=green>月亮盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	AddItem(0,108,nIndex,1)
	Msg2Player("你已经获得了"..tRose_headwear[i][2])
end

function wk_give_cloth(nDetail)
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>月亮盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	AddItem(0,109,nDetail,1)
end

function ll_give_cloth(nDetail)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("<color=green>月亮盒<color>:你的背包空间已经装不下了，先整理一下再来吧！",0)
		return
	end
	local nBody = GetBody()
	for i = 1,3 do
		AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
	end
end

function end_say()
	return OnUse()
end

function leave()

end