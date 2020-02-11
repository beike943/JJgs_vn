Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
FILE_NAME = "\\script\\ÖĞÔ­¶şÇø\\ÏåÑô\\npc\\ÎäÆ÷Ç¿»¯.lua"
function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Tèn mÊy m­¬i n¨m t©m huyÕt, rèt cuéc cïng víi nh÷ng ng­êi cña thÕ gia ®· nghiªn cøu ra trang bŞ b¸t qu¸i nµy, ®¸ng tiÕc mÊy xe thiªn th¹ch cña ta th«i!");
	end;	
	Say("<color=green>Thî rÌn L­u<color>: Nghe nãi trong thiªn h¹ cã mét lo¹i kú th¹ch cã thÓ lµm thay ®æi thuéc tİnh trang bŞ. NÕu ng­¬i t×m ®­îc ta cã thÓ gióp ng­¬i t¨ng cÊp trang bŞ. <color=red>B©y giê ng­¬i cã thÓ söa ngo¹i trang råi!<color>",
		9,
		"NhiÖm vô M¶nh Thiªn Th¹ch thÊt l¹c/get_ManhThienThach",
		"T¨ng cÊp trang bŞ/qianghua",
		"Söa ®Æc biÖt/xiuli",
		"§æi N÷ Oa Tinh Th¹ch (cÇn 1 N÷ Oa Tinh Th¹ch (khãa) vµ 1 Cµn Kh«n Phï)/change_nott",
		"Ta muèn nhËn 10 Phi YÕn Th¹ch (tiªu hao 1 trang bŞ Tµng KiÕm + 1 N÷ oa tinh th¹ch + 1 Hoµng kim hång bao)/#get_PhiYen(1)",
		"Ta muèn nhËn 19 Phi YÕn Th¹ch (tiªu hao 1 trang bŞ Thiªn Chi Tµng KiÕm + 1 N÷ oa tinh th¹ch + 1 Hoµng kim hång bao)/#get_PhiYen(2)",
		"Ta muèn nhËn 7 Phi YÕn Th¹ch (tiªu hao 1 vò khİ Bé Phi Yªn + 1 N÷ oa tinh th¹ch)/#get_PhiYen(3)",
		"Hái th¨m tin tøc/dating",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		--"N©ng cÊp trang bŞ Tµng KiÕm Hoµng Kim/UpgradeSwordCollector",
		"Rêi khái/zhaohu"
		)
end;

function UpgradeSwordCollector()
	UpgradeSwordCollectorEquipment();
end

--==========Ãâ·ÑÇøĞÂ¼¼ÄÜ×°±¸µÈ¼¶ÌáÉı=========
	TaskID_equipment_uped = 1249
	Tb_quipment_part = {
		{0,"§Çu kh«i"},
		{1,"Ngo¹i trang"},
		{3,"QuÇn "},
	}
--=========================================
function qianghua()
	Say("C­êng hãa vËt phÈm chia thµnh c­êng hãa vËt phÈm th«ng th­êng, c­êng hãa vËt phÈm cao cÊp vµ ®Şnh hån.", 5, 
	"C­êng hãa th­êng/#qianghua_(0)",
	"C­êng hãa cao cÊp/#qianghua_(1)",
		"VËt phÈm TiÓu §Şnh Hån (+7)/#qianghua_(-1)",
		"VËt phÈm ®Şnh hån (+10)/#qianghua_(-3)",
	"Rêi khái/zhaohu")
end;

function qianghua_(t)
	local nType = tonumber(t)
	EnhanceItem(nType)
end

function xiuli()
Say("<color=green>Thî rÌn L­u<color>: Tinh LuyÖn B¨ng Th¹ch rÊt quı, kh¸ch quan xem kü trang bŞ khi söa ch÷a. <color=yellow>Chó ı, söa ngo¹i trang chØ cã thÓ tiÕn hµnh khi ch­a tæn h¹i.<color>",
	5,
	"Söa miÔn ph?(®é bÒn tr­íc ®©y >0)/fix1",
	"Söa miÔn phİ (®é bÒn tr­íc ®©y =0)/fix3",
	"T¨ng cÊp/fix2",
	"Dïng 2 Tû vâ ®¹i héi bµi ®Ó t¨ng chØnh söa/fix4",
	"trë l¹i/main")
end;


