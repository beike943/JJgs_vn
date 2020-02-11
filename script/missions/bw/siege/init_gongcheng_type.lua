--=============================================
--create by baiyun 2009.10.15
--describe:Ô½ÄÏ°æ10ÔÂ¹¥³ÇÕ½µ÷Õû£¬³õÊ¼»¯¹¥³ÇÕ½µÄÀàĞÍ
--¼ÇÔÚ¹²Ïí¿âÀï£¬ÀàĞÍ1Îª´òÀŞÌ¨£¬2Îª¾ºÍ¶ÌôÕ½Áî
--=============================================
Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
File_name = "\\script\\missions\\bw\\siege\\init_gongcheng_type.lua";

function main()
	if tonumber(date("%w")) == 6 then--ĞÇÆÚÁùÀ´Ëæ»ú³öÒ»ÖÖ¹¥³ÇÕ½×Ê¸ñÀàĞÍ
		local nType = 1--random(1, 2);
		SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
		WriteLog("[Chän ngÉu nhiªn tranh ®o¹t c«ng thµnh chiÕn]: Lo¹i h×nh tranh ®o¹t c«ng thµnh chiÕn lÇn nµy lµ: "..tSignMethod[nType]);
		AddRelayShareData("gongchengtype", 0, 0, File_name, "clear_data", 2, "type", "d", nType); 
	end
end

function clear_data()
	ClearRelayShareData("tiaozhanling", 0, 0, File_name, "nothing");
end

function nothing()
	WriteLog("Last week tiaozhanling data has been cleared successful");
end