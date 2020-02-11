--=============================================
--create by baiyun 2009.8.25
--describe:Ô½ÄÏ°æ8ÔÂ·İµ÷Õû ÎäÁÖÊ¹Õß½Å±¾
--=============================================
Include("\\script\\task\\plant_tuoguan\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua")

--ÈÕ³£ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\richangrenwu\\head.lua");
g_strNpc = "<color=green>Vâ l©m sø gi¶: <color>";
function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."HiÖn t¹i chç cña ta cã vµi viÖc cÇn ThiÕu hiÖp gióp ®ì, Ch¼ng hay thiÕu hiÖp cã s½n lßng hay kh«ng?"
	local nDate = tonumber(date("%Y%m%d"))	
	if   nDate <= 20120229 then
		tinsert(tbSayDialog,"Ta muèn mua vËt phÈm Vâ L©m Hoµng Kim LÖnh/buy_HKL")
	end
	tinsert(tbSayDialog,"NhËn phÇn th­ëng trång c©y b¸t nh·/get_tuanguan_award")
	tinsert(tbSayDialog,"T¹i h¹ muèn trång c©y gióp ng­êi kh¸c/#plant_tuoguan(2, 0,0)")
	tinsert(tbSayDialog,"T¹i h¹ ®Õn nhËn phÇn th­ëng gióp trång c©y./get_help_tuoguan_award")
	tinsert(tbSayDialog,"H«m nay ®· nép ®ñ 16 B¸t Nh· Chøng Th­ /already_give_16_banruozhengshu")
	
	tinsert(tbSayDialog,"NhËn phÇn th­ëng theo c¸c nÊc ®iÓm tİch lòy trång c©y/#get_award(1)")	

	tinsert(tbSayDialog,"KiÓm tra sè ®iÓm tİch lòy nhËn trång c©y gióp ng­êi kh¸c thµnh c«ng./see_point")
	tinsert(tbSayDialog,"T¹i h¹ chØ ghĞ ngang!/nothing")
	
--      if DAILY_TASK_0912_SWITCH == 1 then
--           tinsert(tbSayDialog, 1, "NhiÖm vô th­êng nhËt/DaliyTask0912About");
--     end
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function buy_HKL()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."HiÖn t¹i chç cña ta cã b¸n Vâ L©m Hoµng Kim LÖnh"
	
	tinsert(tbSayDialog,"Ta muèn mua 10 Vâ L©m Hoµng Kim LÖnh (20 Xu vËt phÈm)/#confirm_buy_HKL(1)")
	tinsert(tbSayDialog,"Ta muèn mua 100 Vâ L©m Hoµng Kim LÖnh (200 Xu vËt phÈm)/#confirm_buy_HKL(2)")	
	tinsert(tbSayDialog,"Ta muèn mua 1000 Vâ L©m Hoµng Kim LÖnh(2000 Xu vËt phÈm)/#confirm_buy_HKL(3)")
	tinsert(tbSayDialog,"T¹i h¹ chØ ghĞ ngang!/main")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

local tNum = {10, 100, 1000}
function confirm_buy_HKL(nSelected)
	if nSelected == 1 then
		if GetItemCount(2,1,30230) < 20  then
			Talk(1, "", "B¹n kh«ng mang theo ®ñ Xu vËt phÈm!")
			return
		end
		if DelItem(2,1,30230,20) == 1 then
			gf_AddItemEx2({2,1,30284,10}, "Hoµng Kim LÖnh", "MUA HOANG KIM LENH", "thµnh c«ng")
		end
	end
	if nSelected == 2 then
		if GetItemCount(2,1,30230) < 200  then
			Talk(1, "", "B¹n kh«ng mang theo ®ñ Xu vËt phÈm!")
			return
		end
		if DelItem(2,1,30230,200) == 1 then
			gf_AddItemEx2({2,1,30284,100}, "Hoµng Kim LÖnh", "MUA HOANG KIM LENH", "thµnh c«ng")
		end
	end	
	if nSelected == 3 then
		if GetItemCount(2,1,30230) < 2000  then
			Talk(1, "", "B¹n kh«ng mang theo ®ñ Xu vËt phÈm!")
			return
		end
		if DelItem(2,1,30230,2000) == 1 then
			gf_AddItemEx2({2,1,30284,1000}, "Hoµng Kim LÖnh", "MUA HOANG KIM LENH", "thµnh c«ng")
		end
	end	
