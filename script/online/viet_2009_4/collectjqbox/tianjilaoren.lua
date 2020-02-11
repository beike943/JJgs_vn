--=============================================
--create by baiyun 2009.4.12
--describe:Ô½ÄÏ°æ4ÔÂ·Ý½ðÐÇÐÇÒøÐÇÐÇ»î¶¯ Ìì»úÀÏÈË
--=============================================

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\writelog.lua")

--------------------------------------
--main()
--Ö÷º¯Êý
--------------------------------------
function main()
	----¼ì²é»î¶¯Ê±¼ä
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Thêi gian ho¹t ®éng ®· hÕt.");
		return 0;
	end
	
	Say(
			"Thiªn C¬ L·o Nh©n: Ta chuyªn phô tr¸ch c¸c vÊn ®Ò n©ng cÊp Lam Kú thµnh Hång Kú, ghÐp Hång Kú víi Hoµng Kim Kú Th¹ch",
			4,
			"T¹i h¹ muèn n©ng cÊp Lam Kú (CÇn 3 Lam Kú vµ 10 b¹c)/JQ_LevelBToRFlag",
			"T¹i h¹ cÇn ghÐp Hång Kú víi Hoµng Kim Th¹ch (nhËn ®­îc Hoµng Kim Kú hoÆc B¹ch Kim Kú)/JQ_GroupRedAndStone",
			"T¹i h¹ cÇn 1 CÈm nang ®¹i sù kiÖn./JQ_GetJinNang",
			"T¹i h¹ chØ ghÐ ngang!/JQ_DoNothing"
		)
end


--------------------------------------
--JQ_LevelBToRFlag()
--°ÑÀ¶ÆìÉý¼¶³ÉºìÆì
--------------------------------------
function JQ_LevelBToRFlag()
-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(2, 0, "Xin lçi, ") == 0 then
		return 0
	end
-----Ç®²»¹»--------	
	if GetCash() < JQ_LEVEL_B_TO_R_FLAG_MONEY then
		Talk(1, "", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return 0;
	end

	if DelItem(2, 1, 30081, JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM) ~= 1 then
		Say("Nguyªn liÖu mang theo kh«ng ®ñ", 1, "KÕt thóc ®èi tho¹i/JQ_DoNothing");
		return 0;
	end
	if Pay(JQ_LEVEL_B_TO_R_FLAG_MONEY) ~= 1 then
		WriteLog("[Ho¹t ®éng thu thËp hiÖu kú th¸ng 4]:" .. GetName() .. "Chi tr¶".. JQ_LEVEL_B_TO_R_FLAG_MONEY .. " xu thÊt b¹i");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 75 then --75%µÄ¸ÅÂÊµÃÒ»¸öºìÆì
		if AddItem(2, 1, 30080, 1) == 1 then
			Msg2Player("§¹i hiÖp nhËn ®­îc 1 Hång Kú");
			WriteLogEx("Hoat dong thang 4","nhËn ®­îc",1,"Hång Kú");			
		end
	else
		if AddItem(2, 1, 30081, 2) == 1 then
			Say("Qu¸ tr×nh n©ng cÊp thÊt b¹i, c¸c h¹ chØ nhËn l¹i ®­îc 2 Lam Kú..", 1, "KÕt thóc ®èi tho¹i/main");
		end
	end
end

--------------------------------------
--JQ_GroupRedAndStone()
--°ÑºìÆìºÍ»Æ½ðÊ¯ºÏ³É°×½ðÆì»ò»Æ½ðÆì
--------------------------------------
function JQ_GroupRedAndStone()
-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin lçi, ") == 0 then
		return 0;
	end
-----Ô­ÁÏ²»¹»------------------------------
	if GetItemCount(2, 1, 30080) < 2 or GetItemCount(2, 1, 30082) == 0 then
		Say("Nguyªn liÖu mang theo kh«ng ®ñ", 1, "KÕt thóc ®èi tho¹i/JQ_DoNothing");
		return 0;
	end

	if DelItem(2, 1, 30080, 2) == 1 and DelItem(2, 1, 30082, 1) == 1 then
		local nRand = 0;
		nRand = random(1, 100);
		if nRand == 1 then
			if AddItem(2, 1, 30083, 1) == 1 then
				Msg2Player("B¹n nhËn ®­îc " .. "1" .. "c¸i" .. "B¹ch Kim Kú");
				WriteLogEx("Hoat dong thang 4","nhËn ®­îc",1,"B¹ch Kim Kú");
			end
		else
			if AddItem(2, 1, 30084, 1) == 1 then
				Msg2Player("B¹n nhËn ®­îc " .. "1" .. "c¸i" .. "Hoµng Kim Kú");
				WriteLogEx("Hoat dong thang 4","nhËn ®­îc",1,"Hoµng Kim Kú");
			end
		end	
	end
end

--------------------------------------
--JQ_GetJinNang()
--ÁìÈ¡½õÄÒ´óÊÂ¼þ
--------------------------------------
function JQ_GetJinNang()
	if GetItemCount(2, 1, 30045) ~= 0 then
		Say("C¸c h¹ ®· nhËn CÈm nang ®¹i sù kiÖn råi, kh«ng thÓ nhËn thªm ®­îc n÷a.", 1, "KÕt thóc ®èi tho¹i!/JQ_DoNothing");
		return 0;	
	else
		-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
		if gf_Judge_Room_Weight(1, 1, "Xin lçi, ") == 0 then
			return 0;
		end
		if AddItem(2, 1, 30045, 1) == 1 then
			Say("Ng­¬i nh©n ®­îc 1 CÈm Nang §¹i Sù KiÖn.", 1, "§a t¹ tiÒn bèi.!/JQ_DoNothing");
		end
	end
end