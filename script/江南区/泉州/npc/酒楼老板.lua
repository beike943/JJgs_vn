
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¾ÆÂ¥ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Ô½ÄÏ¸±»î¶¯
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

--201207º£±ßÑçÏ¯»î¶¯
Include("\\script\\online_activites\\201206\\haibianyanxi.lua")
--201208ÃÏÀ¼½ÚÈÕ
Include("\\script\\online_activites\\201207\\sushipan.lua")
--201209¸¾Å®½Ú»î¶¯
Include("\\script\\online_activites\\201209\\send_gif.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		Talk(1,"selbuy","Xin hái n¬i ®©y cã b¸n Hïng Hoµng Töu kh«ng?")
		return 
	end
	if (nState==12) then
		task_012_00();
		return
	end;
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,376) < 1 then
		--¸úÈªÖÝ¾ÆÂ¥ÀÏ°åÂò¶ì»Æ¶¹Éú
		buy_gift_talk(3);
		return
	end;
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	
	local tSel = {};
	
	--201207º£±ßÑçÏ¯»î¶¯
	if gf_CheckEventDateEx(VET_201206_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201206_Say_Tb) do
			tinsert(tSel,VET_201206_Say_Tb[i]);
		end
	end
	
	--201208ÃÏÀ¼½ÚÈÕ
	if gf_CheckEventDateEx(VET_201207_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201207_Say_Tb) do
			tinsert(tSel,VET_201207_Say_Tb[i]);
		end
	end
	
	--201209¸¾Å®½Ú»î¶¯
	if gf_CheckEventDateEx(VET_201209_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201209_Say_Tb) do
			tinsert(tSel,VET_201209_Say_Tb[i]);
		end
	end
	
	--¸±»î¶¯
	if gf_CheckEventDateEx(75) ~= 0 then
		local tSayDialog = aah_GetSayDialog();
		if tSayDialog then
			for i=1, getn(tSayDialog) do
				tinsert(tSel, tSayDialog[i]);
			end
		end
	end
	-- Event nhá th¸ng 3
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130326 and nDate <= 20130331 then
		tinsert(tSel,"Quyªn gãp 1 Long HuyÕt Hoµn/#vng_quyengop(1)");
		tinsert(tSel,"Quyªn gãp 1 Kú L©n Hoµn/#vng_quyengop(2)");
		tinsert(tSel,"Quyªn gãp 1 Phông HuyÕt Hoµn/#vng_quyengop(3)");
		tinsert(tSel,"Quyªn gãp 1 ChiÕn ThÇn Hoµn/#vng_quyengop(4)");
	end
	--tinsert(tSel, "ÎÒÂòÐ©ôÕ×Ó²ÄÁÏ/#Sale("..sal_num..")")
	tinsert(tSel,	"Ta chØ ®i ngang th«i/end_dialog");
	Say("<color=green>Chñ Töu lÇu<color>: R­îu vµ thøc ¨n ë chç ta rÊt ngon, cßn cã nguyªn liÖu lµm b¸nh Ýt n÷a, kh¸ch quan cã muèn ghÐ qua kh«ng?",
		getn(tSel), tSel)
end
function selbuy()
	local selTab = {
		"Mua 1 b×nh/buy",
		"KÕt thóc ®èi tho¹i./nothing"
		}
	Say("Chñ töu lÇu: N¬i nµy r­îu g× còng cã! Hïng Hoµng mü töu 20 l­îng mét b×nh!",2,selTab)
end

function buy()
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		if Pay(2000) == 1 then
			if AddItem(2,0,359,1) == 1 then
				Say("Chñ töu lÇu: §a t¹ kh¸ch quan chiÕu cè! R¶nh rçi h·y quay l¹i nhÐ!",0)
				local OldPlayerIndex = PlayerIndex
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY2,4)
					TaskTip("Mang Hïng Hoµng Töu vÒ gÆp Høa Tiªn!")
				end
				PlayerIndex = OldPlayerIndex
			end
		else
			Say("Chñ töu lÇu: Ai da! TiÒn kh«ng cã mµ ®ßi uèng r­îu ngon µ!",0)
		end
	else
		Say("Ng­¬i kh«ng gióp næi ta ®©u! CÇn ph¶i cã søc m¹nh cña t×nh yªu míi cã thÓ gióp ®­îc ta!",0)
	end
end

function vng_quyengop(nType)
	local tHorse = {
				[1] = {"Long HuyÕt hoµn", 1002},
				[2] = {"Kú L©n hoµn", 1003},
				[3] = {"Phông HuyÕt hoµn", 1004},
				[4] = {"ChiÕn ThÇn hoµn", 1005},
			}
	local tNhonNhip_Award = {
					{1, 888, "Thiªn Th¹ch Tinh Th¹ch", {2,1,1009,2}},
					{1, 10, "ChuyÓn Sinh §¬n", {2,1,30345,1}, 30 * 24 * 3600},
					{1, 50, "§¹i §Þnh Hån", {2,1,1113,1}, 30 * 24 * 3600},
					{1, 1212, "Ma §ao Th¹ch 1", {2,1,30428,3}, 15 * 24 * 3600},
					{1, 1212, "Ma §ao Th¹ch 2", {2,1,30429,3}, 15 * 24 * 3600},					
					{1, 1500, "Ma §ao Th¹ch 3", {2,1,30430,3}, 15 * 24 * 3600},
					{1, 1000, "C­êng hãa quyÓn 12", {2,1,30424,1}, 15 * 24 * 3600},
					{1, 1000, "C­êng hãa quyÓn 13", {2,1,30425,1}, 15 * 24 * 3600},
					{1, 1515, "C­êng hãa quyÓn 14", {2,1,30426,1}, 15 * 24 * 3600},
					{1, 1613, "C­êng hãa quyÓn 15", {2,1,30427,1}, 15 * 24 * 3600},
			}	
	if gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) >= 1 then
		Talk(1,"","§¹i hiÖp ®· ®æi th­ëng lo¹i nµy råi. H·y chän ®æi th­ëng lo¹i kh¸c hoÆc quay l¹i vµo ngµy mai !!!");
		return 0;
	end	
	if GetItemCount(2,1,tHorse[nType][2]) < 1 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo "..tHorse[nType][1].." ®Ó ®æi th­ëng");
		return 0;
	end
	if gf_Judge_Room_Weight(14,600," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if DelItem(2,1,tHorse[nType][2],1) == 1 then
		gf_SetTaskByte(TSK_LUCKY_DAOHUU,nType,gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) + 1)
		gf_AddItemEx2({2,1,30230,500},"§æi th­ëng lo¹i "..tHorse[nType][1],"THANG 3 NHON NHIP BK","NhËn thµnh c«ng xu vËt phÈm")
		ModifyExp(200000000)
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 1000)
		else
			SetTask(701,GetTask(701) - 1000)
		end		
		gf_AddItemEx2({2,1,30390,30},"§æi th­ëng lo¹i "..tHorse[nType][1],"THANG 3 NHON NHIP BK","NhËn thµnh c«ng m¶nh thiªn cang")
		for i = 1, 3 do
			gf_EventGiveRandAward(tNhonNhip_Award,10000,1, "THANG 3 NHON NHIP BK", "nhËn 3 phÇn th­ëng ngÉu nhiªn")
		end
		gf_WriteLogEx("THANG 3 NHON NHIP", "nhËn th­ëng thµnh c«ngi", 1, "NhËn th­ëng lo¹i "..tHorse[nType][1])		
	end
end

function nothing()

end