end

function get_token()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20090922 and nDate <= 20090927 then
		if GetLevel() < 99 then
			Say(g_strNpc.."ChØ cã cao thñ ®¼ng cÊp 99 míi së h÷u ®­îc Ên tİn! ThiÕu hiÖp h·y rÌn luyÖn thªm!",0)
			return
		end
		local nExtVal = GetExtPoint(4)
		if nExtVal < 1 then
			Say(g_strNpc.."ThiÕu hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng!",0)
			return
		elseif  nExtVal == 2 then
			Say(g_strNpc.."Ch¼ng ph¶i ®¹i hiÖp ®· nhËn Ên tİn råi sao?",0)
			return
		end
		if GetFreeItemRoom() <1  then
			Say(g_strNpc.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ « trèng. H·y s¾p xÕp l¹i!",0)
			return
		end		
		if nExtVal == 1 then
			AddExtPoint(4,1)
		end	
	end
end

function get_tuanguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 1 then
		Say(g_strNpc.."ThiÕu hiÖp thËt khĞo ®ïa, thiÕu hiÖp ®· cã ñy th¸c trång c©y B¸t Nh· ch­a mµ ®ßi nhËn th­ëng.", 1, "ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 900 then
		Say(g_strNpc.."ThiÕu hiÖp cÇn"..(900 - nDiff).." gi©y sau míi cã thÓ nhËn phÇn th­ëng ñy th¸c trång c©y", 1, "KÕt thóc ®èi tho¹i/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--¸ø¾­Ñé
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[1], 100, 1);
	local nExp = t_TUOGUAN_EXP[1][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
	--¸øÎïÆ·
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "Vßng Th¸i H­ B¸t Qu¸i";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function get_help_tuoguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 2 then
		Say(g_strNpc.."ThiÕu hiÖp thËt khĞo ®ïa, thiÕu hiÖp ®· cã nhËn trång c©y B¸t Nh· gióp ai ch­a mµ ®ßi nhËn th­ëng.", 1, "ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 360 then
		Say(g_strNpc.."ThiÕu hiÖp cÇn"..(360 - nDiff).." gi©y sau míi cã thÓ nhËn th­ëng gióp ng­êi kh¸c trång c©y", 1, "KÕt thóc ®èi tho¹i/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--¸ø»ı·Ö
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_HELP_POINT, 100, 1);
	local nPoint = t_TUOGUAN_HELP_POINT[nRand][1];
	SetTask(TASK_TUOGUAN_PLANT_POINT, GetTask(TASK_TUOGUAN_PLANT_POINT) + nPoint);
	Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm trång c©y");
	WriteLogEx("Uy thac trong cay", "nhËn", nPoint, "Diem tich luy");
	--¸ø¾­Ñé
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[2], 100, 1);
	local nExp = t_TUOGUAN_EXP[2][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
	--- §iÓm VËn May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExp
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--	else
--		Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--	end
	---------	
	--¸øÎïÆ·
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "Vßng Th¸i H­ B¸t Qu¸i";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Nhan Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "nguyªn liÖu event 201011", "Hoat dong thang 11 nam 2010", "Nép BNCT")
	end
	if tonumber(date("%y%m%d")) >= 110114 and tonumber(date("%y%m%d")) <= 110220 then
		gf_AddItemEx2({ 2, 1, 30277, 30}, "Nguyªn liÖu event TÕt", "Hoat dong thang 1 nam 2011", "Nép BNCT")
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function see_point()
	Say(g_strNpc.."HiÖn t¹i b¹n cã <color=red>"..GetTask(TASK_TUOGUAN_PLANT_POINT).."<color> ®iÓm trång c©y.", 1, "trë l¹i/main");
end


function nothing()
end

function already_give_16_banruozhengshu()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) < nDate then
		SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_GET_AWARD_DATE) >= nDate then
		Say(g_strNpc.."H«m nay thiÕu hiÖp ®· nhËn phÇn th­ëng B¸t Nh· Chøng Th­ råi, xin h·y ®îi ngµy mai råi quay l¹i.", 1, "ThËt ng¹i qu¸! Ta sÏ quay l¹i sau./nothing");
		return 0;
	end
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) < 16 then
		Say(g_strNpc.."ThiÕu hiÖp míi nép <color=yellow>"..GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT).."/16<color> B¸t Nh· Chøng Th­ trong ngµy. H·y nép thªm ®i!!", 1, "ThËt ng¹i qu¸! Ta sÏ quay l¹i sau./nothing");
		return 0;
	else
		if gf_Judge_Room_Weight(2, 50, g_strNpc) == 0 then
			return 0;
		end
