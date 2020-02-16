Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
--***********************************变量定义区*****************************
--------------------------------------------帮会任务随机BOSS使用定义
Zgc_conf_task_boss = {			--第一等级BOSS
	"C玭 L玭 N?",
	"B飅 H祅g",
	"Li評 Ngh?",
	"H錸g Tuy課",
	"H? C秐h Th緉g",
	"Nhi誴 Чi Ch飝",
	"B? Phi Y猲",
}
Zgc_conf_task_box = {
	"Rng c馻 C玭 L玭 N?  l筰",
	"Rng c馻 B飅 H祅g  l筰",
	"Rng c馻 Li評 Ngh?  l筰",
	"Rng c馻 H錸g Tuy課  l筰",
	"Rng s総 c馻 H? C秐h Th緉g",
	"Rng s総 c馻 Nhi誴 Чi Ch飝",
	"B秓 rng c馻 B? Phi Y猲",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Th祅h s琻"},		
	{327,"? M玭g B?"},
	{401,"觤 Thng s琻"},
	{306,"Giang T﹏ Th玭"},
	{307,"Phong Й"},
	{405,"Ch﹏ n骾 V? L╪g"},
	{406,"V? L╪g s琻"},
	{326,"M? Tuy誸 s琻 trang"},
	{310,"Ki誱 M玭 quan"},
	{311,"Ph鬰 Ng璾 s琻"},
	{218,"Linh B秓 s琻"},
	{202,"H筺h Hoa th玭"},
	{151,"V﹏ M閚g Tr筩h"},			
	{601,"Чi Th秓 Nguy猲 1"},
	{602,"Чi Th秓 Nguy猲 2"},
	{103,"Йng H秈 H秈 T﹏ 1"},
	{104,"Йng H秈 H秈 T﹏ 2"},
	{102,"Уo Hoa o"},
	{207,"Nh? Long s琻"},
	{217,"D? Tr? l﹎"},
	{208,"Lng S琻 B筩"},
	{604,"Nh筺 M玭 quan"},
	{106,"Long Tuy襫 Th玭"},
	{107,"V? Di s琻"},
	{600,"B? l筩 Vng K?"},
}
--======================================使用生辰纲召唤BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--使用地图判断
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("这里戒备森严,那些胆大妄为的野蛮人是不会来的,你去别的地方试试吧！",
			2,
			"我想知道？？？的下落/Zgc_bfy_actmap_inq",
			"知道了/Zgc_end_dialog"
		)		
	else														--创建BOSS	
		local del_flag = DelItemByIndex(id,1)
		if del_flag ~= 1 then
			WriteLogEx(strLogCaption, "", "", "", "", GetTongName(),"使用生辰纲失败,失败ID:"..del_flag)
		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			if boss_step == 37 then
				boss_seq = 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S? d鬾g Sinh Th莕 Cang g鋓 ra B? Phi Y猲!")
				AddGlobalNews(GetTongName().."C? tin b鋘 h? 產ng giao u v韎 B? Phi Y猲!")
				WriteLogEx(strLogCaption, "召唤", "1", "个BOOS", "", GetTongName())
			elseif boss_step <= 85 then
				local boss_seq = random(5,6)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."使用生辰纲:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "召唤", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			else
				boss_seq = random(1,4)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."使用生辰纲:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "召唤", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")			
		end
	end
end
--********************************生辰纲可使用地图查询*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid) do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/4)-(i/4) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(19-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("他是唯一知道真相的人: \n"..dialog_string,
		1,
		"我知道/Zgc_end_dialog"
	)
end
--**********************************BOSS死亡处理***********************************
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------判断是哪个BOSS死亡------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			box_index = CreateNpc(Zgc_conf_task_box[i],Zgc_conf_task_box[i],MapID,X,Y,-1,1,0,0)
			SetNpcScript(box_index,"\\script\\item\\zgcconftaskboxdialog.lua")
			local num_save = GetUnitCurStates(box_index,2)
			AddUnitStates(box_index,2,-num_save)
			WriteLog("完成任务: BOSS ["..npc_name.."]被你杀死了。")
			break
		end
	end
end

function Zgc_end_dialog()

end
