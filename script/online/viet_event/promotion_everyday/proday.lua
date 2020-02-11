Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");

PROMOTION_EVERYDAY = "Khuyen Mai Moi Ngay"


tb_Saleoff =
{
	[1] = {"baothienthach","Hßa ThÞ BÝch"},
}

proday =
{
	fileName = "data/proday.txt",
	count = 0,
	listFormat = "(.+)	(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	proday.fileName = "data\\proday.txt"
else
	proday.fileName = "data/proday.txt"
end

function proday:load()
	local pf = openfile(self.fileName, "r");
	if not pf then 
		proday:save()
		return
	end
	local str = ""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,sItemName, nNum, nNgay = strfind(str, self.listFormat)
--		print(sItemName)
--		print(nNum)
		self.tList[sItemName] = {tonumber(nNum), tonumber(nNgay)}
--		print(self.tList[sItemName][1])
	end
	closefile(pf);
end

function proday:save()
	local pf = openfile(self.fileName, "w")
--	print("qua day chua")
	if not pf then return end
--	print("qua day roi")
--	print(getn(self.tList))
	for i = 1, 1 do
		local nItemSale = tb_Saleoff[i][1]
		local nDate = tonumber(date("%Y%m%d"))		
--		print("Gia tri truoc khi ghi file"..self.tList[nItemSale][1])
		write(pf, format("%s	%d	%d\n", tb_Saleoff[i][1], self.tList[nItemSale][1], nDate));
	end
	closefile(pf);
end

function proday:register()
	local nItemSale = tb_Saleoff[1][1];
	if self.tList[nItemSale][1] >= 1 then
--		print("Gia tri truoc khi tru"..self.tList[nItemSale][1])
		self.tList[nItemSale][1] = self.tList[nItemSale][1] - 1;
--		print("Gia tri sau khi tru"..self.tList[nItemSale][1])
		self:save();
		return 1
	end
	return 0
end

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Ch­¬ng tr×nh khuyÕn m·i gi¸ rÎ, vËt phÈm ®ang gi¶m gi¸ <color=green>Hßa ThÞ BÝch<color> gi¸ <color=yellow>500 VËt phÈm Xu (h¹n sö dông 7 ngµy)<color> ."
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20120425 and nDate <=20120502 then
		tinsert(tbSayDialog, "Mua Hßa ThÞ BÝch /get_selloff")
		tinsert(tbSayDialog, "Xem sè l­îng cßn l¹i trong ngµy /get_infor")
	end
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang /do_nothing")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_selloff()
	local nTime = tonumber(date("%H%M"))
	if nTime < 0800 or nTime > 2400 then
		Talk(1,"","HiÖn t¹i ch­a ®Õn giê b¸n, ®¹i hiÖp h·y quay l¹i sau nha !!!")		
		return
	end
	local tbSayDialog = {};
	tinsert(tbSayDialog, "§ång ý /confirm_buy")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang /do_nothing")	
	Say("Ch­¬ng tr×nh khuyÕn m·i gi¸ rÎ", getn(tbSayDialog), tbSayDialog);
end
function get_infor()
	proday:load()
	local nNumremain = 0
	local nDate = tonumber(date("%Y%m%d"))
	if nDate ~= proday.tList["baothienthach"][2] then
		nNumremain = 500
	else
		nNumremain = proday.tList["baothienthach"][1]
	end
	Talk(1,"","Sè l­îng cßn cã thÓ mua trong ngµy hiÖn t¹i lµ: "..nNumremain.." c¸i")	
end

function confirm_buy()
	proday:load()
	---------------------------------
	local nDate = tonumber(date("%Y%m%d"))
	local nTime = GetTime()
	print(proday.tList["baothienthach"][2])
	if nDate ~= proday.tList["baothienthach"][2] then
		proday.tList["baothienthach"][1] = 500
	end
	
	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
		Talk(1,"","NhiÒu ng­êi mua qu¸, cho ta nghØ mÖt mét tÝ. H·y quay l¹i sau "..nTimeRemain.." gi©y n÷a !!!")
		return
	end
	---------------------------------
	if proday.tList["baothienthach"][1] <= 0 then
		Talk(1,"","ThËt ®¸ng tiÕc! §· hÕt hµng gi¶m gi¸ råi. Ngµy mai ®¹i hiÖp nhí ghÐ sím nhÐ  !!!")
		return
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ mua !!!")
		return
	end
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"","HiÖn kh«ng cã ®ñ Xu, ®¹i hiÖp vui lßng quay l¹i vµo lóc kh¸c!")
		return
	end

	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
	proday:register()
	if DelItem(2, 1, 30230, 500) == 1  then
--		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua Hßa ThÞ BÝch", 7*24*60*60)
		Talk(1,"","C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
		Msg2Player("C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
	--	AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· mua thµnh c«ng 1 Bao Thiªn Th¹ch Tinh Th¹ch víi gi¸ rÎ.")
	end
end

function do_nothing()

end