--		local nRand = gf_GetRandItemByTable(t_TUOGUAN_8_AWARD, 100, 3);
--		gf_SetLogCaption(str_TUOGUAN_LOG);
--		local nRetCode, nIndex = gf_AddItemEx(t_TUOGUAN_8_AWARD[nRand][3], t_TUOGUAN_8_AWARD[nRand][1]);
--		if nRetCode == 1 then
--			SetItemExpireTime(nIndex, t_TUOGUAN_8_AWARD[nRand][4]);
--			SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
--			WriteLogEx("Uy thac trong cay", "Nop 16 Bat nha chung thu", 1, t_TUOGUAN_8_AWARD[nRand][1]);
--		end
--		gf_SetLogCaption("");
		SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
		Give_BNCT_16_Award()
	end
end

function get_award(nPage)
	local tb_say = {};
	if nPage == 1 then
		tinsert(tb_say, "250 ®iÓm tİch lòy – nhËn 2 MËt tŞch s­ m«n cap cÊp 70/#confirm_get_award(1, 250)");
		tinsert(tb_say, "500 ®iÓm tİch lòy –  nhËn 6 Nh©n s©m v¹n n¨m/#confirm_get_award(2, 500)");
		tinsert(tb_say, "750 ®iÓm tİch lòy – nhËn 100 tr¸i c©y ngÉu nhiªn/#confirm_get_award(3, 750)");	
		tinsert(tb_say, "1000 ®iÓm tİch lòy – nhËn 1 Thiªn Th¹ch Linh Th¹ch/#confirm_get_award(4, 1000)");
		tinsert(tb_say, "1250 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(5, 1250)");
		tinsert(tb_say, "1500 ®iÓm tİch lòy – nhËn 2 Hßa ThŞ Bİch/#confirm_get_award(6, 1500)");
		tinsert(tb_say, "Trang kÕ/#get_award(2)");
		tinsert(tb_say, "Trang tr­íc/#get_award(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "1750 ®iÓm tİch lòy –  nhËn 100 tr¸i c©y ngÉu nhiªn/#confirm_get_award(7, 1750)");
		tinsert(tb_say, "2000 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(8, 2000)");
		tinsert(tb_say, "2250 ®iÓm tİch lòy – nhËn 1 §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch/#confirm_get_award(9, 2250)");
		tinsert(tb_say, "2500 ®iÓm tİch lòy – nhËn 2 Thiªn Cang LÖnh/#confirm_get_award(10, 2500)");
		tinsert(tb_say, "2750 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(11, 2750)");
		tinsert(tb_say, "3000 ®iÓm tİch lòy – nhËn 1 §¹i §Şnh Hån/#confirm_get_award(12, 3000)");
		tinsert(tb_say, "Trang kÕ/#get_award(3)");
		tinsert(tb_say, "Trang tr­íc/#get_award(1)");
	elseif nPage == 3 then	
		tinsert(tb_say, "3250 ®iÓm tİch lòy – nhËn 2Thiªn M«n Kim LÖnh/#confirm_get_award(13, 3250)");
		tinsert(tb_say, "3500 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(14, 3500)");
		tinsert(tb_say, "3750 ®iÓm tİch lòy – nhËn 1 L¨ng Ba Vi Bé/#confirm_get_award(15, 3750)");
		tinsert(tb_say, "4000 ®iÓm tİch lòy – nhËn 1 tói Thiªn Th¹ch Tinh Th¹ch/#confirm_get_award(16, 4000)");
		tinsert(tb_say, "4250 ®iÓm tİch lòy – nhËn 100 tr¸i c©y ngÉu nhiªn/#confirm_get_award(17, 4250)");
		tinsert(tb_say, "4500 ®iÓm tİch lòy – nhËn 1 ChuyÓn sinh ®¬n/#confirm_get_award(18, 4500)");
		tinsert(tb_say, "Trang kÕ/#get_award(4)");
		tinsert(tb_say, "Trang tr­íc/#get_award(2)");
	elseif nPage == 4 then
		tinsert(tb_say, "4750 ®iÓm tİch lòy – nhËn 1 Thiªn Th¹ch Linh Th¹ch/#confirm_get_award(19, 4750)");
		tinsert(tb_say, "5000 ®iÓm tİch lòy – nhËn 2 Hßa ThŞ Bİch/#confirm_get_award(20, 5000)");
		tinsert(tb_say, "5250 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(21, 5250)");
		tinsert(tb_say, "5500 ®iÓm tİch lòy – nhËn 1 §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch/#confirm_get_award(22, 5500)");
		tinsert(tb_say, "5750 ®iÓm tİch lòy – nhËn 1 tói Thiªn Th¹ch Tinh Th¹ch/#confirm_get_award(23, 5750)");
		tinsert(tb_say, "6000 ®iÓm tİch lòy – nhËn 1 L¨ng Ba Vi Bé Toµn TËp/#confirm_get_award(24, 6000)");
		tinsert(tb_say, "Trang kÕ/#get_award(5)");		
		tinsert(tb_say, "Trang tr­íc/#get_award(3)");
	elseif nPage == 5 then
		tinsert(tb_say, "6250 ®iÓm tİch lòy – nhËn 100 tr¸i c©y ngÉu nhiªn/#confirm_get_award(25, 6250)");
		tinsert(tb_say, "6500 ®iÓm tİch lòy – nhËn 2 Hßa ThŞ Bİch/#confirm_get_award(26, 6500)");
		tinsert(tb_say, "6750 ®iÓm tİch lòy – nhËn 6 nh©n s©m v¹n n¨m/#confirm_get_award(27, 6750)");
		tinsert(tb_say, "7000 ®iÓm tİch lòy – nhËn 1 ChuyÓn sinh ®¬n/#confirm_get_award(28, 7000)");
		tinsert(tb_say, "7250 ®iÓm tİch lòy – nhËn 2 Thiªn M«n Kim LÖnh/#confirm_get_award(29, 7250)");
		tinsert(tb_say, "7500 ®iÓm tİch lòy – nhËn 18 nh©n s©m v¹n n¨m/#confirm_get_award(30, 7500)");
		tinsert(tb_say, "Trang tr­íc/#get_award(4)");
	else
		tinsert(tb_say, "Trang kÕ/#get_award(2)");
		tinsert(tb_say, "Trang tr­íc/#get_award(1)");
	end		
	tinsert(tb_say, "KÕt thóc ®èi tho¹i/nothing");
	Say(g_strNpc.."§¹i hiÖp muèn ®æi phÇn th­ëng nµo", getn(tb_say), tb_say);
end

function confirm_get_award(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc n÷a");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."§iÓm tİch lòy cña ®¹i hiÖp kh«ng ®ñ, kh«ng thÓ nhËn phÇn th­ëng nµy");
		return 0;
	end
	if t_TUOGUAN_POINT_TO_AWARD[nIndex][2] == nil then
		if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
			Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
			return 0;
		end
	else
		if gf_JudgeRoomWeight(t_TUOGUAN_POINT_TO_AWARD[nIndex][2][4], 50, g_strNpc) == 0 then
			Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
			return 0;
		end
	end
	SetTask(TASK_TUOGUAN_GET_AWARD_FLAG, SetBit(nFlag, nIndex, 1));
	gf_SetLogCaption(str_TUOGUAN_LOG);
	if nIndex ~= 1 and nIndex ~= 3 and nIndex ~= 7 and nIndex ~= 17 and nIndex ~= 25 then
		gf_AddItemEx2(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1], "BNCT doi diem tich luy", "B¸t Nh· Chøng Th­",t_TUOGUAN_POINT_TO_AWARD[nIndex][3])
--		local _, nItemIndex = gf_AddItemEx(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);		
--		if t_TUOGUAN_POINT_TO_AWARD[nIndex][3] then
--			SetItemExpireTime(nItemIndex, t_TUOGUAN_POINT_TO_AWARD[nIndex][3]);
--		end
	elseif nIndex == 1 then
		--°´ÃÅÅÉ¸øÃØ¼®
		local nRoute = GetPlayerRoute();
		if not t_TUOGUAN_LOW[nRoute] then
			Talk(1, "", g_strNpc.."§¹i hiÖp vÉn ch­a gia nhËp m«n ph¸i nµo c¶, kh«ng thÓ nhËn ®­îc mËt tŞch s­ m«n cao cÊp");
			return 0;
		end
		gf_AddItemEx(t_TUOGUAN_HIG[nRoute][2], t_TUOGUAN_HIG[nRoute][1])
	elseif  nIndex == 3 or nIndex == 7 or nIndex == 17  or nIndex == 25 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),100}, "Tr¸i C©y")
	end
	WriteLogEx("Uy thac trong cay", "Doi diem", 1, t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);
	gf_SetLogCaption("");
