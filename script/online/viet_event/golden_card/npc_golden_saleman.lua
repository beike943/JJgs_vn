Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
--Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua");
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
GOLDENCARD_PRICE = 2400
szName = "<color=green>Hoµng Kim Th­¬ng Nh©n<color> :"

golden_code = {
	fileName = "data/golden_code/code.txt",
	count = 0,
	listFormat = "(.+)	(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	golden_code.fileName = "data\\golden_code\\"..GetGlbValue(GLB_TSK_SERVER_ID)..".txt";
else
	golden_code.fileName = "data/golden_code/"..GetGlbValue(GLB_TSK_SERVER_ID)..".txt";
end

function get_linux_id()
	if SubWorldID2Idx(300) >= 0 then
		return 1
	elseif SubWorldID2Idx(200) >= 0 then
		return 2
	elseif SubWorldID2Idx(100) >= 0 then
		return 3
	elseif SubWorldID2Idx(350) >= 0 then
		return 4
	elseif SubWorldID2Idx(150) >= 0 then
		return 5
	else
		return 0
	end
end

function golden_code:load()
	local pf = openfile(self.fileName, "r");
	if not pf then 
		golden_code:save()
		return
	end
	
	local str =""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,code, sid, lid = strfind(str, self.listFormat);
		if tonumber(sid) == GetGlbValue(GLB_TSK_SERVER_ID) and tonumber(lid) == get_linux_id()  then
			self.count = self.count + 1;			
			self.tList[self.count] = tostring(code);			
		end
	end

	closefile(pf);
end

function golden_code:save()
	local pf = openfile(self.fileName, "w");
	if not pf then return end
	local serverid = GetGlbValue(GLB_TSK_SERVER_ID) 
	local lid = get_linux_id()
	
	for i=1,getn(self.tList) do
		write(pf, format("%s	%d	%d\n", self.tList[i],serverid, lid));
	end
	closefile(pf);
end

function golden_code:substract()		
		if self.count >= 1 then
			tremove(self.tList,1)
			self:save();
			return 1
		end
		return 0
end

function main()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(1023)
	if random(1,100) <= 10 then
		NpcChat(GetTargetNpc(),"Ta míi gom ®­îc c¸c vËt phÈm tr©n quý, mêi ®ång ®¹o ghÐ mua!")
	end
	local tSay = 	{}
	if nDate >= 120404 and nDate <= 120408 and nNation == 70 then
		tinsert(tSay, "Ta muèn nhËn phÇn th­ëng §ua Top ChuyÓn Sinh 1/get_award_CS1")
	end
	--tinsert(tSay, "Cöa hiÖu LÖnh Bµi Hoµng Kim/#get_card(1)")
	if nDate >= 121129 then
		tinsert(tSay, "Cöa hiÖu LÖnh Bµi L«i Hæ/#get_card(2)")
	end
	tinsert(tSay,"Ta muèn mua vËt phÈm Vâ L©m Hoµng Kim LÖnh (tiªu hao Vµng)/#buy_HKL(1)")
	tinsert(tSay,"Ta muèn mua vËt phÈm Vâ L©m Hoµng Kim LÖnh (tiªu hao Xu VËt PhÈm)/#buy_HKL(2)")			
	tinsert(tSay, "Ta chØ ghÐ qua!/hklb_DoNothing")	
	
	Say(szName.."Chµo ®¹i hiÖp, t¹i h¹ cã b¸n <color=yellow>LÖnh Bµi B¹ch Kim vµ c¸c vËt phÈm<color> næi tiÕng trong vâ l©m víi gi¸ cùc rÎ. Mêi ®¹i hiÖp xem qua!",getn(tSay),tSay)
end

function get_card(nSelect)
	local nDate = tonumber(date("%y%m%d"))
	local tSay = 	{}	
	
	if nSelect == 1 then
		tinsert(tSay, "Cöa hiÖu LÖnh Bµi Hoµng Kim/get_golden_card")
		tinsert(tSay, "Ta muèn ®æi 2400 Xu vËt phÈm vµ 200000 ®iÓm tÝch lòy lÊy ChiÕn T­îng nguyªn so¸i/get_zhanxiang")
		if nDate >= 110307 and nDate <= 110311 then
			tinsert(tSay, "Ta muèn ®æi ChiÕn T­îng nguyªn so¸i cò lÊy con míi/change_zhanxiang")
		end
		tinsert(tSay, "Ta muèn ®æi ®iÓm tÝch lòy/ChangeAccumulate")
		tinsert(tSay, "Cöa Hµng Vâ L©m TiÒn Bèi/ChangeVLTBShop")
		tinsert(tSay, "Ta muèn mua 1 bé Ngo¹i Trang Tø Linh/get_cloth_tulinh")	
		tinsert(tSay, "Ta chØ ghÐ qua!/hklb_DoNothing")	
		Say(szName.."Chµo ®¹i hiÖp, t¹i h¹ cã b¸n <color=yellow>LÖnh Bµi Hoµng Kim vµ c¸c vËt phÈm<color> næi tiÕng trong vâ l©m víi gi¸ cùc rÎ. Mêi ®¹i hiÖp xem qua!",getn(tSay),tSay)
	else
		tinsert(tSay, "§æi ®iÓm tÝch lòy (tèn 2 xu vËt phÈm + 22222222 ®iÓm kinh nghiÖm)/#ChangeAccumulateBKL(1)")
		tinsert(tSay, "§æi ®iÓm tÝch lòy (tèn 2 m¶nh thiªn cang + 2 m¶nh thiªn m«n + 22 méc r­¬ng + 22 vµng)/#ChangeAccumulateBKL(2)")
		tinsert(tSay, "Cöa Hµng TuyÖt ThÕ Cao Nh©n/ChangeVLTBShopBKL")
		tinsert(tSay, "Më khãa L¨ng Ba Vi Bé toµn tËp (tiªu hao 2 Cöu Thiªn V« Cùc §¬n)/Unlocl_LangBa_BKL")
		tinsert(tSay, "Ta chØ ghÐ qua!/hklb_DoNothing")	
		Say(szName.."Chµo ®¹i hiÖp, t¹i h¹ cã b¸n <color=yellow>C¸c vËt phÈm<color> næi tiÕng trong vâ l©m víi gi¸ cùc rÎ. Mêi ®¹i hiÖp xem qua!",getn(tSay),tSay)
	end
	
	
end
function get_golden_card()
--	if GetLevel() < 77 then 
--		Talk(1,"",szName.."LÖnh Bµi Hoµng Kim lµ vËt quý cña vâ l©m, t¹i h¹ kh«ng thÓ tïy tiÖn b¸n ®­îc. §¹i hiÖp ph¶i cã ®¼ng cÊp 77 trë lªn míi cã thÓ mua!")
--		return
--	end
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 120229 then
		Talk(1,"","TÝnh n¨ng nµy t¹m ®ãng !")
		return
	end
	if nDate >= 120210 and nDate <= 120229 then
		GOLDENCARD_PRICE = 600
	end
	golden_code:load()
	local tSay = 	{}
--	if nDate <= 110331 then
	tinsert(tSay, "Ta muèn mua 1 LÖnh Bµi Hoµng Kim (cÇn "..GOLDENCARD_PRICE.." vËt phÈm Xu)/confirm_get_golden_card")
--	end
	tinsert(tSay, "KiÓm tra LÖnh Bµi Hoµng Kim ®· mua/check_golden_code")
	tinsert(tSay, "Ta sÏ mua sau/hklb_DoNothing")
						
	Say(szName.."T¹i h¹ b¸n <color=yellow>LÖnh Bµi Hoµng Kim<color> gi¸ <color=red>"..GOLDENCARD_PRICE.." Xu<color> ®Õn khi hÕt hµng. HiÖn t¹i cßn <color=yellow>"..golden_code.count.." LÖnh Bµi Hoµng Kim<color>. Do sè ng­êi ®Æt mua rÊt nhiÒu nªn t¹i h¹ chØ cã thÓ b¸n cho ®¹i hiÖp tèi ®a <color=yellow>2 LÖnh Bµi Hoµng Kim<color>!",getn(tSay),tSay)
end

function confirm_get_golden_card()
--	if GetLevel() < 77 then 
--		Talk(1,"",szName.."LÖnh Bµi Hoµng Kim lµ vËt quý cña vâ l©m, t¹i h¹ kh«ng thÓ tïy tiÖn b¸n ®­îc. §¹i hiÖp ph¶i cã ®¼ng cÊp 77 trë lªn míi cã thÓ mua!")
--		return
--	end
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate > 20101219 then
--		Talk(1,"",szName.."LÖnh Bµi Hoµng Kim ®ît nµy chØ b¸n ®Õn hÕt ngµy 19/12/2010. Mêi ®¹i hiÖp ghÐ mua lÇn sau nhÐ!")
--		return
--	end
	if GetTask(TSK_BUY_GOLDEN_CARD) >= 2 then
		Talk(1,"",szName.."§¹i hiÖp ®· mua 2 LÖnh Bµi Hoµng Kim råi. Mêi ®¹i hiÖp ghÐ mua lÇn sau nhÐ!")
		return
	end	
	golden_code:load()
	if  golden_code.count <= 0 then
		Talk(1,"",szName.."ThËt ®¸ng tiÕc! T¹i h¹ võa b¸n hÕt LÖnh Bµi Hoµng Kim råi. Mêi ®¹i hiÖp ghÐ mua lÇn sau nhÐ!")
		return
	end
	if GetItemCount(2,1,30230) < GOLDENCARD_PRICE then
		Talk(1,"",szName.."§¹i hiÖp h×nh nh­ kh«ng mang ®ñ "..GOLDENCARD_PRICE.." tiÒn Xu th× ph¶i?")
		return
	end
	local nSec = random(5,100)
	CastState("state_fetter",1,nSec*18)
	ProgressSlot(nSec*18);	--5Ãë
	Msg2Player("§ang truy xuÊt d÷ liÖu, vui lßng chê gi©y l¸t...")
end

function OnProgressCallback()
	if GetTask(TSK_BUY_GOLDEN_CARD) >= 2 then
		Talk(1,"",szName.."§¹i hiÖp ®· mua 2 LÖnh Bµi Hoµng Kim råi. Mêi ®¹i hiÖp ghÐ mua lÇn sau nhÐ!")
		return
	end
	if GetItemCount(2,1,30230) < GOLDENCARD_PRICE then
		Talk(1,"",szName.."§¹i hiÖp h×nh nh­ kh«ng mang ®ñ "..GOLDENCARD_PRICE.." tiÒn Xu th× ph¶i?")
		return
	end
	golden_code:load()
	if  golden_code.count <= 0 then
		Talk(1,"",szName.."ThËt ®¸ng tiÕc! T¹i h¹ võa b¸n hÕt LÖnh Bµi Hoµng Kim råi. Mêi ®¹i hiÖp ghÐ mua lÇn sau nhÐ!")
		return
	end
	if DelItem(2,1,30230,GOLDENCARD_PRICE) == 1 then
		local szCode = golden_code.tList[1]
		if golden_code:substract() == 1 then
			SetTask(TSK_BUY_GOLDEN_CARD,GetTask(TSK_BUY_GOLDEN_CARD) + 1)
			local szCodeSold = CustomDataRead("code_hklb") or ""
			if szCodeSold == "" then
				szCodeSold = szCode
			else
				szCodeSold = szCodeSold.." "..szCode
			end
			CustomDataSave("code_hklb","s",szCodeSold)
			Talk(1,"",szName.."Chóc mõng ®¹i hiÖp ®· mua thµnh c«ng. M· thÎ LÖnh Bµi Hoµng Kim cña ®¹i hiÖp lµ: <color=yellow>"..szCode.."<color>. <color=red>L­u ý: nÕu ®¹i hiÖp nhËp m· vµo tµi kho¶n t¹o tr­íc ngµy 14/06/2011, ®¹i hiÖp sÏ lµ Vâ L©m TiÒn Bèi. NÕu nhËp m· vµo tµi kho¶n t¹o sau ngµy 14/06/2011, ®¹i hiÖp sÏ lµ ThiÕu Niªn Anh Hïng.<color>. Chi tiÕt cña ho¹t ®éng vui lßng xem t¹i trang chñ <color=green>http://volam2.zing.vn<color>.")			
			WriteLogEx("Ban HKLB","mua code",1,szCode)
		end
	end	
end

function get_cloth_tulinh()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20111231 then
		Talk(1,"",szName.."Bæn trang chØ b¸n vËt phÈm nµy ®Õn hÕt ngµy 31 th¸ng 12 n¨m 2011, ®¹i hiÖp vui lßng quay l¹i vµo lóc kh¸c!")
		return
	end
	local tSay = {}
	local szHeader = "Bæn trang hiÖn cã c¸c lo¹i trang phôc sau, mêi ®¹i hiÖp chän:"

	tinsert(tSay, "Ta muèn mua Tø Linh ViÖt Phôc ngo¹i trang (Vµng) (gi¸ 2400 vËt phÈm Xu, theo giíi tÝnh)/#confirm_get_cloth_tulinh(0)")
	tinsert(tSay, "Ta muèn mua Tø Linh ViÖt Phôc ngo¹i trang (Xanh) (gi¸ 2400 vËt phÈm Xu, theo giíi tÝnh)/#confirm_get_cloth_tulinh(8)")
	tinsert(tSay, "Ta muèn mua Tø Linh ViÖt Phôc ngo¹i trang (TÝm) (gi¸ 2400 vËt phÈm Xu, theo giíi tÝnh)/#confirm_get_cloth_tulinh(4)")
	tinsert(tSay, "Quay trë vÒ trang tr­íc/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function confirm_get_cloth_tulinh(nType)
	local nBody = GetBody()
	if GetItemCount(2,1,30230) < 2400 then
		Talk(1,"",szName.."HiÖn kh«ng cã ®ñ Xu, ®¹i hiÖp vui lßng quay l¹i vµo lóc kh¸c!")
		return
	end
	if gf_Judge_Room_Weight(4, 200, szName) == 0 then
		return
	end
	if DelItem(2,1,30230,2400) == 1 then
		gf_AddItemEx2({0, 108, 30000 + nBody + nType, 1}, "Tø Linh M·o", "Ban ngoai trang Tu Linh", "nhËn lo¹i "..nType, 60 * 24 * 3600)
		gf_AddItemEx2({0, 109, 30000 + nBody + nType, 1}, "Tø Linh Y", "Ban ngoai trang Tu Linh", "nhËn lo¹i "..nType, 60 * 24 * 3600)
		gf_AddItemEx2({0, 110, 30000 + nBody + nType, 1}, "Tø Linh Trang", "Ban ngoai trang Tu Linh", "nhËn lo¹i "..nType, 60 * 24 * 3600)
		Talk(1,"",szName.."§¹i hiÖp ®· mua thµnh c«ng ngo¹i trang Tø Linh!")
	end
end

function check_golden_code()
	local szCode = CustomDataRead("code_hklb") or ""
	if szCode == "" then
		Talk(1,"",szName.."§¹i hiÖp ch­a mua ë chç t¹i h¹ LÖnh Bµi Hoµng Kim nµo! §¹i hiÖp cã ch¾c ®· mua råi kh«ng?")
		return
	end
	Talk(1,"",szName.."LÖnh Bµi Hoµng Kim cña ®¹i hiÖp lµ: <color=yellow>"..szCode.."<color>. <color=red>L­u ý: nÕu ®¹i hiÖp nhËp m· vµo tµi kho¶n t¹o tr­íc ngµy 14/06/2011, ®¹i hiÖp sÏ lµ Vâ L©m TiÒn Bèi. NÕu nhËp m· vµo tµi kho¶n t¹o sau ngµy 14/06/2011, ®¹i hiÖp sÏ lµ ThiÕu Niªn Anh Hïng.<color>. Chi tiÕt cña ho¹t ®éng vui lßng xem t¹i trang chñ <color=green>http://volam2.zing.vn<color>.")
end

function get_zhanxiang()
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        	return 0
    	end
    
    	if GetItemCount(2, 1, 30230) < 2400 or (GetTask(704) ~= 6 and GetTask(704) ~= -6) or GetTask(707) < 200000 then
    		Talk(1, "", "VËt phÈm Xu, ®iÓm tÝch lòy hoÆc qu©n hµm cña c¸c h¹ ch­a ®ñ ®Ó ®æi!")
    		return 0
    	end
    	
    	if DelItem(2, 1, 30230, 2400) == 1 then
    		SetTask(707, GetTask(707) - 200000)
    		gf_AddItemEx2({0, 105, 30033, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn T­îng", "Hoang Kim Thuong Nhan", "mua ChiÕn T­îng nguyªn so¸i", 90 * 24 * 3600)
    	end
end

function change_zhanxiang()
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        	return 0
    	end
    	
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nMountIndex = GetPlayerEquipIndex(10)
	
	if GetTask(704) ~= 6 and GetTask(704) ~= -6 then
    		Talk(1, "", "Qu©n hµm cña c¸c h¹ kh«ng ph¶i lµ nguyªn so¸i nªn kh«ng thÓ ®æi!")
    		return 0
    	end 
	
	if nMountIndex == 0 or nG ~= 0 or nD ~= 105 or nP ~= 30033 then
		Talk(1, "", "Vui lßng trang bÞ ChiÕn T­îng nguyªn so¸i ®Ó ®æi!")
    		return 0
	end
	
	for i = 1, 3 do
		local nAttr,nLv = GetItemAttr(nMountIndex, i)
		if nAttr ~= 0 and nLv ~= 0 then
			Talk(1, "", "ChiÕn T­îng nguyªn so¸i nµy ®· cã tèc ®é di chuyÓn, kh«ng thÓ dïng ®Ó ®æi!")
    			return 0
		end
	end
	
	local nExpire = GetItemExpireTime(nMountIndex) + (60 * 24 * 3600)
	if nExpire <= 0 or nExpire == nil then
		nExpire = 90 * 24 * 3600
	end
	UnEquipAtPosition(10)
	if DelItemByIndex(nMountIndex, -1) == 1 then
		gf_AddItemEx2({0, 105, 30033, 1, 4, -1, -1, -1, -1, -1, -1}, "ChiÕn T­îng", "Hoang Kim Thuong Nhan", "®æi ChiÕn T­îng nguyªn so¸i", nExpire)
	end
end
-- §æi ®iÓm kinh nghiÖm lÊy ®iÓm tÝch lòy 
function ChangeAccumulate()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	if GetLevel() < 74 then
		Talk(1,"","Level cña b¹n d­íi 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i")
		return 0
	end
	-- KiÓm tra kÝch ho¹t hoµng kim lÖnh bµi ch­a
	if CheckActivated() ~= 2 then
		Talk(1,"","B¹n kh«ng ph¶i Vâ l©m tiÒn bèi")
		return 0
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nDay = mod(GetTask(TSK_HKLB_POINT),1000000)	
	--local nSel = floor(GetTask(TSK_HKLB_POINT)/1000000)
	
	if nDate ~= nDay then
		SetTask(TSK_HKLB_POINT,nDate)
	end
	
--	if nSel >= 5 then
--		Talk(1,"","H«m nay b¹n ®· ®æi h¬n 5 ®iÓm tÝch lòy.")
--		return 0
--	end
	
	local tSay = 	{}	
	tinsert(tSay, "Ta muèn ®æi 1 ®iÓm tÝch lòy/#DoChangeAccumulate(1)")
	tinsert(tSay, "Ta muèn ®æi 5 ®iÓm tÝch lòy/#DoChangeAccumulate(5)")
	tinsert(tSay, "Xem ®iÓm tÝch lòy/DisplayPoint")
	tinsert(tSay, "Quay l¹i trang tr­íc  /main")		
	Say("Ta muèn ®æi ®iÓm tÝch lòy. ", getn(tSay)  ,tSay)
	
end
------

function DoChangeAccumulate(nzType)
	-- Dù ®o¸n fix lçi hack shop vâ l©m tiÒn bèi
		if  IsPlayerDeath() ~= 0 then
			Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
			return
		end
	local nSel = floor(GetTask(TSK_HKLB_POINT)/1000000)
	if nSel >= 5 then
			Talk(1,"","H«m nay ®¹i hiÖp ®· ®æi h¬n 5 ®iÓm tÝch lòy.")
			return 0
	end
	
	if nzType == 1 then
		if GetExp() < 20000000 then
			Talk(1,"","§¹i hiÖp ch­a ®ñ ®iÓm kinh nghiÖm ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		ModifyExp(-20000000)
		SetTask(TSK_HKLB_POINT, GetTask(TSK_HKLB_POINT)+ 1000000)
		SetTask(TSK_HKLB_REWARD , GetTask(TSK_HKLB_REWARD) + 1)
		Msg2Player("§¹i hiÖp ®· nhËn ®­îc  1 ®iÓm tÝch lòy")
	end
	
	if nzType == 5 then
		if nSel >= 1 then
			Talk(1,"","B¹n kh«ng ®ñ ®iiÒu kiÖn ®æi 5 ®iÓm tÝch lòy h«m nay")
			return 0
		end
		if GetExp() < 5*20000000 then
			Talk(1,"","§¹i hiÖp ch­a ®ñ ®iÓm kiinh nghiÖm ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		ModifyExp(-5*20000000)
		SetTask(TSK_HKLB_POINT, GetTask(TSK_HKLB_POINT)+ 5000000)
		SetTask(TSK_HKLB_REWARD , GetTask(TSK_HKLB_REWARD) + 5)
		Msg2Player("§¹i hiÖp ®· nhËn ®­îc  5 ®iÓm tÝch lòy")
	end
	
end


function ChangeVLTBShop()
	
	if GetLevel() < 74 then
		Talk(1,"","Level cña b¹n d­íi 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i")
		return 0
	end
	-- KiÓm tra kÝch ho¹t hoµng kim lÖnh bµi ch­a
	if CheckActivated() ~= 2 then
		Talk(1,"","B¹n kh«ng ph¶i Vâ l©m tiÒn bèi")
		return 0
	end
	
	local tSay = 	{}	
	tinsert(tSay, "§æi §inh Hån Thiªn Th¹ch ThÇn Th¹ch/#ChangeVLTBShopType(1)")
	tinsert(tSay, "§æi L¨ng Ba Vi Bé/#ChangeVLTBShopType(2)")
	tinsert(tSay, "§æi 8 N÷ Oa Tinh Th¹ch /#ChangeVLTBShopType(3)")	
	tinsert(tSay, "§æi Nãn S­ M«n 4/#ChangeVLTBShopType(4)")
	tinsert(tSay, "§æi Aã S­ M«n 4 /#ChangeVLTBShopType(5)")
	tinsert(tSay, "§æiQuÇn S­ M«n 4 /#ChangeVLTBShopType(6)")	
	tinsert(tSay, "§æi Trang Søc 1 S­ M«n 4 /#ChangeVLTBShopType(7)")
	tinsert(tSay, "§æiTrang Søc 2 S­ M«n 4 /#ChangeVLTBShopType(8)")	
	tinsert(tSay, "§æi 3 Thiªn Th¹ch Qu¸i Th¹ch /#ChangeVLTBShopType(9)")
	tinsert(tSay, "§æi Thiªn Th¹ch Linh Th¹ch /#ChangeVLTBShopType(10)")
	tinsert(tSay, "§æi 5  Phi Yªn Th¹ch /#ChangeVLTBShopType(11)")
	tinsert(tSay, "Quay l¹i trang tr­íc /main")
	
	Say("Cöa Hµng Vâ L©m TiÒn Bèi. ", getn(tSay),tSay)
end

function ChangeVLTBShopType(nType)
		if gf_Judge_Room_Weight(8, 500, "Hoµng Kim Th­¬ng Nh©n : ") == 0 then
			return
		end
		
		if (gf_GetTaskBit(TSK_HKLB_EXCHANGE, nType) == 1) then
			Talk(1,"","B¹n ®· ®æi vËt phÈm nµy råi")
			return 0
		end
		
		if  (GetTask(TSK_HKLB_REWARD) >= tbChangeAccumulateVLTB[nType][1])  then
			SetTask(TSK_HKLB_REWARD, GetTask(TSK_HKLB_REWARD) - tbChangeAccumulateVLTB[nType][1])
			if ( nType < 4 ) or (nType > 8 ) then
				gf_AddItemEx2(tbChangeAccumulateVLTB[nType][3], tbChangeAccumulateVLTB[nType][2], szHKLBLogHeader,szHKLBLogAction, tbChangeAccumulateVLTB[nType][4])
				Msg2Player("B¹n nhËn ®­îc "..tbChangeAccumulateVLTB[nType][3][4].." "..tbChangeAccumulateVLTB[nType][2])
			else
				Confirm_make_shimen_tier4HKLB(nType-3)
			end 
			gf_SetTaskBit(TSK_HKLB_EXCHANGE, nType,1)
		else
			Talk(1,"","B¹n kh«ng ®ñ ®iÓm tÝch lòy.")
		end
end

function DisplayPoint()
	Talk(1,"","§iÓm tÝch lòy cña b¹n "..GetTask(TSK_HKLB_REWARD))
end

function buy_HKL(nSelected)
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead ="HiÖn t¹i chç cña ta cã b¸n Vâ L©m Hoµng Kim LÖnh"
	if nSelected == 1 then
		tinsert(tbSayDialog,"Ta muèn mua 1 Vâ L©m Hoµng Kim LÖnh (8 vµng)/#confirm_buy_HKL(1)")
		tinsert(tbSayDialog,"Ta muèn mua 10 Vâ L©m Hoµng Kim LÖnh (80 vµng)/#confirm_buy_HKL(2)")	
		tinsert(tbSayDialog,"Ta muèn mua 100 Vâ L©m Hoµng Kim LÖnh(800 vµng)/#confirm_buy_HKL(3)")
		tinsert(tbSayDialog,"T¹i h¹ chØ ghÐ ngang!/main")
	end
	if nSelected == 2 then
		tinsert(tbSayDialog,"Ta muèn mua 1 Vâ L©m Hoµng Kim LÖnh (2 Xu vËt phÈm)/#confirm_buy_HKL(4)")
		tinsert(tbSayDialog,"Ta muèn mua 10 Vâ L©m Hoµng Kim LÖnh (20 Xu vËt phÈm)/#confirm_buy_HKL(5)")	
		tinsert(tbSayDialog,"Ta muèn mua 100 Vâ L©m Hoµng Kim LÖnh(200 Xu vËt phÈm)/#confirm_buy_HKL(6)")
		tinsert(tbSayDialog,"T¹i h¹ chØ ghÐ ngang!/main")
	end
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

tbHKLPrice = {
	[1] = {80000, 0, 1},
	[2] = {800000, 0, 10},
	[3] = {8000000, 0, 100},
	[4] = {0, 2, 1},
	[5] = {0, 20, 10},
	[6] = {0, 200, 100},
}

function confirm_buy_HKL(nSelected)
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","Hµnh trang khång ®ñ « trèng hoÆc ®é nÆng")
		return
	end
	if GetCash() < tbHKLPrice[nSelected][1] then
		Talk(1, "", "B¹n kh«ng mang theo ®ñ Vµng!")
		return
	end
	if GetItemCount(2, 1, 30230) < tbHKLPrice[nSelected][2] then
		Talk(1, "", "B¹n kh«ng mang theo ®ñ Xu vËt phÈm!")
		return
	end
	
	if nSelected <= 3 then
		Pay(tbHKLPrice[nSelected][1])
	else
		DelItem(2, 1, 30230, tbHKLPrice[nSelected][2])
	end

	gf_AddItemEx2({2,1,30284,tbHKLPrice[nSelected][3]}, "Hoµng Kim LÖnh", "MUA HOANG KIM LENH", "thµnh c«ng")
end

-- §æi ®iÓm kinh nghiÖm lÊy ®iÓm tÝch lòy 
function ChangeAccumulateBKL(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	if GetLevel() < 74 then
		Talk(1,"","Level cña b¹n d­íi 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i")
		return 0
	end
	-- KiÓm tra kÝch ho¹t b¹ch kim lÖnh bµi ch­a
	if CheckActivatedExt_BKL() ~= 2 then
		Talk(1,"","B¹n kh«ng ph¶i TuyÖt ThÕ Cao Nh©n")
		return 0
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nDay = mod(GetTask(TSK_BKLB_POINT),1000000)	
	--local nSel = floor(GetTask(TSK_BKLB_POINT)/1000000)
	
	if nDate ~= nDay then
		SetTask(TSK_BKLB_POINT,nDate)
	end
	
--	if nSel >= 5 then
--		Talk(1,"","H«m nay b¹n ®· ®æi h¬n 5 ®iÓm tÝch lòy.")
--		return 0
--	end
	
	local tSay = 	{}	
	tinsert(tSay, "Ta muèn ®æi 1 ®iÓm tÝch lòy/#DoChangeAccumulateBKL("..nType..",1)")
	tinsert(tSay, "Ta muèn ®æi 5 ®iÓm tÝch lòy/#DoChangeAccumulateBKL("..nType..",2)")
	tinsert(tSay, "Ta muèn ®æi 50 ®iÓm tÝch lòy/#DoChangeAccumulateBKL("..nType..",5)")
--	tinsert(tSay, "Ta muèn ®æi 100 ®iÓm tÝch lòy/#DoChangeAccumulateBKL(3)")
--	tinsert(tSay, "Ta muèn ®æi 200 ®iÓm tÝch lòy/#DoChangeAccumulateBKL(4)")
--	tinsert(tSay, "Ta muèn ®æi 500 ®iÓm tÝch lòy/#DoChangeAccumulateBKL(6)")
	
	tinsert(tSay, "Xem ®iÓm tÝch lòy/DisplayPointBKL")
	tinsert(tSay, "Quay l¹i trang tr­íc  /main")		
	Say("Ta muèn ®æi ®iÓm tÝch lòy. ", getn(tSay)  ,tSay)
	
end
function DisplayPointBKL()
	Talk(1,"","§iÓm tÝch lòy cña b¹n "..GetTask(TSK_BKLB_REWARD))
end
tbChange = {
		[1] = {1, 0, 2},
		[2] = {5, 0, 10},
		[3] = {100, 0, 200},
		[4] = {200, 0, 400},
		[5] = {50, 0, 100},
		[6] = {500, 0, 1000},
	}
function DoChangeAccumulateBKL(nType, nzType) --nType: lo¹i tiªu hao, nzType: lo¹i ®iÓm ®æi
	-- Dù ®o¸n fix lçi hack shop vâ l©m tiÒn bèi
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
	end
	local nSel = floor(GetTask(TSK_BKLB_POINT)/1000000)
	if nSel + tbChange[nzType][1] > 856 then
			Talk(1,"","Mçi ngµy chØ ®æi ®­îc 856 ®iÓm tÝch lòy.")
			return 0
	end
	if nType == 1 then
		if GetExp() < tbChange[nzType][1] * 22222222 then
			Talk(1,"","§¹i hiÖp ch­a ®ñ ®iÓm kinh nghiÖm ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		if GetItemCount(2,1,30230) < tbChange[nzType][3] then
			Talk(1,"","§¹i hiÖp kh«ng cã ®ñ Xu vËt phÈm ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30390) < 2*tbChange[nzType][1] then		--m¶nh thiªn cang
			Talk(1,"","§¹i hiÖp kh«ng cã ®ñ M¶nh thiªn cang ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		if GetItemCount(2,1,30410) < 2*tbChange[nzType][1] then
			Talk(1,"","§¹i hiÖp kh«ng cã ®ñ M¶nh Thiªn M«n ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		if GetItemCount(2,1,30340) < 22*tbChange[nzType][1] then
			Talk(1,"","§¹i hiÖp kh«ng cã ®ñ Méc R­¬ng ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
		if GetCash() < 220000*tbChange[nzType][1] then
			Talk(1,"","§¹i hiÖp kh«ng cã ®ñ Vµng ®Ó ®æi ®iÓm tÝch lòy")
			return 0
		end
	end
	local nCheckDel = 0
	if nType == 1 then
		DelItem(2,1,30230, tbChange[nzType][3])
		ModifyExp(-tbChange[nzType][1] * 22222222)
		nCheckDel = 1
		gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1, "§æi "..tbChange[nzType][1].."®iÓm theo huíng 2 xu + Exp")
	elseif nType == 2 then
		DelItem(2,1,30390, 2*tbChange[nzType][1])
		DelItem(2,1,30410, 2*tbChange[nzType][1])
		DelItem(2,1,30340, 22*tbChange[nzType][1])
		Pay(220000*tbChange[nzType][1])
		nCheckDel = 1
		gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1,  "§æi "..tbChange[nzType][1].."®iÓm theo huíng 2mtc + 2mtm + 22 m?c ruong + 22 vµng")
	end
	if nCheckDel == 1 then
		SetTask(TSK_BKLB_POINT, GetTask(TSK_BKLB_POINT)+ (tbChange[nzType][1] * 1000000)) --task ®æi ®iÓm trong ngµy
		SetTask(TSK_BKLB_REWARD , GetTask(TSK_BKLB_REWARD) + tbChange[nzType][1])	--task tæng ®iÓm
		Msg2Player("§¹i hiÖp ®· nhËn ®­îc "..tbChange[nzType][1].." ®iÓm tÝch lòy")
	 	gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1, "§iÓm tÝch lòy lo¹i "..tbChange[nzType][1])
	 end

end

function ChangeVLTBShopBKL()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
	end
	if GetLevel() < 74 then
		Talk(1,"","Level cña b¹n d­íi 74")
		return 0
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i")
		return 0
	end
	-- KiÓm tra kÝch ho¹t hoµng kim lÖnh bµi ch­a
	if CheckActivatedExt_BKL() ~= 2 then
		Talk(1,"","B¹n kh«ng ph¶i TuyÖt ThÕ Cao Thñ")
		return 0
	end
	
	local tSay = 	{}	
--	if GetExtPoint(1) == 1 then
--		tinsert(tSay, "§æi 45 Ch×a Khãa Vµng (480 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(28)")	
--	end
	tinsert(tSay, "§æi 50 Ch×a Khãa Vµng (1350 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(1)")	
	tinsert(tSay, "§æi Thá §en (400 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(2)")		
	tinsert(tSay, "§æi B¸o §en B¶o B¶o (600 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(3)")	
	tinsert(tSay, "§æi Tiªn Du KiÕm (600 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(4)")		
--	tinsert(tSay, "§æi Th­¬ng ¦ng §« Thèng - Nãn (290 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(7)")	
--	tinsert(tSay, "§æi Th­¬ng ¦ng §« Thèng - Aã (290 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(8)")	
--	tinsert(tSay, "§æi Th­¬ng ¦ng §« Thèng - QuÇn (290 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(9)")	
--	tinsert(tSay, "§æi Th­¬ng ¦ng Tiªn Phong - Phï (450 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(10)")	
--	tinsert(tSay, "§æi Th­¬ng ¦ng Tiªn Phong - Kú (450 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(11)")	
	tinsert(tSay, "§æi Thiªn Th¹ch Linh Th¹ch (660 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(5)")		
	tinsert(tSay, "§æi §inh Hån Thiªn Th¹ch ThÇn Th¹ch (880 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(6)")
	tinsert(tSay, "§æi §¹i §Þnh Hån lÇn 1 (1100 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(7)")		
	tinsert(tSay, "§æi 12 N÷ Oa Tinh Th¹ch (390 ®iÓm - kh«ng giao dÞch)/#ChangeVLTBShopTypeBKL(8)")		
--	tinsert(tSay, "§æi §inh Hån Thiªn Th¹ch ThÇn Th¹ch (150 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(9)")
	tinsert(tSay, "§æi 15 MËt tÞch m«n ph¸i 70 cao cÊp (100 ®iÓm - cã thÓ giao dÞch)/ChangeVLTBShopBKL_Mattich70")	---------- Bit 10	

	tinsert(tSay, "Trang kÕ /ChangeVLTBShopBKL2")
	tinsert(tSay, "Quay l¹i trang tr­íc /main")
	
	Say("Cöa Hµng Vâ L©m TiÒn Bèi. ", getn(tSay),tSay)
end

function ChangeVLTBShopBKL2()
	
	local tSay = 	{}		

	tinsert(tSay, "§æi ChuyÓn Sinh §¬n lÇn 1 (300 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(11)")	
	tinsert(tSay, "§æi L¨ng Ba Vi Bé (50 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(12)")	
	tinsert(tSay, "§æi 500 Ma Tinh (1650 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(13)")
	tinsert(tSay, "§æi 200 Cæ Linh Th¹ch (200 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(14)")
	tinsert(tSay, "§æi 200 Cæ Linh Ngäc (300 ®iÓm - kh«ng thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(15)")	
	tinsert(tSay, "§æi 10 C­êng Hãa QuyÓn CÊp 12 (110 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(16)")
	tinsert(tSay, "§æi 10 C­êng Hãa QuyÓn CÊp 13 (250 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(17)")
	tinsert(tSay, "§æi 10 C­êng Hãa QuyÓn CÊp 14 (550 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(18)")
	tinsert(tSay, "§æi 10 C­êng Hãa QuyÓn CÊp 15 (1200 ®iÓm - cã thÓ giao dÞch)/#ChangeVLTBShopTypeBKL(19)")	
	tinsert(tSay, "§æi Danh hiÖu TuyÖt ThÕ Cao Nh©n (200 ®iÓm - cã thÓ giao dÞch)/ChangeVLTBShopBKL_DanhHieu")			---------- Bit 120

	tinsert(tSay, "Quay l¹i trang tr­íc /ChangeVLTBShopBKL")
	Say("Cöa Hµng Vâ L©m TiÒn Bèi. ", getn(tSay),tSay)
end
--function ChangeVLTBShopTypeBKL_Select()
--	local nRoute = GetPlayerRoute()	
--	if nRoute == 2 then
--		local tSay = 	{}		
--		tinsert(tSay, "§æi Vò KhÝ  §ao (80 ®iÓm - kh«ng giao dÞch) /#ChangeVLTBShopTypeBKL_SelectType(1)")		
--		tinsert(tSay, "§æi Vò KhÝ  Bæng (80 ®iÓm - kh«ng giao dÞch) /#ChangeVLTBShopTypeBKL_SelectType(2)")		
--		Say("Cöa Hµng Vâ L©m TiÒn Bèi. ", getn(tSay),tSay)
--		return
--	else
--		ChangeVLTBShopTypeBKL(11)
--	end
--end
--function ChangeVLTBShopTypeBKL_SelectType(nType)
--	if  IsPlayerDeath() ~= 0 then
--			Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
--	return
--	end
--	if gf_Judge_Room_Weight(8, 500, "Hoµng Kim Th­¬ng Nh©n : ") == 0 then
--		return
--	end
--	
--	if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, 11) == 1) then
--		Talk(1,"","B¹n ®· ®æi vËt phÈm nµy råi")
--		return 0
--	end
--	if  GetTask(TSK_BKLB_REWARD) < 80  then
--			Talk(1,"","B¹n kh«ng ®ñ ®iÓm tÝch lòy.")
--			return
--	end
--	local nRoute = GetPlayerRoute()	
--	local nBody = GetBody();
--	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 80)
--	gf_AddItemEx2(tb_VK_SuMon_DB[nRoute][2][nBody][nType], tb_VK_SuMon_DB[nRoute][1], szBKLBLogHeader, "nhËn ®­îc")			
--	gf_SetTaskBit(TSK_BKLB_EXCHANGE, 11,1)
--end
function ChangeVLTBShopTypeBKL(nType)
		if  IsPlayerDeath() ~= 0 then
				Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
		end
		if gf_Judge_Room_Weight(15, 500, "Hoµng Kim Th­¬ng Nh©n : ") == 0 then
			return
		end
		if nType == 1 then
			if gf_Judge_Room_Weight(55, 500, "Hoµng Kim Th­¬ng Nh©n : ") == 0 then
				return
			end
		end
--		if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, nType) == 1) then
--			Talk(1,"","B¹n ®· ®æi vËt phÈm nµy råi")
--			return 0
--		end
		local nRoute = GetPlayerRoute()	
		local nBody = GetBody();
		if GetTask(TSK_BKLB_REWARD) >= tbChangeAccumulateVLTBBKL[nType][1] then
			SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - tbChangeAccumulateVLTBBKL[nType][1])
			gf_AddItemEx2(tbChangeAccumulateVLTBBKL[nType][3], tbChangeAccumulateVLTBBKL[nType][2], szBKLBLogHeader,szBKLBLogAction, tbChangeAccumulateVLTBBKL[nType][4])
			Msg2Player("B¹n nhËn ®­îc "..tbChangeAccumulateVLTBBKL[nType][3][4].." "..tbChangeAccumulateVLTBBKL[nType][2])		
			 gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1, "§æi thµnh c«ng lo¹i "..tbChangeAccumulateVLTBBKL[nType][2])	
--			if ( nType < 7 ) or (nType > 11 ) then
--				gf_AddItemEx2(tbChangeAccumulateVLTBBKL[nType][3], tbChangeAccumulateVLTBBKL[nType][2], szBKLBLogHeader,szBKLBLogAction, tbChangeAccumulateVLTBBKL[nType][4])
--				Msg2Player("B¹n nhËn ®­îc "..tbChangeAccumulateVLTBBKL[nType][3][4].." "..tbChangeAccumulateVLTBBKL[nType][2])
--			elseif nType == 7 or nType == 8 or nType == 9 then
--				local nGenre = 0
--				local szItemName = "Th­¬ng ¦ng §« Thèng "
--				local nID = 30028
--				local szPhe = "Tèng "
--				if GetTask(701) < 0 then
--					nID = 30040
--					szPhe = "Liªu "
--				end
--				if nType == 8 then
--					nGenre = 100
--					szItemName = szPhe .. szItemName .. "Gi¸p"
--				elseif nType == 9 then
--					nGenre = 101
--					szItemName = szPhe .. szItemName .. "Trang"
--				elseif nType == 7 then
--					nGenre = 103
--					szItemName = szPhe .. szItemName .. "Kh«i"
--				end
--				local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
--				LIB_Award.szLogTitle = szBKLBLogHeader
--				LIB_Award.szLogAction = "nhËn"
--				LIB_Award:Award(tbAward)
--				--gf_AddItemEx2(tb_VK_SuMon0[nRoute][2][nBody], tb_VK_SuMon0[nRoute][1], szBKLBLogHeader, "nhËn ®­îc")						
--			elseif nType == 10 or nType == 11 then
--				local szItemName = "Th­¬ng ¦ng Tiªn Phong "
--				local nID = 30043
--				local szPhe = "Tèng "
--				if GetTask(701) < 0 then
--					nID = 30079
--					szPhe = "Liªu "
--				end
--				
--				if nType == 11 then
--					szItemName = szPhe .. szItemName .. "Kú"
--				elseif nType == 10 then
--					szItemName = szPhe .. szItemName .. "Phï"
--					nID = nID + 4
--				end
--				local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
--				LIB_Award.szLogTitle = szBKLBLogHeader
--				LIB_Award.szLogAction = "nhËn"
--				LIB_Award:Award(tbAward)
--			end 
--			gf_SetTaskBit(TSK_BKLB_EXCHANGE, nType,1)
		else
			Talk(1,"","B¹n kh«ng ®ñ ®iÓm tÝch lòy.")
			return
		end
end

function get_award_CS1()
	local tbPhanThuongCS1 ={
		[1] = {"c0000099999", "Ibrahim"},
		[2] = {"thinhdance18", "zS2zHDCafe"},
		[3] = {"motcuocdoituoidep", "VangBãngMétThêi"},
		[4] = {"soemden007", "xIPhuDuIx"},
		[5] = {"heomoiquay6699", "TrumMaFiA"},
		[6] = {"riverplate6868", "zzTieuLongNuzz"},
		[7] = {"zkhoaipro", "zKhoaiProz"},
}
local VD =
	{
		{0,103,8000,"Viªm §Õ Kh«i"},
		{0,100,8000,"Viªm §Õ Gi¸p"},
		{0,101,8000,"Viªm §Õ Trang"},
	}
	if GetTask(2701) == 1 then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi !!!")
		return
	end
	if gf_Judge_Room_Weight(4,100, "PhÇn th­ëng ®ua TOP") == 0 then
		return
	end
	local nCheckHaveList = 0
	local nHaveInList = 0
	local nLv = 0
	for i = 1, getn(tbPhanThuongCS1) do
		if GetAccount() == tbPhanThuongCS1[i][1] or GetName() == tbPhanThuongCS1[i][2] then
			nCheckHaveList = nCheckHaveList + 1
			nHaveInList = i
		end
	end

	if nCheckHaveList == 0 then
		Talk(1, "", "B¹n kh«ng cã tªn trong danh s¸ch nhËn th­ëng !!!")
		return	
	end
	if GetTask(1538) < 1 then
		Talk(1, "", "B¹n ch­a hoµn thµnh viÖc ®ua TOP nªn kh«ng thÓ nhËn th­ëng !!!")
		return	
	end
	if GetTask(2701) == 0 and GetGlbValue(1023) == 70 and GetAccount() == tbPhanThuongCS1[nHaveInList][1] and GetName() == tbPhanThuongCS1[nHaveInList][2] then
		Msg2Player("B¹n ®· nhËn phÇn th­ëng ®ua TOP cña ChuyÓn Sinh 1 thµnh c«ng !!!")
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng ®ua TOP cña ChuyÓn Sinh 1 thµnh c«ng !!!")
		SetTask(2701, 1)
		WriteLogEx("DUA TOP CS1 THANH LONG", "nhËn thµnh c«ng")
		if nHaveInList >= 1 and nHaveInList <= 3 then
			nLv = 12
		elseif nHaveInList >= 4 and nHaveInList <= 10 then
			nLv = 9
		elseif nHaveInList >= 11 and nHaveInList <= 19 then
			nLv = 7
		else
			nLv = 0
		end
		local nBody = GetBody()
		for i = 1 , getn(VD) do
			gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"DUA TOP CS1 THANH LONG","nhËn")
		end
	end
end
function ChangeVLTBShopBKL_Mattich70()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
	end
	if gf_Judge_Room_Weight(16, 100, "Hoµng Kim Th­¬ng Nh©n : ") == 0 then
		return
	end
	
--	if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, 10) == 1) then
--		Talk(1,"","B¹n ®· ®æi vËt phÈm nµy råi")
--		return 0
--	end
	if GetTask(TSK_BKLB_REWARD) < 100  then
			Talk(1,"","B¹n kh«ng ®ñ ®iÓm tÝch lòy.")
			return
	end
	local nRoute = GetPlayerRoute()	
	local nBody = GetBody();
	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 100)
	for i = 1, 5 do
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szBKLBLogHeader, "nhËn ®­îc")
		gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1, "§æi thµnh c«ng lo¹i mËt tÞch")
	end
