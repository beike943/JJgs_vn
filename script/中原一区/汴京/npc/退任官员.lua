
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÍËÈÎ¹ÙÔ±½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
			
	if (IsFreeze() == 1) then  --Èç¹ûÓÃWG±»·â
	    Talk(1,"lua_clear","<color=yellow>B¶o vÖ tµi kho¶n, tr¸nh phÇn mÒm hack!<color>");
	    WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."["..GetName().."]", "Kh«ng sö dông phÇn mÒm hack");
	    return
	end;
	
	if (nState==13) then
		task_013();
		return
	else
		--Talk(1,"","Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm!");
		Msg2Player("Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm !!!!")
	end;
    ----------- Chuçi nhiÖm vô ChuyÓn Sinh 6
    	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.."BÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> lµ g×, ta míi nghe lÇn ®Çu. !!! Ai nãi víi ®¹i hiÖp lµ t¹i h¹ ®ang n¾m gi÷ bÝ kÝp nµy ?"
 	local nDate = tonumber(date("%Y%m%d"))
	tSay = aah_GetSayDialog(86);
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");		
	Say(tHeader, getn(tSay), tSay)   	
	if nDate >= 20130427 and nDate <= 20130505 then
 		tinsert(tSay, "ñng hé BiÓn §¶o n­íc nhµ (10 Hu©n Ch­¬ng JXII + 10 vµng)/#vng_ungho(1)")		
		tinsert(tSay, "ñng hé BiÓn §¶o n­íc nhµ (10 B»ng Khen JXII + 10 vµng)/#vng_ungho(2)")
		tinsert(tSay, "ñng hé BiÓn §¶o n­íc nhµ (10 Ên L·nh Thæ + 10 vµng)/#vng_ungho(3)")
		tinsert(tSay, "NhËn th­ëng nhiÖt t×nh ñng hé (mçi lo¹i ñng hé 50 lÇn)/vng_ungho_finish")					
		tinsert(tSay, "Kh«ng ®¸ng ph¶i lµm/nothing")	
		Say(tHeader, getn(tSay), tSay)   
	end
    --if GetTranslifeCount() < 6 and GetTaskTrans() < 38 then
    if GetTask(TSK_CS6_TULINH) < 2 then
    		--Talk(1,"","§¹i hiÖp ch­a lÜnh ngé ®­îc phÇn 1 cña bÝ kÝp Tø Linh Phôc Sinh");		-- check ®k lÜnh ngé phÇn 1 ë npc B¾c ®Èu l·o nh©n xong råi míi lµm tiÕp phÇn d­íi
    		return 0
    end

	--if GetTranslifeCount() < 6 and GetTaskTrans() == 39 then		
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "Thö th¸ch nhiÖm vô Tø Linh Phôc Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh«ng ®¸ng ph¶i lµm/nothing")	
	elseif GetTask(TSK_CS6_TULINH) == 4 then
		tinsert(tSay, "Thö th¸ch nhiÖm vô Tø Linh Phôc Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh«ng ®¸ng ph¶i lµm/nothing")			
	elseif GetTask(TSK_CS6_TULINH) == 2 then
		tinsert(tSay, "B¾c §Èu l·o nh©n kªu ta ®Õn viÕng th¨m c¸c h¹/cs6_infor_talk_1")		
		tinsert(tSay, "Ng­êi trong giang hå ®iÒu nãi c¸c h¹ ®ang n¾m gi÷ bÝ kÝp/nothing_do_nothing")
		tinsert(tSay, "Kh«ng ®¸ng ph¶i lµm/nothing")	
	end
	
	Say(tHeader, getn(tSay), tSay)   
    
end;
function cs6_infor_talk_1()
 	local szNpcName = "<color=green>Viªn Quan Tho¸i NhiÖm<color>: "
	local tSay = {}
	local tHeader = szNpcName.." nhµ ta mÆc dï bao ®êi lµm quan V¨n, nh­ng tõ xa x­a cã nöa quyÓn s¸ch ®­îc truyÒn tõ ®êi nµy sang ®êi kh¸c vµ ®­îc coi lµ b¶o vËt gia truyÒn, Tæ tiªn nãi nöa quyÓn s¸ch nµy cã thÓ g©y chÊn ®éng toµn câi vâ l©m vµ chØ truyÒn thô cho ng­êi h÷u duyªn, cã tµi cã ®øc. §¹i hiÖp h·y lµm c¸c nhiÖm vô: Cèng hiÕn cho quèc gia, giÕt yªu qu¸i vµ diÖt qu©n x©m l¨ng"
		
	tinsert(tSay, "ChÊp nhËn thö th¸ch/cs6_npc2_infor1")		
	tinsert(tSay, "Kh«ng ®¸ng ph¶i lµm/nothing")
	Say(tHeader, getn(tSay), tSay)   
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --½â·â
end;

function nothing_do_nothing()
	Talk(1,"","ThËt m¾c c­êi, nhµ ta bao ®êi ®ªu lµm quan V¨n, ®©u cã luyÖn vâ c«ng nªn lµm g× cã bÝ kÝp nh­ ®¹i hiÖp nãi !!!!");
	return 0
