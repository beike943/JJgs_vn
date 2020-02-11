--=============================================
--create by baiyun 2009.4.15
--describe:Ô½ÄÏ°æ4ÔÂ·İÊÕ¼¯Ğ£ÆìÏä»î¶¯ Ğ£ÆìÏä
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")
--------------------------------------
--OnUse()
--´ò¿ªĞ£ÆìÏä»ñµÃºìÆì»òÀ¶Æì
--------------------------------------
function OnUse()
	-----ÅĞ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin lçi, ") == 0 then
		return 0
	end
	local nID = 0;
	local sItem = "";
	if DelItem(2, 1, 30079, 1) == 1 then
		local nRand = random(1, 100);
		if nRand > 0 and nRand <= 90 then
			nID = 30081;
			sItem = "Lam Kú";
		else
			nID = 30080;
			sItem = "Hång Kú";
		end 
		if AddItem(2, 1, nID, 1) == 1 then
			Msg2Player("NhËn ®­îc 1 " .. sItem);
			WriteLogEx("Hoat dong thang 4","R­¬ng HiÖu Kú",1,sItem)
		end
	end
end