--	gf_SetTaskBit(TSK_BKLB_EXCHANGE, 10,1)
end

function ChangeVLTBShopBKL_DanhHieu()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
	end
	if GetTask(TSK_BKLB_REWARD) < 200  then
		Talk(1,"","B¹n kh«ng ®ñ ®iÓm tÝch lòy.")
		return
	end	
	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 200)	
	AddTitle(22,15)
	SetTitleTime(22, 15, GetTime() + 3600 * 24 * 30)
	gf_WriteLogEx("Loi Ho Lenh", "®æi thµnh c«ng", 1, "§æi thµnh c«ng lo¹i danh hiÖu ")
end

function Unlocl_LangBa_BKL()
	if GetItemCount(0,112,158) < 1 then
		Talk(1,"","B¹n kh«ng cã L¨ng Ba Vi Bé toµn tËp ®Ó më khãa")
		return	
	end
	if GetItemCount(2,1,1006) < 2 then
		Talk(1,"","B¹n kh«ng cã 2 Cöu Thiªn V« Cùc §¬n ®Ó më khãa L¨ng Ba Vi Bé toµn tËp")
		return	
	end
	if DelItem(0,112,158,1) == 1 and DelItem(2,1,1006,2) == 1 then
		gf_AddItemEx2({0,112,158,1,1}, "L¨ng Ba Vi Bé toµn tËp", szBKLBLogHeader, "Më khãa")
	end
end

function hklb_DoNothing()

end