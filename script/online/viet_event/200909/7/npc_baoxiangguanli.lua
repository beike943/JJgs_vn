--=============================================
--create by baiyun 2009.8.24
--describe:Ô½ÄÏ°æ9ÔÂ·İÖĞÇï»î¶¯±¦Ïä¹ÜÀí½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")
function main()
	do return end
	local tb_dialog = {
		"T¹i h¹ muèn nhËn B¸ch B¶o R­¬ng/get_baibaoxiang",
		"T¹i h¹ muèn nhËn 1 CÈm nang ®¹i sù kiÖn/get_jinnang",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say("<color=green>Qu¶n lı b¶o r­¬ng: <color>Sù kiÖn B¸ch B¶o R­¬ng diÔn ra tõ 19-09-2009 ®Õn 24:00 25-10-2009. Trong thêi gian ho¹t ®éng, mçi ngµy c¸c h¹ cã thÓ nhËn miÔn phİ 1 B¸ch B¶o R­¬ng. R­¬ng th× cã thÓ mua thªm tõ Ngù C¸c . B¸ch B¶o R­¬ng lµ n¬i cÊt gi÷ tßan bé nh÷ng vËt phÈm cña vâ l©m tõ nguyªn liÖu, vËt phÈm thu thËp, d­îc phÈm, trang bŞ, vò khİ …<enter>L­u ı lµ mçi nh©n vËt chØ cã thÓ nhËn miÔn phİ 1 B¸ch B¶o R­¬ng trong 1 ngµy vµ mçi ngµy chØ cã thÓ më tèi ®a 8 B¸ch B¶o R­¬ng", getn(tb_dialog), tb_dialog);
end

function get_baibaoxiang()
	local nDate = tonumber(date("%y%m%d"));
	if GetLevel() < 70 then
		Talk(1, "", "<color=green>Qu¶n lı b¶o r­¬ng: <color>CÊp 70 trë lªn míi cã thÓ nhËn B¸ch B¶o R­¬ng. ThiÕu hiÖp h·y cè g¾ng thªm nhĞ!");
		return 0;
	end
	if GetTask(VIET_0909_TASK_GET_BOX_DATE) >= nDate then
		Talk(1, "", "<color=green>Qu¶n lı b¶o r­¬ng: <color>H«m nay thiÕu hiÖp ®· nhËn R­¬ng råi, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu¶n lı b¶o r­¬ng: <color>") ~= 1 then 
		return 0;
	end
	local nRetCode, nIndex = gf_AddItemEx({2, 1, 30111, 1}, "B¸ch B¶o R­¬ng");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 15 * 24 * 3600);
		SetTask(VIET_0909_TASK_GET_BOX_DATE, nDate);
	end
end

function get_jinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "<color=green>Qu¶n lı b¶o r­¬ng:<color>C¸c h¹ ®· nhËn CÈm nang ®¹i sù kiÖn råi, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu¶n lı b¶o r­¬ng: <color>") ~= 1 then 
		return 0;
	end
	gf_AddItemEx({2, 1, 30045, 1}, "CÈm Nang §¹i Sù KiÖn");
end

function nothing()

end