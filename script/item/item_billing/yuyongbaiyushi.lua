Include("\\script\\lib\\writelog.lua")
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
	{106,"Long TuyÒn Th«n"},
	{107,"Vò Di s¬n"},
	{103,"§«ng H¶i H¶i T©n 1"},
	{104,"§«ng H¶i H¶i T©n 2"},
	{102,"§µo Hoa ®¶o"},
	{207,"NhÞ Long s¬n"},
	{217,"D· Tr­ l©m"},
	{208,"L­¬ng S¬n B¹c"},
	{604,"Nh¹n M«n quan"},
	{601,"§¹i Th¶o Nguyªn 1"},
	{602,"§¹i Th¶o Nguyªn 2"},
	{600,"Bé l¹c V­¬ng Kú"},
}
TaskID_bfy_crt = 958
function OnUse(goods_index)
	SetItemUseLapse(goods_index,90)
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
	else
		Say("B¹n muèn dïng B¹ch Ngäc th¹ch? Nã cã thÓ gióp b¹n t×m ra tung tÝch Bé Phi Yªn.",
		2,
		"Sö dông B¹ch Ngäc th¹ch/#yybys_use()",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	end
end
function yybys_use()
	if GetItemCount(2,1,1024) < 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn trªn ng­êi cã Hoa c­¬ng th¹ch vµ Sinh ThÇn C­¬ng!")
		return
	elseif GetItemCount(2,0,545) < 10 then
		Talk(1,"end_dialog","Muèn g¹t ta µ?")
		return
	end
	if DelItem(2,1,1024,1)~= 1 or DelItem(2,0,545,10) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn trªn ng­êi cã Hoa c­¬ng th¹ch vµ Sinh ThÇn C­¬ng!")
		return
	else
		local strLogCaption = "Nhiem vu Bang hoi"
		local npc_index = 0
		local mapID,X,Y = GetWorldPos()
		npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
		SendTongMessage(GetName().."Sö dông Sinh ThÇn Cang gäi ra Bé Phi Yªn!")
		if IsTongMember() ~= 0 then
			AddGlobalNews(GetTongName().."Cã tin bän hä ®ang giao ®Êu víi Bé Phi Yªn!")
		end
		SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")
		WriteLogEx(strLogCaption, "B¹ch Ngäc Th¹ch", "1", Zgc_conf_task_boss[7], "", GetTongName())			
	end
end
--********************************Éú³½¸Ù¿ÉÊ¹ÓÃµØÍ¼²éÑ¯*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid)do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("Bé Phi Yªn hµnh tung bÊt ®Þnh, ng­êi biÕt tung tÝch h¾n ta chØ cã: \n"..dialog_string,
		1,
		"Ta biÕt råi/Zgc_end_dialog"
	)
end
function end_dialog()
end