end

function get_award_2010(nPage)
	local tb_say = {};
	if nPage == 1 then
		tinsert(tb_say, "300 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(1, 300)");
		tinsert(tb_say, "600 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(2, 600)");
		tinsert(tb_say, "900 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(3, 900)");	
		tinsert(tb_say, "1200 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(4, 1200)");
		tinsert(tb_say, "1500 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(5, 1500)");
		tinsert(tb_say, "1800 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(6, 1800)");
		tinsert(tb_say, "Trang kÕ/#get_award_2010(2)");
		tinsert(tb_say, "Trang tr­íc/#get_award_2010(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "2100 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(7, 2100)");
		tinsert(tb_say, "2400 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(8, 2400)");
		tinsert(tb_say, "2700 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(9, 2700)");
		tinsert(tb_say, "3000 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(10, 3000)");
		tinsert(tb_say, "3300 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(11, 3300)");
		tinsert(tb_say, "3600 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(12, 3600)");
		tinsert(tb_say, "Trang kÕ/#get_award_2010(3)");
		tinsert(tb_say, "Trang tr­íc/#get_award_2010(1)");
	elseif nPage == 3 then	
		tinsert(tb_say, "3900 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(13, 3900)");
		tinsert(tb_say, "4200 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(14, 4200)");
		tinsert(tb_say, "4500 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(15, 4500)");
		tinsert(tb_say, "4800 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(16, 4800)");
		tinsert(tb_say, "5100 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(17, 5100)");
		tinsert(tb_say, "5400 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(18, 5400)");
		tinsert(tb_say, "Trang kÕ/#get_award_2010(4)");
		tinsert(tb_say, "Trang tr­íc/#get_award_2010(2)");
	elseif nPage == 4 then
		tinsert(tb_say, "5700 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(19, 5700)");
		tinsert(tb_say, "6000 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(20, 6000)");
		tinsert(tb_say, "6300 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(21, 6300)");
		tinsert(tb_say, "6600 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(22, 6600)");
		tinsert(tb_say, "6900 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(23, 6900)");
		tinsert(tb_say, "7200 ®iÓm tİch lòy – nhËn 4 Nh©n S©m V¹n N¨m/#confirm_get_award_2010(24, 7200)");		
		tinsert(tb_say, "Trang tr­íc/#get_award_2010(3)");
	else
		tinsert(tb_say, "Trang kÕ/#get_award_2010(2)");
		tinsert(tb_say, "Trang tr­íc/#get_award_2010(1)");
	end		
	tinsert(tb_say, "KÕt thóc ®èi tho¹i/nothing");
	Say(g_strNpc.."§¹i hiÖp muèn ®æi phÇn th­ëng nµo", getn(tb_say), tb_say);
end

function confirm_get_award_2010(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc n÷a");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."§iÓm tİch lòy cña ®¹i hiÖp kh«ng ®ñ, kh«ng thÓ nhËn phÇn th­ëng nµy");
		return 0;
	end
	if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
		return 0;
	end
	gf_AddItemEx2({2,1,30071,4}, "4 Nh©n S©m V¹n N¨m", "Uy thac trong cay 2010", "nhËn th­ëng")
	gf_SetTaskBit(TASK_TUOGUAN_GET_AWARD_FLAG, nIndex, 1)
end