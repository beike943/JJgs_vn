Include("\\script\\lib\\globalfunctions.lua");
function OnExtPointChange(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		WriteLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue)
		return
	end
	dostring(ExtFunTab[nExtPointIndex + 1].."("..(nChangeValue)..")");
end

ExtFunTab=
{
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",	
	"OnChangeExt",
	nil,
};

function OnChangeJXWeb(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then			
			if AddItem(2,1,30085,nValue) == 1 then			
				Say("Chóc mõng bang chñ nhËn ®­îc "..nValue.." Liªn T©m §an.",0)
				Msg2Player("B¹n nhËn ®­îc "..nValue.." Liªn T©m §an.")
				WriteLogEx("JX Web","nhËn",nValue,"Liªn T©m §an","",GetTongName())
			else
				WriteLogEx("JX Web","thÊt b¹i",nValue,"Liªn T©m §an","",GetTongName())
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeJXWeb.")		
	end
end 

function OnChangeGetToken(nChangeValue)
	if nChangeValue == 1 then		
			local tToken = 
			{
				{"Long tö Ên",{2,0,30002,1}},
				{"Hæ tö Ên",{2,0,30003,1}},
				{"Phông tö Ên",{2,0,30005,1}},
				{"¦ng tö Ên",{2,0,30006,1}},
			}
			local nRand = random(1,4)						
			local nRet, nItemIdx =  gf_AddItemEx(tToken[nRand][2],tToken[nRand][1])
			if nRet == 1 then
				gf_SetItemExpireTime(nItemIdx,2009,11,30,24,0,0)			
				Say("Chóc mõng ®¹i hiÖp nhËn ®­îc "..tToken[nRand][1],0)
				Msg2Player("B¹n nhËn ®­îc 1 "..tToken[nRand][1])
				WriteLogEx("Phat thuong bang chu","nhËn",1,tToken[nRand][1])
			else
				WriteLogEx("Phat thuong bang chu","thÊt b¹i",1,tToken[nRand][1])
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeGetToken.")		
	end
end

function OnChangeTopFaction(nChangeValue)
	local nValue = -nChangeValue
	local nRoute = GetPlayerRoute()
	local tb_wohucanglong_item_aword_83 = {
			[2]  = {"Ph¸ Yªn ®ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[3]  = {"Phï Yªn tr­îng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[4]  = {"Hµm Yªn thñ",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[6]  = {"Tµng Yªn ch©m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[8]  = {"Phi Yªn kiÕm",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[9]  = {"VËn Yªn cÇm",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[11] = {"V©n Yªn thñ",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[12] = {"L­u Yªn c«n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[14] = {"HuyÒn Yªn kiÕm",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[15] = {"Vò Yªn bót",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[17] = {"Hµ Tiªm Th­¬ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[18] = {"Hµnh Yªn Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[20] = {"Träc Yªn nhÉn",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[21] = {"Yªu Yªn tr¶o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
	};
	if nValue == 1 then			
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,94 + GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,8},"Trang bÞ Tµng KiÕm")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nhËn",1,"Trang bÞ Tµng KiÕm")
				else
					WriteLogEx("Phan thuong Top Mon phai","thÊt b¹i",1,"Trang bÞ Tµng KiÕm")
				end
			else
				local nRet, nItemIdx = gf_AddItemEx({0,i,38,1,1,-1,-1,-1,-1,-1,-1},"Tµng KiÕm B¶o Ch©u")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nhËn",1,"Tµng KiÕm B¶o Ch©u")
				else
					WriteLogEx("Phan thuong Top Mon phai","thÊt b¹i",1,"Tµng KiÕm B¶o Ch©u")
				end	
				local nRet, nItemIdx = gf_AddItemEx({0,i,40,1,1,-1,-1,-1,-1,-1,-1},"Tµng KiÕm Kim Ên")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nhËn",1,"Tµng KiÕm Kim Ên")
				else
					WriteLogEx("Phan thuong Top Mon phai","thÊt b¹i",1,"Tµng KiÕm Kim Ên")
				end			
			end
		end			
		Say("Chóc mõng b¹n nhËn ®­îc bé Trang bÞ Tµng KiÕm!",0)
		Msg2Player("B¹n nhËn ®­îc Trang bÞ Tµng KiÕm.")	
		local nRet, nItemIdx = gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2],tb_wohucanglong_item_aword_83[nRoute][1])
		if Ret == 1 then
			Say("Chóc mõng b¹n nhËn ®­îc 1 "..tb_wohucanglong_item_aword_83[nRoute][1],0)
			Msg2Player("B¹n nhËn ®­îc 1 "..tb_wohucanglong_item_aword_83[nRoute][1])	
			WriteLogEx("Phan thuong Top Mon phai","nhËn",1,tb_wohucanglong_item_aword_83[nRoute][1])
		else
			WriteLogEx("Phan thuong Top Mon phai","thÊt b¹i",1,tb_wohucanglong_item_aword_83[nRoute][1])
		end				
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeTopFaction.")		
	end	
end

function OnChangeTopWorld(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx({0,105,15,1,1,-1,-1,-1,-1,-1,-1},"Phiªu Vò")
		if Ret == 1 then
			Say("Chóc mõng b¹n nhËn ®­îc 1 Phiªu Vò!",0)
			Msg2Player("B¹n nhËn ®­îc 1 Phiªu Vò.")	
			WriteLogEx("Phan thuong Top The gioi","nhËn",1,"Phiªu Vò")
		else
			WriteLogEx("Phan thuong Top The gioi","thÊt b¹i",1,"Phiªu Vò")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeTopFaction.")		
	end	
end

function OnChangeTALK(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then
			for i=1,48 do
				local nRet, nItmIdx = AddItem(2,0,30000,1)
				SetItemExpireTime(nItmIdx, 72*3600);				
			end
			Say("Chóc mõng Bang Chñ nhËn ®­îc 48 Tinh Anh LÖnh Kú. H·y chän ng­êi xøng ®¸ng!",0)
			Msg2Player("B¹n nhËn ®­îc 48 Tinh Anh LÖnh Kú")	
			WriteLogEx("Bang hoi tinh anh 3","nhËn Tinh Anh LÖnh Kú","","","",GetTongName())
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeTALK.")		
	end
end 

function OnChangeTTLT(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx({2,1,1068,1,1},"Thiªn Th¹ch Linh Th¹ch")
		if nRet == 1 then
			SetItemExpireTime(nItemIdx, 15*24*3600);		
			Say("Chóc mõng c¸c h¹ nhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch!",0)
			Msg2Player("B¹n nhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch.")	
			WriteLogEx("Phan thuong tham du BHTA","nhËn",1,"Thiªn Th¹ch Linh Th¹ch")
		else
			WriteLogEx("Phan thuong tham du BHTA","thÊt b¹i",1,"Thiªn Th¹ch Linh Th¹ch")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeTTLT.")		
	end	
end

function OnChangeBHTANhanSam(nChangeValue)
	local nValue = -nChangeValue	
	if nValue >= 1 then			
			if AddItem(2,1,30071,nValue) == 1 then			
				Say("Chóc mõng c¸c h¹ nhËn ®­îc "..nValue.." Nh©n S©m V¹n N¨m.",0)
				Msg2Player("B¹n nhËn ®­îc "..nValue.." Nh©n S©m V¹n N¨m.")
				WriteLogEx("BHTA 3 Prize","nhËn",nValue,"Nh©n S©m V¹n N¨m","",GetTongName())
			else
				WriteLogEx("BHTA 3 Prize","thÊt b¹i",nValue,"Nh©n S©m V¹n N¨m","",GetTongName())
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeBHTANhanSam.")		
	end
end 

function OnChangeVD(nChangeValue)
	nChangeValue = -nChangeValue
	if nChangeValue == 1 then		
			for i=100,103 do
				if i ~= 102 then
					local nRet, nItemIdx = gf_AddItemEx({0,i,8000+ GetBody(),1,1,-1,-1,-1,-1,-1,-1},"Trang bÞ Viªm §Õ")
					if Ret == 1 then
						WriteLogEx("Promotion Tet","nhËn",1,"Trang bÞ Viªm §Õ")
					else
						WriteLogEx("Promotion Tet","thÊt b¹i",1,"Trang bÞ Viªm §Õ")
					end
			 	end
		 	end
		 	Say("Chóc mõng c¸c h¹ nhËn ®­îc bé trang bÞ Viªm §Õ!",0)			
			Msg2Player("B¹n nhËn ®­îc bé trang bÞ Viªm §Õ.")					
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeVD.")		
	end	
end

function OnChangeHKLB(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1067,1,1},"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","HKLB","nhËn",30*24*3600)
		if nRet == 1 then			
			Say("Chóc mõng c¸c h¹ nhËn ®­îc 1 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch!",0)						
		else
			WriteLogEx("HKLB","thÊt b¹i",1,"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch")
		end
	elseif nValue == 2 then
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1068,1,1},"Thiªn Th¹ch Linh Th¹ch","HKLB","nhËn",30*24*3600)
		if nRet == 1 then			
			Say("Chóc mõng c¸c h¹ nhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch!",0)						
		else
			WriteLogEx("HKLB","thÊt b¹i",1,"Thiªn Th¹ch Linh Th¹ch")
		end
	elseif nValue == 3 then
		local nRet, nItemIdx = 0,0
		for i=1,2 do
			nRet, nItemIdx = gf_AddItemEx2({2,1,1068,1,1},"Thiªn Th¹ch Linh Th¹ch","HKLB","nhËn",30*24*3600)
		end
		if nRet == 1 then			
			Say("Chóc mõng c¸c h¹ nhËn ®­îc 2 Thiªn Th¹ch Linh Th¹ch!",0)						
		else
			WriteLogEx("HKLB","thÊt b¹i",2,"Thiªn Th¹ch Linh Th¹ch")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeHKLB.")		
	end	
end 

function OnChangeBocThamBHTA(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then				
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1067,1,1},"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","Boc tham BHTA","nhËn",30*24*3600)
		if nRet ~= 1 then	
			WriteLogEx("Boc tham BHTA","thÊt b¹i",1,"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch")
		end	
		nRet, nItemIdx = gf_AddItemEx2({0,112,78,1,1},"L¨ng Ba Vi Bé","Boc tham BHTA","nhËn",0)
		if nRet == 1 then			
			Say("Chóc mõng c¸c h¹ nhËn ®­îc 1 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch vµ 1 L¨ng Ba Vi Bé!",0)			
		else
			WriteLogEx("Boc tham BHTA","thÊt b¹i",1,"L¨ng Ba Vi Bé")			
		end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t cã lçi khi gäi function OnChangeBocThamBHTA.")		
	end
end


function OnChangeExt(nChangeValue)
end