function fix1()
AdvanceRepair(1)
end;

function fix2()
AdvanceRepair(2)
end;

function fix3()
AdvanceRepair(3)
end;

function fix4()
	AdvanceRepair(4)
end

function dating()
Say("Ng­¬i cÇn ta gióp g×?",3,"T×m hiÓu t¨ng cÊp/dating1","T¨ng cÊp ®Æc biÖt/dating2","trë l¹i/main")
end;

function dating1()
Say("Trang bŞ d­íi cÊp 3 cã thÓ dïng m¶nh b¨ng th¹ch ®Ó n©ng cÊp, nÕu cao h¬n ph¶i dïng ®¹i b¨ng th¹ch míi cã t¸c dông.",1,"Ta hiÓu råi!/dating")
end;

function dating2()
Say("Söa ®Æc biÖt cã 3 c¸ch: 1.Dïng m¶nh b¨ng th¹ch cã thÓ phôc håi l¹i ®é bÒn ban ®Çu. 2. Dïng b¨ng th¹ch cã thÓ t¨ng ®é bÒn tèi ®a cña trang bŞ.3. Dïng b¨ng th¹ch thuÇn khiÕt cã thÓ phôc håi l¹i toµn bé tæn h¹i cña trang bŞ",1,"Ta hiÓu råi!/dating")
end;
function zhaohu()
end

