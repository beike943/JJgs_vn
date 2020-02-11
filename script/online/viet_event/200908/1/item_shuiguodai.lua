--=============================================
--create by baiyun 2009.7.16
--describe:越南版8月份活动 水果袋脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nRand = random(1, 100);
		if nRand <= 30 then
			if gf_AddItemEx({2, 1, 30098, 1}, "Nho") == 1then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Nho Tuoi");
			end
		elseif nRand > 30 and nRand <= 60 then
			if gf_AddItemEx({2, 1, 30099, 1}, "M穘g c莡") == 1 then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Mang Cau");
			end
		else
			if gf_AddItemEx({2, 1, 30100, 1}, "S莡 ri猲g") == 1 then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Sau rieng");
			end
		end
	end
end
