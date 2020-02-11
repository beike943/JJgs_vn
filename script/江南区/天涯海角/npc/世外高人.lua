---ÊÀÍâ¸ßÈË.lua---
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

szNpcName = "<color=green>ThÕ Ngo¹i cao nh©n<color>: "

function main()
	local nTaskTrans = GetTaskTrans()

	local tSay = {
							"H·y gióp ta vÒ Trung Nguyªn/bianjing_gaoren",
							"Khã kh¨n l¾m míi ®Õn ®­îc ®¶o nµy, ta ph¶i ®i tham quan xem thÕ nµo!/no",
						 }
	if nTaskTrans >= 16 and nTaskTrans < 23 then		
		tinsert(tSay ,1,"T×m hiÓu c¸c h­íng tu luyÖn/view_info")	
		tinsert(tSay ,1,"NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/translife_task_3")
	end
	
	if GetTranslifeCount() == 3 and GetLevel() == 99 and nTaskTrans < 25 then
		tinsert(tSay ,1,"T×m hiÓu c¸c h­íng tu luyÖn/view_info")	
		tinsert(tSay ,1,"V·n bèi muèn häc Hçn Nguyªn C«ng thµnh thø 8/learn_translife_skill_04")
	end
		
	Say("<color=green>ThÕ Ngo¹i cao nh©n<color>: B»ng h÷u sao l­u l¹c ®Õn ®¶o nµy? Ch¾c ®· chŞu nhiÒu vÊt v¶! Cã muèn trë vÒ Trung Nguyªn kh«ng?",getn(tSay),tSay)
end;

function translife_task_3()
	if GetTaskTrans() == 16 then
		trans_talk_16()
	elseif GetTaskTrans() == 17 then
		trans_talk_17()
	elseif GetTaskTrans() == 18 then
		trans_talk_18()
	elseif GetTaskTrans() == 19 then
		trans_talk_19()
	elseif GetTaskTrans() == 20 then
		trans_talk_20()
	elseif GetTaskTrans() == 21 then
		trans_talk_21()
	elseif GetTaskTrans() == 22 then		
		trans_talk_22()
	elseif GetTaskTrans() >= 23 then
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
end

function learn_translife_skill_04()
	local nTaskTrans = GetTaskTrans()
	if nTaskTrans ~= 24 then
		Talk(1, "", "§¹i hiÖp vui lßng nhËn Ngäc Béi Kü N¨ng miÔn phİ tr­íc khi lµm nhiÖm Hçn Nguyªn C«ng thµnh thø 8!")
		return
	end
	local szHeader = "§¹i hiÖp muèn C¶i l·o hoµn ®ång? Tr­íc tiªn ph¶i ®¸nh b¹i ®­îc Ng« ViÖt L·o Tæ. Nghe nãi B¹ch Tiªn Sinh cã c¸ch ®¸nh b¹i Ng« ViÖt L·o Tæ. §¹i hiÖp mau lªn ®­êng gÆp thö xem."
	local tSay = {}
	
	tinsert(tSay, "V·n bèi sÏ ®i gÆp B¹ch Tiªn Sinh ®Ó hái th¨m ngay/trans_talk_24")
	tinsert(tSay, "V·n bèi ®ang bËn, sÏ quay l¹i vµo lóc kh¸c/no")
	
	Say(szHeader, getn(tSay), tSay)
end

function bianjing_gaoren()
	DelMSPlayer(44,0);
end;

function no()
end;