end

function vng_ungho(nType)
	local nExp = 39000000
	local tCheck = {
				[1] = {"Hu©n Ch­¬ng JXII", 30502},
				[2] = {"B»ng Khen JXII", 30503},
				[3] = {"Ên L·nh Thæ", 30504},
			}
	local tUngHo_Award = { --kinh nghiÖm, ch©n khÝ, c«ng tr¹ng
				[1] = {15000000, 150, 150},
				[2] = {15000000, 150, 150},
				[3] = {39000000, 390, 390},
			}
--	local tBanhIt_Award = {
--					{1, 666, "Thiªn Th¹ch Tinh Th¹ch", {2,1,1009,1}},
--					{1, 2000, "M·nh Thiªn Cang", {2,1,30390, 10}},
--					{1, 1400, "B¸nh Ýt ng·i h­¬ng", {2,1,1123,2,4}},
--					{1, 2000, "B¸nh Ýt ch©n gµ", {2,1,1124,2,4}},
--					{1, 1000, "B¸nh Ýt b¸t b¶o", {2,1,1125,2,4}},					
--					{3, 2934, 100000,1},
--			}	
	if gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) >= 50 then
		Talk(1,"","§¹i hiÖp ®· ®æi th­ëng 50 lÇn råi !!!");
		return 0;
	end	
	if GetCash() < 100000 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ 10 vµng ®Ó ®æi th­ëng");
		return 0;
	end	
	if GetItemCount(2,1,tCheck[nType][2]) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ nguyªn liÖu ®æi th­ëng");
		return 0;
	end
	if gf_Judge_Room_Weight(10,200," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C¸c h¹ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm v× sÏ v­ît qu¸ 2 tû ®iÓm !!!!")
		end
	end	
	if DelItem(2,1,tCheck[nType][2],10) == 1 and Pay(100000) == 1 then
		gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) + 1)
		ModifyExp(tUngHo_Award[nType][1])
		Msg2Player("B¹n nhËn ®­îc "..tUngHo_Award[nType][1].." ®iÓm kinh nghiÖm")	
		if MeridianGetLevel() >= 1 then
			AwardGenuineQi(tUngHo_Award[nType][2])
		else
			Talk(1,"","§¹i hiÖp ch­a kich ho¹t kinh m¹ch nªn kh«ng thÓ nhËn ®­îc ®iÓm ch©n khÝ !!")
		end
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + tUngHo_Award[nType][3])
		else
			SetTask(701,GetTask(701) - tUngHo_Award[nType][3])
		end		
		Msg2Player("B¹n nhËn ®­îc "..tUngHo_Award[nType][3].." ®iÓm c«ng tr¹ngÝ")
		if nType == 1 or nType == 2 then		
			gf_AddItemEx2({2,0,1082,15},"§æi th­ëng lo¹i "..nType, "UNG HO BIEN DAO BK","NhËn thµnh c«ng T¬ T»m")
			Msg2Player("B¹n nhËn ®­îc 15 m¶nh Th¸i DÞch Hçn Nguyªn C«ng")
		else
			local nAwardRand = mod(random(1,1000),20)
			gf_AddItemEx2({2,1,(30164+nAwardRand),39}, "Item Tr¸i c©y", "UNG HO BIEN DAO BK", "nhËn thµnh c«ng")    
		end
		gf_WriteLogEx("UNG HO BIEN DAO", "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng lo¹i "..nType)		
	end
end
function vng_ungho_finish()
	local nValue1 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,1)
	local nValue2 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,2)
	local nValue3 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,3)
	local nValue4 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4)
	local nExp = 100000000
	if nValue1 < 50 or nValue2 < 50 or nValue3 < 50 then
		Talk(1,"", "§¹i hiÖp ch­a hoµn thµnh ñng hé mçi lo¹i 50 lÇn nªn kh«ng thÓ nhËn th­ëng !!")
		return 0
	end
	if nValue4 >= 1 then
		Talk(1,"", "§¹i hiÖp ®· nhËn th­ëng råi !!")
		return 0
	end
	if gf_Judge_Room_Weight(10,100," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C¸c h¹ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm v× sÏ v­ît qu¸ 2 tû ®iÓm !!!!")
		end
	end		
	gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,4,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4) + 1)	
	ModifyExp	(nExp)
	if MeridianGetLevel() >= 1 then
		AwardGenuineQi(10000)
	else
		Talk(1,"","§¹i hiÖp ch­a kich ho¹t kinh m¹ch nªn kh«ng thÓ nhËn ®­îc ®iÓm ch©n khÝ !!")
	end	
	gf_AddItemEx2({2,1,30340,6789},"§æi th­ëng lo¹i hoµn thµnh 50 lÇn ","UNG HO BIEN DAO BK","NhËn thµnh c«ng 4 Huy Hoµng")
	gf_WriteLogEx("UNG HO BIEN DAO", "nhËn th­ëng thµnh c«ngi", 1, "NhËn th­ëng hoµn thµnh 50 lÇn")		
	
end