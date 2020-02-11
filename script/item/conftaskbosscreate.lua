Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
--***********************************±äÁ¿¶¨ÒåÇø*****************************
--------------------------------------------°ï»áÈÎÎñËæ»úBOSSÊ¹ÓÃ¶¨Òå
Zgc_conf_task_boss = {			--µÚÒ»µÈ¼¶BOSS
	"C«n L«n N«",
	"Bïi Hµng",
	"LiÔu NghÞ",
	"Hång TuyÕn",
	"H¹ C¶nh Th¾ng",
	"NhiÕp §¹i Chïy",
	"Bé Phi Yªn",
}
Zgc_conf_task_box = {
	"R­¬ng cña C«n L«n N« ®Ó l¹i",
	"R­¬ng cña Bïi Hµng ®Ó l¹i",
	"R­¬ng cña LiÔu NghÞ ®Ó l¹i",
	"R­¬ng cña Hång TuyÕn ®Ó l¹i",
	"R­¬ng s¾t cña H¹ C¶nh Th¾ng",
	"R­¬ng s¾t cña NhiÕp §¹i Chïy",
	"B¶o r­¬ng cña Bé Phi Yªn",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Thµnh s¬n"},		
	{327,"¤ M«ng Bé"},
	{401,"§iÓm Th­¬ng s¬n"},
	{306,"Giang T©n Th«n"},
	{307,"Phong §«"},
	{405,"Ch©n nói Vò L¨ng"},
	{406,"Vò L¨ng s¬n"},
	{326,"Mé TuyÕt s¬n trang"},
	{310,"KiÕm M«n quan"},
	{311,"Phôc Ng­u s¬n"},
	{218,"Linh B¶o s¬n"},
	{202,"H¹nh Hoa th«n"},
	{151,"V©n Méng Tr¹ch"},			
	{601,"§¹i Th¶o Nguyªn 1"},
	{602,"§¹i Th¶o Nguyªn 2"},
	{103,"§«ng H¶i H¶i T©n 1"},
	{104,"§«ng H¶i H¶i T©n 2"},
	{102,"§µo Hoa ®¶o"},
	{207,"NhÞ Long s¬n"},
	{217,"D· Tr­ l©m"},
	{208,"L­¬ng S¬n B¹c"},
	{604,"Nh¹n M«n quan"},
	{106,"Long TuyÒn Th«n"},
	{107,"Vò Di s¬n"},
	{600,"Bé l¹c V­¬ng Kú"},
}
--======================================Ê¹ÓÃÉú³½¸ÙÕÙ»½BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--Ê¹ÓÃµØÍ¼ÅÐ¶Ï
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("N¬i ®©y quan binh canh gi÷ nghiªm ngÆt, ®¸m ng­êi Bé Phi Yªn to gan c¸ch mÊy còng kh«ng d¸m bÐn m·ng tíi, ng­¬i thö ®Õn chç kh¸c xem!",
			2,
			"Ta muèn biÕt hµnh tung cña Bé Phi Yªn/Zgc_bfy_actmap_inq",
			"Ta biÕt råi/Zgc_end_dialog"
		)		
	else														--´´½¨BOSS	
		local del_flag = DelItemByIndex(id,1)
		if del_flag ~= 1 then
			WriteLogEx(strLogCaption, "", "", "", "", GetTongName(),"xãa Sinh ThÇn Cang thÊt b¹i, ID thÊt b¹i:"..del_flag)
		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			if boss_step == 37 then
				boss_seq = 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."Sö dông Sinh ThÇn Cang gäi ra Bé Phi Yªn!")
				AddGlobalNews(GetTongName().."Cã tin bän hä ®ang giao ®Êu víi Bé Phi Yªn!")
				WriteLogEx(strLogCaption, "gäi ra", "1", "Bé Phi Yªn", "", GetTongName())
			elseif boss_step <= 85 then
				local boss_seq = random(5,6)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."Sö dông Sinh ThÇn Cang gäi ra:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "gäi ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			else
				boss_seq = random(1,4)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."Sö dông Sinh ThÇn Cang gäi ra:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "gäi ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")			
		end
	end
end
--********************************Éú³½¸Ù¿ÉÊ¹ÓÃµØÍ¼²éÑ¯*****************************
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
	Say("Bé Phi Yªn hµnh tung bÊt ®Þnh, ng­êi biÕt tung tÝch h¾n ta chØ cã: \n"..dialog_string,
		1,
		"Ta biÕt råi/Zgc_end_dialog"
	)
end
--**********************************BOSSËÀÍö´¦Àí***********************************
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------ÅÐ¶ÏÊÇÄÄ¸öBOSSËÀÍö------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			box_index = CreateNpc(Zgc_conf_task_box[i],Zgc_conf_task_box[i],MapID,X,Y,-1,1,0,0)
			SetNpcScript(box_index,"\\script\\item\\zgcconftaskboxdialog.lua")
			local num_save = GetUnitCurStates(box_index,2)
			AddUnitStates(box_index,2,-num_save)
			WriteLog("NhiÖm vô Bang Héi Bé Phi Yªn: BOSS ["..npc_name.."] CHÕT!")
			break
		end
	end
end

function Zgc_end_dialog()

end