--½Å±¾¹¦ÄÜ£º2007Äê´º½Ú»î¶¯
--½Å±¾¿ª·¢£ºÕÔ¹ó´º
--½Å±¾Éæ¼°ÈÎÎñID£º±äÁ¿£º1275-£¬Ö÷±äÁ¿£º
Include("\\script\\online\\zgc_public_fun.lua")
--2007Äê´º½Ú»î¶¯TaskID¼ÇÂ¼
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977

TaskID_spring2007_create_time = 978

TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
Goods_Id_feed_pig_book = 615
Goods_Id_pig_ran_color_sex = 616
Goods_Id_pig_black_ran_sex = 618
Goods_Id_pig_white_ran_sex = 620
Goods_Id_pig_any_color_sex = 622
Goods_Id_golden_pig = 624
Goods_Id_catch_pig_stick = 626
--***************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı****************************
function OnUse(goods_index)
	if zgc_pub_day_turn(1) > 13576 then			--»î¶¯Ê±¼äÅĞ¶Ï
		return
	end
	local goods_id = GetItemParticular(goods_index)
	if goods_id == Goods_Id_feed_pig_book then
		pig_book_use()
	else
		pig_baby_use(goods_id)
	end
end
--*************************Öí±¦±¦µÄÊ¹ÓÃ********************************
function pig_baby_use(goods_id)					--Öí±¦±¦µÄÊ¹ÓÃ
	if goods_id == Goods_Id_pig_ran_color_sex then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc thó c­ng mµu s¾c tïy ı, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(0,0,"..goods_id..")",		--ĞÔ±ğ¡¢ÑÕÉ«¡¢ÎïÆ·Ë÷Òı
		"§Ó ta suy nghÜ l¹i/end_dialog")		
	elseif goods_id == Goods_Id_pig_black_ran_sex then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi H¾c tr­, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(1,0,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == Goods_Id_pig_white_ran_sex then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc B¹ch tr­, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(2,0,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == Goods_Id_pig_any_color_sex then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc thó c­ng tïy ı, ng­¬i ®ång ı chø?",
		5,
		"Ta muèn gäi B¹ch Tr­ (bè)/#pig_create(2,1,"..goods_id..")",
		"Ta muèn gäi B¹ch Tr­ (mÑ)/#pig_create(2,2,"..goods_id..")",		
		"Ta muèn gäi H¾c tr­ (bè)/#pig_create(1,1,"..goods_id..")",
		"Ta muèn gäi H¾c tr­ (mÑ)/#pig_create(1,2,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == Goods_Id_golden_pig then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc Hoµng kim tr­, ng­¬i ®ång ı chø?",
		3,
		"Ta muèn gäi Hoµng kim tr­ (bè)/#pig_create(3,1,"..goods_id..")",
		"Ta muèn gäi Hoµng kim tr­ (mÑ)/#pig_create(3,2,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	end
end
--*************************ÑøÖí±¦µäµÄÊ¹ÓÃ******************************
function pig_book_use()
	if GetFollower() == 0 or GetFollower() == nil then
		Say("Ng­¬i muèn thó c­ng cã nh÷ng ®éng t¸c g×?",
		2,
		"Ta muèn ®­a thó c­ng/pig_out",
		"Rêi b¶o ®iÓn/end_dialog")
	else
		Say("Ng­¬i muèn thó c­ng cã nh÷ng ®éng t¸c g×?",
		2,
		"Ta muèn thu håi thó c­ng/pig_in",
		"Rêi b¶o ®iÓn/end_dialog")
	end
end
--*************************ÊÕ»ØÖí±¦±¦*********************************
function pig_in()
	KillFollower()
	Talk(1,"","B¹n ®· thu håi ®­îc thó c­ng, sau nµy cã thÓ më B¶o §iÓn ra ®Ó gäi l¹i.")
end
--*************************Öí±¦±¦µÄ´´½¨********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--ÖíµÄÑÕÉ«
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--ÖíµÄĞÔ±ğ
	SetTaskTemp(165,goods_id)
	--ÏÈÉ¾³ıÄ¿Ç°µÄ¸ú³è£¬È»ºóÌí¼ÓĞÂµÄ¸ú³è£¬²¢ÔÚ976ÖĞ¼ÇÂ¼ÏÂ¸ú³èĞÅÏ¢
	AskClientForString("pig_create_rtn","",0,16,"Xin nhËp tªn cña thó c­ng")
end
--****************************·Å³öÖí±¦±¦*******************************
function pig_out()
	local pig_clolor = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_color)
	if pig_clolor == 0 or pig_sex == 0 then
		Talk(1,"","B¹n kh«ng cã thó c­ng!")
		return
	end
	AskClientForString("pig_out_rtn","",0,16,"Xin nhËp tªn cña thó c­ng")
end
--********************************Öí±¦±¦µÄ´´½¨**************************
function pig_create_rtn(pig_name)
	if pig_name == "" then
		Talk(1,"","Tªn cña thó c­ng kh«ng thÓ bá trèng!")
		return
	end
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--ÅĞ¶ÏÉ¾³ıµÀ¾ßÊÇ·ñ³É¹¦
		Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã thó c­ng <color=red>TiÓu Tr­<color>!")
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0 then
		SetTask(TaskID_spring2007_create_time,GetTime())
		AddItem(2,0,615,1)
		Talk(1,"","Chóc mõng b¹n ®· gäi ®­îc mét <color=green>"..pig_diff.."<color>, vµ nhËn ®­îc mét quyÓn B¶o §iÓn")
	end
end
--****************************Öí±¦±¦·Å³ö*******************************
function pig_out_rtn(pig_name)
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0  then
		Talk(1,"","B¹n ®· gäi ®­îc <color=green>"..pig_diff.."<color>!")
	end
end
--****************************Öí±¦±¦µÄ´´½¨»Øµ÷*************************
function pig_crt(pig_name)
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = 1
	local pig_table = {			--ËÄ¸öµÈ¼¶µÄÖí
		{{"TiÓu H¾c tr­ (bè)","TiÓu H¾c tr­ (mÑ)"},{"TiÓu B¹ch tr­ (bè)","TiÓu B¹ch tr­ (mÑ)"},{"TiÓu Kim tr­ (bè)","TiÓu Kim tr­ (mÑ)"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
	return pig_table[pig_level][pig_color][pig_sex]
end
--**************************Öí±¦±¦µÄÃû×Ö¼ì²â**************************
function pig_name_chk(pig_name)
	if pig_name == "" then
		Talk(1,"","Tªn cña thó c­ng kh«ng thÓ bá trèng!")
		return 0
	end
	--**************************Ãû×Ö¹ıÂË****************************
	local pigname_forbid_chr = {"CÇu","B¸","Qu©n","L«i","Qu©n","Kim S¬n","chİn","TuyÖt","JS","§æng Ca Minh","Chung ThŞ"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","Tªn cña thó c­ng kh«ng ®óng, xin nhËp l¹i!")
			return 0
		end
	end
	
end
