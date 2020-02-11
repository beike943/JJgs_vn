--êµ×Óµ¤
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function main()

	if CheckTime(6) == 1 or CheckTime(0) == 1 then		--ĞÇÆÚÁùºÍĞÇÆÚÌì²ÅÔÊĞíÔËËÍÎï×Ê
	    local szSay = {
	        "Sø gi¶ ho¹t ®éng: Ch©n Tö §an ®¹i hiÖp ®­îc triÒu ®×nh ñy th¸c qu¶n lı mäi viÖc liªn quan ®¹i héi tû vâ lÇn nµy, h·y ®Õn BiÖn Kinh t×m anh ta, ho¹t ®éng cuèi tuÇn hiÖn do ta phô tr¸ch!",
	        "Gióp §¹i Tèng t×m qu©n bŞ/supply_armament",
	        "Gióp §¹i Tèng chuyÓn hµng/deliver_goods",
	        "Dïng c«ng lao ®æi b¸o ®¸p/goto_liguan",
	        "Xem c«ng lao/query_offer",
	        "Giíi thiÖu chi tiÕt ho¹t ®éng cuèi tuÇn/introduce_detail",
	        "KÕt thóc ®èi tho¹i/end_say"
	    };
	    SelectSay(szSay);
	elseif CheckTime(5) == 1 then	--ÖÜÄ©µÄÊ±ºò²ÅÓĞ»î¶¯
	    local szSay = {
	        "Sø gi¶ ho¹t ®éng: Ch©n Tö §an ®¹i hiÖp ®­îc triÒu ®×nh ñy th¸c qu¶n lı mäi viÖc liªn quan ®¹i héi tû vâ lÇn nµy, h·y ®Õn BiÖn Kinh t×m anh ta, ho¹t ®éng cuèi tuÇn hiÖn do ta phô tr¸ch!",
	        "Gióp §¹i Tèng t×m qu©n bŞ/supply_armament",
	        "Dïng c«ng lao ®æi b¸o ®¸p/goto_liguan",
	        "Xem c«ng lao/query_offer",
	        "Giíi thiÖu chi tiÕt ho¹t ®éng cuèi tuÇn/introduce_detail",
	        "KÕt thóc ®èi tho¹i/end_say"
	    };
	    SelectSay(szSay);
	else
	    local szSay = {
	        "Sø gi¶ ho¹t ®éng: Ch©n Tö §an ®¹i hiÖp ®­îc triÒu ®×nh ñy th¸c qu¶n lı mäi viÖc liªn quan ®¹i héi tû vâ lÇn nµy, h·y ®Õn BiÖn Kinh t×m anh ta, ho¹t ®éng cuèi tuÇn hiÖn do ta phô tr¸ch!",
	        "Giíi thiÖu chi tiÕt ho¹t ®éng cuèi tuÇn/introduce_detail",
	        "KÕt thóc ®èi tho¹i/end_say"
	    };
	    SelectSay(szSay);
	end;
end;