function bagua()
	Say("<color=red>trang bŞ b¸t qu¸i<color>lµ ta cïng huynh ®Ö M¹c gia ta vµ CÈm N­¬ng ®· toµn lùc cïng nhau nghiªn cøu ra t©m huyÕt. Lµm thÕ nµo nhËn ®­îc nh÷ng mãn cã linh th¹ch ng­¬i ®i hái truyÒn nh©n sÏ râ, chÕ t¹o trang bŞ cã lç ng­¬i ®i hái huynh ®Ö M¹c gia, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo <color=yellow>kh¶m linh th¹ch<color>, th× ®Õn chç ta t×m hiÓu nhĞ.",
	4,
	"Lµm thÕ nµo kh¶m linh th¹ch vµo trang bŞ/Xiangqian",
	"Lµm sao kh¶m linh th¹ch míi cã thÓ h×nh thµnh trang bŞ b¸t qu¸i/Xiangbagua",
	"Trang bŞ b¸t qu¸i cã c­êng hãa kh«ng/Baguaqianghua",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end
function SayHello()
end

function Xiangqian()
	Talk(1,"","ViÖc nµy rÊt ®¬n gi¶n, kü thuËt cña l·o L­u ta kh«ng gièng nh÷ng ng­êi cña thÕ gia, nhÊp ph¶i vµo linh th¹ch lµ cã thÓ tiÕn hµnh thao t¸c kh¶m, kh«ng cÇn ph¶i t×m ng­êi kh¶m gióp.")
end

function Xiangbagua()
	Talk(1,"","Sau khi ®Æt trang bŞ vµo giao diÖn kh¶m xem chi tiÕt, do ®iÓm linh khİ trang bŞ tèi ®a lµ mét sè lÎ hoÆc sè ch½n, ®­îc chia thµnh ©m d­¬ng, v× thÕ mçi trang bŞ chØ cã thÓ xuÊt hiÖn 2 lo¹i thuéc quÎ trong <color=yellow>B¸t qu¸i<color>, xem thuéc quÎ trong giao diÖn kh¶m nh¾c nhë cã quÎ nµo ng­¬i cÇn kh«ng. Sau khi ®Æc 1 linh th¹ch kh¶m vµo th× x¸c nhËn b­íc 1, thuéc quÎ mµ nã cã thÓ xuÊt hiÖn chØ cßn l¹i <color=yellow>2<color>. Sau khi ®Æt linh th¹ch thø hai vµo c¬ b¶n ®· x¸c nhËn thuéc quÎ mµ trang bŞ nµy sÏ xuÊt hiÖn, v× thÕ nhÊt ®Şnh ph¶i xem cho kü!")
end

function Baguaqianghua()
	Talk(1,"","Trang bŞ b¸t qu¸i tù nhiªn còng cã thÓ c­êng hãa, s¾t cña l·o L­u ta kh«ng ph¶i miÔn phİ. Nh­ng nÕu ng­¬i kİch ho¹t trang bŞ b¸t qu¸i thµnh ®å b¸t qu¸i, ®å b¸t qu¸i th× ta kh«ng cã c¸ch. Nh­ng sau khi ng­¬i mang ®å b¸t qu¸i vµo ng­êi, tõ cét trang bŞ ®Æt trang bŞ b¸t qu¸i trong bé b¸t qu¸i vµo cét c­êng hãa, l·o L­u ta sÏ c­êng hãa. ")
end

function change_nott()
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","Kh«ng cã N÷ Oa Tinh Th¹ch trong hµnh trang nªn kh«ng thÓ tiÕn hµnh ®æi!")
		return
	end
	if GetItemCount(2,0,555) < 1 then
		Talk(1,"","Kh«ng cã Cµn Kh«n Phï trong hµnh trang nªn kh«ng thÓ tiÕn hµnh ®æi!")
		return
	end
	PutinItemBox("Më khãa vËt phÈm" , 2, "X¸c nhËn muèn thùc hiÖn?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbItem = {{2,0,555}, {2,1,504}}
	if gf_JudgeRoomWeight(2,200,"") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end
	for i = 1, getn(tbItem) do
		if genre == tbItem[i][1] and detail == tbItem[i][2] and particular == tbItem[i][3] then
			return 1
		end
	end
	Talk(1, "", "ChØ cã thÓ bá vµo N÷ Oa Tinh Th¹ch vµ Cµn Kh«n Phï!");
	return 0
end

function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "","Bá vµo vËt phÈm kh«ng ®óng");
		return 0
	end
	local itemList = GetPutinItem()
	if get_item_count(itemList, 2,0,555) ~= 1 or get_item_count(itemList, 2,1,504) ~= 1 then
		Talk(1, "","Bá vµo vËt phÈm kh«ng ®óng");
		return 0		
	end
	local nResult = 1
	local nExpireTime = 0
	for i = 1, getn(itemList) do
		local nG, nD, nP = itemList[i][2], itemList[i][3], itemList[i][4]
		if nG == 2 and nD == 1 and nP == 504 then
			nExpireTime = GetItemExpireTime(itemList[i][1]) or 2*24*3600
		end
		if DelItemByIndex(itemList[i][1], -1) ~= 1 then
			nResult = 0
			break;
		end
	end
	if nResult == 1 then
		gf_AddItemEx2({2,1,504,1}, "N÷ Oa Tinh Th¹ch", "Chuyen Doi NOTT", "®æi thµnh c«ng", nExpireTime)
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
	local nMofa1,nLv1 = 0,0
	local nMofa2,nLv2 = 0,0
	local nMofa3,nLv3 = 0,0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
			if t[i][2] == 0 then
				nQianghua = GetEquipAttr(t[i][1],2)
				nDing = GetItemSpecialAttr(t[i][1],"DING7")
				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
				nRandSeed = GetItemRandSeed(t[i][1])				
				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
			end
		end
	end
	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
end

tCheck = {
	[1] =  {10, 1, 1, {{0,102,38}, {0,102,39}, {0,102,40}, {0,100,95}, {0,100,96}, {0,100,97}, {0,100,98}, {0,103,95}, {0,103,96}, {0,103,97}, {0,103,98}, {0,101,95}, {0,101,96}, {0,101,97}, {0,101,98}}},	
	[2] =  {19, 1, 1, {{0,102,30001}, {0,102,30002}, {0,102,30003}, {0,102,30004}, {0,102,30005}, {0,102,30006}, {0,102,30007}, {0,102,30008}, {0,102,30009}, {0,102,30010}, {0,102,30011}, {0,102,30011}, {0,103,30001}, {0,103,30002}, {0,103,30003}, {0,103,30004}, {0,101,30001}, {0,101,30002}, {0,101,30003}, {0,101,30004}, {0,100,30001}, {0,100,30002}, {0,100,30003}, {0,100,30004}}},	
	[3] =  {7, 1, 0, {{0,3,6001}, {0,5,6002}, {0,8,6003}, {0,0,6004}, {0,1,6005}, {0,2,6006}, {0,10,6007}, {0,0,6008}, {0,5,6009}, {0,2,6010}, {0,9,6011}, {0,6,6012}, {0,4,6013}, {0,7,6014}, {0,11,6015}}},	
}
function get_PhiYen(nSelected)
	if gf_Judge_Room_Weight(tCheck[nSelected][1], 500, "") == 0 then
        	return 0;
     end
     if GetItemCount(2, 1, 504) < tCheck[nSelected][2] then
		Talk(1, "", "B¹n kh«ng mang theo N÷ oa tinh th¹ch!")
		return 0
	end
	if GetItemCount(2, 1, 539) < tCheck[nSelected][3] then
		Talk(1, "", "B¹n kh«ng mang theo Hoµng Kim §¹i Hång Bao (chøa 999 vµng)!")
		return 0
	end
	
	local nCheck = 0
	for i = 1, getn(tCheck[nSelected][4]) do
		local nG, nD, nP = gf_UnPack(tCheck[nSelected][4][i])
		if (DelItem(nG, nD, nP, 1) == 1) then
			nCheck = 1
			break
		end	
	end
	if nCheck < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo vËt phÈm cÇn ph©n r·, vui lßng kiÓm tra l¹i !!!")
		return 0
	end
	
     if DelItem(2, 1, 504, tCheck[nSelected][2]) == 1 and DelItem(2, 1, 539, tCheck[nSelected][3]) == 1 then
		gf_AddItemEx2({2,1,30130,tCheck[nSelected][1]}, "Phi Yªn Th¹ch (t¸ch)", "TACH TRANG BI", "nhËn thµnh c«ng")	 
		Msg2Player("B¹n nhËn ®­îc "..tCheck[nSelected][1].." Phi YÕn Th¹ch")    		
     end
     
end

function get_ManhThienThach()
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local tbSayDialog = {};
	local szSayHead = "<color=green>Thî rÌn L­u<color>: Ta ®ang t×m m¶nh thiªn th¹ch bŞ thÊt l¹c, ®¹i hiÖp gióp ta th× sÏ cã hËu t¹ !!!."
	if nNV == 0 then
--		tinsert(tbSayDialog, "NhËn nhiÖm vô/accept_MTT")
	else
		tinsert(tbSayDialog, "Hoµn thµnh nhiÖm vô/finish_MTT")
	end
	tinsert(tbSayDialog, "KiÓm tra tiÕn ®é hoµn thµnh nhiÖm vô/get_infor_MTT")	
	tinsert(tbSayDialog, "QuyÒn lîi/rule_MTT")
	tinsert(tbSayDialog, "T¹i h¹ chØ ghĞ qua !/zhaohu")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function accept_MTT()
	if GetLevel() < 79 then
		Talk(1, "", "§¹i hiÖp ph¶i cã ®¼ng cÊp 79 trë lªn míi tham gia tİnh n¨ng nµy ®­îc !!!")
		return
	end
	local nMTT_NV = floor(GetTask(TSK_MTT_COUNT) / 10000000)
	local nNum_MTT = mod(GetTask(TSK_MTT_COUNT),10000000)
	if mod(nMTT_NV,10) == 0 then
		nMTT_NV = (nMTT_NV + 1) * 10000000 + nNum_MTT
		SetTask(TSK_MTT_COUNT, nMTT_NV)
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nhËn thµnh c«ng", 1, "NhËn nhiÖm vô ")		
	end
	local tbSayDialog = {};
	local szSayHead = "<color=green>Thî rÌn L­u<color>: Chóc mõng ®¹i hiÖp ®· nhËn nhiÖm vô thµnh c«ng !!!."
	tinsert(tbSayDialog, "KiÓm tra tiÕn ®é hoµn thµnh nhiÖm vô/get_infor_MTT")	
	tinsert(tbSayDialog, "QuyÒn lîi/rule_MTT")
	tinsert(tbSayDialog, "T¹i h¹ chØ ghĞ qua !/zhaohu")	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function rule_MTT()
	Talk(1,"","<color=green>Thî rÌn L­u<color>: H­íng dÉn nhiÖm vô !!! \nNhËn nhiÖm vô <color=red>1 lÇn/tuÇn<color> \nReset nhiÖm vô vµo thø 2 hµng tuÇn \nPh¶i cã ®ñ 500 Thiªn Th¹ch + 3000 vµng míi cã thÓ nhËn th­ëng \nPhÇn th­ëng: 100 triÖu ®iÓm kinh nghiÖm (cè ®Şnh) vµ nhËn vËt phÈm ngÉu nhiªn <color=red>(M¶nh thiªn th¹ch hoÆc Thiªn Th¹ch Tinh Th¹ch)<color>")
end

function get_infor_MTT()
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local nPT = mod(floor(GetTask(TSK_MTT_COUNT) / 100000000),10)
	if nPT == 0 then
		Talk(1,"","<color=green>Thî rÌn L­u<color>: C¸c nhiÖm vô ®· hoµn thµnh !!! \nTrång h¹t gièng: <color=red>"..nMTT_HG.."/150<color> \nNhiÖm vô Cóng TÕ: <color=red>"..nMTT_CT.."/6<color> \nNhiÖm vô Thñy L¬i: <color=red>"..nMTT_TL.."/6<color>\nTr¹ng th¸i nhiÖm vô: <color=red>®ang lµm nhiÖm vô<color>")
	else
		Talk(1,"","<color=green>Thî rÌn L­u<color>: C¸c nhiÖm vô ®· hoµn thµnh !!! \nTrång h¹t gièng: <color=red>"..nMTT_HG.."<color> \nNhiÖm vô Cóng TÕ: <color=red>"..nMTT_CT.."<color> \nNhiÖm vô Thñy L¬i: <color=red>"..nMTT_TL.."<color>\nTr¹ng th¸i nhiÖm vô: <color=red>hoµn thµnh vµ ®·  nhËn th­ëng<color>")
	end		
end
function finish_MTT()
	local tbAward = {
						{1, 9980, "M¶nh Thiªn Th¹ch ", {2, 2, 7, 1}, 0},
						{1, 20, "Thiªn Th¹ch Tinh Th¹ch ", {2, 1, 1009, 1}, 0},						
					}
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	
	local nMTT_NT = floor(GetTask(TSK_MTT_COUNT) / 100000000)
	local nNum_MTT_NT = mod(GetTask(TSK_MTT_COUNT),100000000)
	if mod(nMTT_NT,10) == 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn th­ëng råi. TuÇn sau h·y ®Õn t×m ta ®Ó nhËn nhiÖm vô míi")
		return 0
	end	
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
--    if GetExp() + 100000000 > 2000000000 then
--		Talk(1,"","§iÓm kinh nghiÖm cña ®¹i hiÖp qu¸ nhiÒu, sö dông bít ®iÓm kinh nghiÖm råi h·y nhËn th­ëng !!!.")
--		return 0	    
--    end
	if nMTT_HG < 150 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong sè l­îng trång c©y.")
		return 0	
	end
	if nMTT_CT < 6 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong sè l­îng nhiÖm vô Cóng TÕ.")
		return 0	
	end
	if nMTT_TL < 6 then
		Talk(1,"","§¹i hiÖp ch­a hoµn thµnh xong sè l­îng nhiÖm vô Thñy Lîi.")
		return 0	
	end
	if GetItemCount(2,2,8) < 500 then
		Talk(1,"","§¹i hiÖp kh«ng cã ®ñ 500 Thiªn Th¹ch ®Ó nhËn th­ëng.")
		return 0		
	end
	if GetCash() < 30000000 then
		Talk(1,"","§¹i hiÖp kh«ng cã ®ñ 3000 vµng ®Ó nhËn th­ëng.")
		return 0			
	end
		
	if mod(nMTT_NT,10) == 0 then
		nMTT_NT = (nMTT_NT + 1) * 100000000 + nNum_MTT_NT
		SetTask(TSK_MTT_COUNT, nMTT_NT)
	end	
	if DelItem(2,2,8,500) == 1 and Pay(30000000) == 1 then
		ModifyExp(100000000)
		local tbAwardRate = {[1] = 0, [2] = 0}
		local nIndex = 0
		for i=1,500 do
			if random(0,10000) < 20 then
				nIndex = 1
			else
				nIndex = 2
			end
			tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
		end
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 1009, tbAwardRate[1]}, "Thiªn Th¹ch Tinh Th¹ch", "CHUOI NHIEM VU MTT - 1" , "nhËn")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2, 2, 7, tbAwardRate[2]}, "M¶nh Thiªn Th¹ch", "CHUOI NHIEM VU MTT - 2" , "nhËn")
		end
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nhËn thµnh c«ng", 1, "PhÇn th­ëng")
	end
	
end