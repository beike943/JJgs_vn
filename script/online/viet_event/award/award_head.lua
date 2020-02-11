-- Created By PhucBDB - 20110316

Include("\\script\\lib\\globalfunctions.lua")

-- Thu ho¹ch h¹t gièng
function VietGetTreeAward()
	
end

-- Më tói h¹t gièng
function VietSeedBagAwards()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 100}, "Tói nguyªn liÖu", "Hoat dong thang 4 nam 2011", "më Tói H¹t Gièng")
	end
--	if VietCheckEvent201106() == 1 then
--		gf_AddItemEx2({2,1,30317, 100}, "Tr¸i c©y mïa hÌ", "Hoat dong thang 6 nam 2011", "më Tói H¹t Gièng")
--	end
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2,1,30327,1}, "§Ìn hoa Trung Thu", "Hoat dong thang 8 nam 2011", "më Tói H¹t Gièng", 24*3600)
		Msg2Player("B¹n nhËn ®­îc 1 §Ìn hoa Trung Thu")		
	end
	
--	if VietCheckEvent20111111() == 1 then
--		gf_AddItemEx2({2,1,30333,100}, "Hoa S¬n Trµ", "Hoat dong thang 11 nam 2011", "më Tói H¹t Gièng")
--	end
end

function VietSeedBagAwardsEvent12()
		local nDate = tonumber(date("%y%m%d"))
		if nDate < 111216 or  nDate >= 111219 then
			return
		end
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			gf_AddItemEx2({2,1,30347, 5}, "KÑo Que B¹c Hµ", "Hoat dong thang 12 nam 2011", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 5 KÑo Que B¹c Hµ")	
		elseif  nTimes >= 7 and nTimes <= 12 then
			gf_AddItemEx2({2,1,30347, 15}, "Tói nguyªn liÖu", "Hoat dong thang 12 nam 2011", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 15 KÑo Que B¹c Hµ")	
		elseif  nTimes >= 13 and nTimes <= 24 then
			gf_AddItemEx2({2,1,30347, 25}, "Tói nguyªn liÖu", "Hoat dong thang 12 nam 2011", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 25 KÑo Que B¹c Hµ")	
		end
end

function VietSeedBagAwardsEvent012012()
		--local nDate = tonumber(date("%y%m%d"))
		if VietCheckEvent20120116()~= 1 then
			return
		end
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			gf_AddItemEx2({2,1,30353, 5}, "§ång tiÒn may m¾n", "Hoat dong thang 1 nam 2012", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 5 §ång tiÒn may m¾n")	
		elseif  nTimes >= 7 and nTimes <= 12 then
			gf_AddItemEx2({2,1,30353, 15}, "§ång tiÒn may m¾n", "Hoat dong thang 1 nam 2012", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 15 §ång tiÒn may m¾n")	
		elseif  nTimes >= 13 and nTimes <= 24 then
			gf_AddItemEx2({2,1,30353, 25}, "§ång tiÒn may m¾n", "Hoat dong thang 1 nam 2012", "trång H¹t Gièng")
			Msg2Player("B¹n nhËn ®­îc 25 §ång tiÒn may m¾n")	
		end
end

-- C©y b¸t nh· nhá
function VietSmallFruit_Award()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 30}, "Tói nguyªn liÖu", "Hoat dong thang 4 nam 2011", "trång B¸t Nh· Nhá")
	end
end

-- C¸y b¸t nh¶ lín
function VietBiglFruit_Award()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 40}, "Tói nguyªn liÖu", "Hoat dong thang 4 nam 2011", "trång B¸t Nh· Lín")
	end
end

-- Ng«i sao may m¾n
function VietLuckyStar()
	if VietCheckEvent201107() == 1 then
		gf_AddItemEx2({2,1,30317, 20}, "Tr¸i c©y mïa hÌ", "Hoat dong thang 6 nam 2011", "Sö dông Ng«i Sao May M¾n")
	end
	
	if VietCheckEvent20110714() == 1 then
		gf_AddItemEx2({2,1,30323, 30}, "Nguyªn liÖu lµm kem ", "Hoat dong thang 7 nam 2011", "Sö dông Ng«i Sao May M¾n")
		Msg2Player("B¹n nhËn ®­îc 30 Nguyªn liÖu lµm kem")
	end
end

-- Tµi nguyªn chiÕn   
function VietSongLiao(nType)
	if VietCheckEvent20110714() == 1 then
		local tMaterialQuantity201107 = 
		{
			[1] = {20},
			[2] = {35},
			[3] = {50},
			[4] = {10},
		}
		gf_AddItemEx2({2,1,30323,  tMaterialQuantity201107[nType][1]}, "Nguyªn liÖu lµm kem ", "Hoat dong thang 7 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201107[nType][1].." Nguyªn liÖu lµm kem")
	end

	if VietCheckEvent20110826() == 1 then
		local tMaterialQuantity201108 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30328,  tMaterialQuantity201108[nType][1]}, "Bét m×", "Hoat dong thang 8 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201108[nType][1].." Bét M× H¶o H¹ng")
		gf_AddItemEx2({2,1,30327,1}, "§Ìn hoa Trung Thu", "Hoat dong thang 8 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn", 24*3600)
		Msg2Player("B¹n nhËn ®­îc 1 §Ìn hoa Trung Thu")		
	end
	
	if VietCheckEvent20111007() == 1 then
		local tMaterialQuantity201108 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30331,  tMaterialQuantity201108[nType][1]}, "Hoa Hång", "Hoat dong thang 10 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201108[nType][1].." Hoa Hång")
	--	gf_AddItemEx2({2,1,30327,1}, "§Ìn hoa Trung Thu", "Hoat dong thang 8 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn", 24*3600)
	-- Msg2Player("B¹n nhËn ®­îc 1 §Ìn hoa Trung Thu")		
	end
	
	if VietCheckEvent20111111() == 1 then
		local tMaterialQuantity201111 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30333,  tMaterialQuantity201111[nType][1]}, "Hoa S¬n Trµ", "Hoat dong thang 11 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201111[nType][1].." Hoa S¬n Trµ")
	end
	
	if VietCheckEvent20111216() == 1 then
		local tMaterialQuantity201111 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30347,  tMaterialQuantity201111[nType][1]}, "KÑo Que B¹c Hµ", "Hoat dong thang 12 nam 2011", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201111[nType][1].." KÑo Que B¹c Hµ")
	end
	
	if VietCheckEvent20120116() == 1 then
		local tMaterialQuantity201201 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30353,  tMaterialQuantity201201[nType][1]}, "§ång tiÒn may m¾n", "Hoat dong thang 1 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201201[nType][1].." §ång tiÒn may m¾n")
	end
	
	if VietCheckEvent20120210() == 1 then
		local tMaterialQuantity201202 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30357,  tMaterialQuantity201202[nType][1]}, "Qu¶ CaCao", "Hoat dong thang 2 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201202[nType][1].." Qu¶ CaCao")
	end
	if VietCheckEvent20120309() == 1 then
		local tMaterialQuantity201203 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30360,  tMaterialQuantity201203[nType][1]}, "V¶i lôa cao cÊp", "Hoat dong thang 3 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201203[nType][1].." V¶i lôa cao cÊp")
	end
	if VietCheckEvent20120413() == 1 then
		local tMaterialQuantity201204 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30363,  tMaterialQuantity201204[nType][1]}, "ChiÕn tÝch", "Hoat dong thang 4 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201204[nType][1].." ChiÕn tÝch")
	end
	if VietCheckEvent20120511() == 1 then
		local tMaterialQuantity201205 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30375 ,  tMaterialQuantity201205[nType][1]}, "Nguyªn liÖu mïa hÌ", "Hoat dong thang 5 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201205[nType][1].." Nguyªn liÖu mïa hÌ")
	end
	if VietCheckEvent20120615() == 1 then
		local tMaterialQuantity201205 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30380 ,  tMaterialQuantity201205[nType][1]}, "Nguyªn liÖu b¸nh ó tro", "Hoat dong thang 6 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201205[nType][1].." Nguyªn liÖu b¸nh ó tro")
	end
	if VietCheckEvent20120720() == 1 then
		local tMaterialQuantity201207 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30393 ,  tMaterialQuantity201207[nType][1]}, "Nguyªn liÖu H¶i s¶n t­¬i sèng", "Hoat dong thang 7 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201207[nType][1].." Nguyªn liÖu H¶i s¶n t­¬i sèng")
	end
	if VietCheckEvent20120817() == 1 then
		local tMaterialQuantity201208 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30420 ,  tMaterialQuantity201208[nType][1]}, "Hoa Sen", "Hoat dong thang 8 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201208[nType][1].." Hoa Sen")
	end
	if VietCheckEvent20120914() == 1 then
		local tMaterialQuantity201209 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
	end
	if VietCheckEvent20121012() == 1 then
		local tMaterialQuantity201209 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30442 ,  tMaterialQuantity201209[nType][1]}, "Tinh DÇu Hoa", "Hoat dong thang 10 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201209[nType][1].." Tinh DÇu Hoa")
	end
	if VietCheckEvent20121116() == 1 then
		local tMaterialQuantity201211 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30454 ,  tMaterialQuantity201211[nType][1]}, "Men r­îu th­îng h¹ng", "Hoat dong thang 11 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201211[nType][1].." Men r­îu th­îng h¹ng")
	end	
	if VietCheckEvent20121217() == 1 then
		local tMaterialQuantity201212 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30464 ,  tMaterialQuantity201212[nType][1]}, "Nguyªn liÖu Noel", "Hoat dong thang 12 nam 2012", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201212[nType][1].." Nguyªn liÖu Noel")
	end	
	if VietCheckEvent20130125() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30472 ,  tMaterialQuantity201301[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 01 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201301[nType][1].." Nguyªn liÖu Event")
	end
	if VietCheckEvent20130308() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30486 ,  tMaterialQuantity201301[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 03 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201301[nType][1].." Nguyªn liÖu Event")
	end	
	if VietCheckEvent20130419() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30500 ,  tMaterialQuantity201301[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 04 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201301[nType][1].." Nguyªn liÖu Event")
	end	
	if VietCheckEvent20130517() == 1 then
		local tMaterialQuantity201305 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30515 ,  tMaterialQuantity201305[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 05 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201305[nType][1].." Nguyªn liÖu Event")
	end	
	if VietCheckEvent20130615() == 1 then
		local tMaterialQuantity201306 = 
		{
			[1] = {80},
			[2] = {100},
			[3] = {200},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30545 ,  tMaterialQuantity201306[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 06 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201306[nType][1].." Nguyªn liÖu Event")
	end		
	if VietCheckEvent20130719() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30550 ,  tMaterialQuantity201307[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 07 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201307[nType][1].." Nguyªn liÖu Event")
	end			
	if VietCheckEvent20130823() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30563 ,  tMaterialQuantity201307[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 08 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201307[nType][1].." Nguyªn liÖu Event")
	end	
	if VietCheckEvent20130919() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30567 ,  tMaterialQuantity201307[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 09 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity201307[nType][1].." Nguyªn liÖu Event")
	end								
		
end

-- N÷ Oa B¶o H¹p 
function VietWaBaoHe()
	if VietCheckEvent201107() == 1 then
		local nUse = GetTask(2156)
		if nUse > 100 then
			return
		end
		if  mod(nUse,10) == 0 then
			gf_AddItemEx2({2,1,30317, 20}, "Tr¸i c©y mïa hÌ", "Hoat dong thang 6 nam 2011", "Sö dông N÷ Oa B¶o H¹p")
		end
	end
	
	if VietCheckEvent20110714() == 1 then
		local nUse = GetTask(2156)
		if nUse > 100 then
			return
		end
		if  mod(nUse,10) == 0 then
			gf_AddItemEx2({2,1,30323, 20}, "Nguyªn liÖu lµm kem ", "Hoat dong thang 7 nam 2011", "Sö dông N÷ Oa B¶o H¹p")
			Msg2Player("B¹n nhËn ®­îc 20 Nguyªn liÖu lµm kem")
		end
	end
end

--  Thá  n­ímg 
function ThoNuong_Award()
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2, 1, 30328, 5}, "Bét M× H¶o H¹ng", "Hoat dong thang 8 nam 2011", "bµn tiÖc Thá N­íng")
		Msg2Player("B¹n nhËn ®­îc 5 Bét M× H¶o H¹ng")
	end
	if VietCheckEvent20111007() == 1 then
		gf_AddItemEx2({2,1,30331, 5}, "Hoa Hång", "Hoat dong thang 10 nam 2011", "bµn tiÖc Thá N­íng")
		Msg2Player("B¹n nhËn ®­îc 5 Hoa Hång")
	end
--	if VietCheckEvent20111111() == 1 then
--		gf_AddItemEx2({2,1,30333,100}, "Hoa S¬n Trµ", "Hoat dong thang 11 nam 2011", "bµn tiÖc Thá N­íng")
--		Msg2Player("B¹n nhËn ®­îc 100 Hoa S¬n Trµ")
--	end
end

--  NhiÖm vô B¹ch Tiªn Sinh
function BachTienSinh_Award()
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2, 1, 30328, 50}, "Bét M× H¶o H¹ng", "Hoat dong thang 8 nam 2011", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Bét M× H¶o H¹ng")
	end
	if VietCheckEvent20111007() == 1 then
		gf_AddItemEx2({2,1,30331, 50}, "Hoa Hång", "Hoat dong thang 10 nam 2011", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Hoa Hång")
	end
	if VietCheckEvent20111111() == 1 then
		gf_AddItemEx2({2,1,30333,100}, "Hoa S¬n Trµ", "Hoat dong thang 11 nam 2011", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Hoa S¬n Trµ")
	end
	if VietCheckEvent20120116() == 1 then
		gf_AddItemEx2({2,1,30353,50}, "§ång tiÒn may m¾n", "Hoat dong thang 1 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 §ång tiÒn may m¾n")
	end
	if VietCheckEvent20120210() == 1 then
		gf_AddItemEx2({2,1,30357,50}, "Qu¶ CaCao", "Hoat dong thang 2 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Qu¶ CaCao")
	end
	if VietCheckEvent20120309() == 1 then
		gf_AddItemEx2({2,1,30360,50}, "V¶i lôa cao cÊp", "Hoat dong thang 3 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 V¶i lôa cao cÊp")
	end
	if VietCheckEvent20120413() == 1 then
		gf_AddItemEx2({2,1,30363,50}, "ChiÕn tÝch", "Hoat dong thang 4 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 ChiÕn tÝch")
	end
	if VietCheckEvent20120511() == 1 then
		gf_AddItemEx2({2,1,30375 ,50}, "Nguyªn LiÖu mïa hÌ", "Hoat dong thang 5 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Nguyªn LiÖu mïa hÌ")
	end
	if VietCheckEvent20120615() == 1 then
		gf_AddItemEx2({2,1,30380 ,50}, "Nguyªn LiÖu b¸nh ó tro", "Hoat dong thang 6 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Nguyªn LiÖu b¸nh ó tro")
	end
	if VietCheckEvent20120720() == 1 then
		gf_AddItemEx2({2,1,30393 ,50}, "Nguyªn LiÖu H¶i s¶n t­¬i sèng", "Hoat dong thang 7 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Nguyªn LiÖu H¶i s¶n t­¬i sèng")
	end
	if VietCheckEvent20120817() == 1 then
		gf_AddItemEx2({2,1,30420 ,50}, "Hoa Sen", "Hoat dong thang 8 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Hoa Sen")
	end
	if VietCheckEvent20120914() == 1 then
		gf_AddItemEx2({2,1,30431 ,50}, "Bét lµm b¸nh", "Hoat dong thang 9 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Bét lµm b¸nh")
	end	
	if VietCheckEvent20121012() == 1 then
		gf_AddItemEx2({2,1,30442 ,50}, "Tinh DÇu Hoa", "Hoat dong thang 10 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Tinh DÇu Hoa")
	end	
	if VietCheckEvent20121116() == 1 then
		gf_AddItemEx2({2,1,30454 ,50}, "Men r­îu th­ëng h¹ng", "Hoat dong thang 11 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Men r­îu th­ëng h¹ng")
	end	
	if VietCheckEvent20121217() == 1 then
		gf_AddItemEx2({2,1,30464 ,100}, "Nguyªn liÖu Noel", "Hoat dong thang 12 nam 2012", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Nguyªn LiÖu Noel")
	end	
	if VietCheckEvent20130125() == 1 then
		gf_AddItemEx2({2,1,30472 ,100}, "Nguyªn liÖu Event", "Hoat dong thang 01 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Nguyªn LiÖu Event")
	end
	if VietCheckEvent20130308() == 1 then
		gf_AddItemEx2({2,1,30486 ,100}, "Nguyªn liÖu Event", "Hoat dong thang 03 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Nguyªn LiÖu Event")
	end		
	if VietCheckEvent20130419() == 1 then
		gf_AddItemEx2({2,1,30500 ,60}, "Nguyªn liÖu Event", "Hoat dong thang 04 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 60 Nguyªn LiÖu Event")
	end		
	if VietCheckEvent20130517() == 1 then
		gf_AddItemEx2({2,1,30515 ,100}, "Nguyªn liÖu Event", "Hoat dong thang 05nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Nguyªn LiÖu Event")
	end		
	if VietCheckEvent20130615() == 1 then
		gf_AddItemEx2({2,1,30545 ,100}, "Nguyªn liÖu Event", "Hoat dong thang 06nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 100 Nguyªn LiÖu Event")
	end		
	if VietCheckEvent20130719() == 1 then
		gf_AddItemEx2({2,1,30550 ,20}, "Nguyªn liÖu Event", "Hoat dong thang 07 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 20 Nguyªn LiÖu Event")
	end			
	if VietCheckEvent20130823() == 1 then
		gf_AddItemEx2({2,1,30563 ,20}, "Nguyªn liÖu Event", "Hoat dong thang 08 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 20 Nguyªn LiÖu Event")
	end		
	if VietCheckEvent20130919() == 1 then
		gf_AddItemEx2({2,1,30567 ,20}, "Nguyªn liÖu Event", "Hoat dong thang 09 nam 2013", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 20 Nguyªn LiÖu Event")
	end						
end

-- Check Date
function VietCheckEvent201104()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110401 and nDate <= 110417 then
		return 1
	end
	return 0
end

function VietCheckEvent201105()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110422 and nDate <= 110529 then
		return 1
	end
	return 0
end

function VietCheckEvent201106()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110617 and nDate <= 110710 then
		return 1
	end
	return 0
end

function VietCheckEvent201107()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110701 and nDate <=110710   then
		return 1
	end
	return 0
end

function VietCheckEvent20110714()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110715 and nDate <=110821   then
		return 1
	end
	return 0
end

function VietCheckEvent20110826()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110826 and nDate <=111002   then
		return 1
	end
	return 0
end

function VietCheckEvent20111007()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111007 and nDate <=111106   then
		return 1
	end
	return 0
end

function VietCheckEvent20111111()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111111 and nDate <=111212   then
		return 1
	end
	return 0
end

function VietCheckEvent20111216()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111216 and nDate <=120108   then
		return 1
	end
	return 0
end

function VietCheckEvent20120116()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120113 and nDate <=120205   then
		return 1
	end
	return 0
end

function VietCheckEvent20120210()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120210 and nDate <=120304   then
		return 1
	end
	return 0
end

function VietCheckEvent20120309()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120309 and nDate <=120408   then
		return 1
	end
	return 0
end

function VietCheckEvent20120413()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120413 and nDate <=120506   then
		return 1
	end
	return 0
end

function VietCheckEvent20120511()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120511 and nDate <=120610   then
		return 1
	end
	return 0
end

function VietCheckEvent20120615()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120615 and nDate <=120715   then
		return 1
	end
	return 0
end

function VietCheckEvent20120720()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120720 and nDate <=120812   then
		return 1
	end
	return 0
end

function VietCheckEvent20120817()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120817 and nDate <=120909   then
		return 1
	end
	return 0
end

function VietCheckEvent20120914()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120914 and nDate <=121007   then
		return 1
	end
	return 0
end

function VietCheckEvent20121012()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121012 and nDate <=121112   then
		return 1
	end
	return 0
end
function VietCheckEvent20121116()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121116 and nDate <=121216   then
		return 1
	end
	return 0
end
function VietCheckEvent20121217()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121221 and nDate <=130120   then
		return 1
	end
	return 0
end
function VietCheckEvent20130125()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130125 and nDate <=130225   then
		return 1
	end
	return 0
end
function VietCheckEvent20130308()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130308 and nDate <=130415   then
		return 1
	end
	return 0
end
function VietCheckEvent20130419()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130419 and nDate <=130512   then
		return 1
	end
	return 0
end
function VietCheckEvent20130517()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130517 and nDate <=130609   then
		return 1
	end
	return 0
end
function VietCheckEvent20130615()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130614 and nDate <=130714   then
		return 1
	end
	return 0
end
function VietCheckEvent20130719()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130719 and nDate <=130819   then
		return 1
	end
	return 0
end
function VietCheckEvent20130823()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130823 and nDate <=130916   then
		return 1
	end
	return 0
end
function VietCheckEvent20130919()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013   then
		return 1
	end
	return 0
end



