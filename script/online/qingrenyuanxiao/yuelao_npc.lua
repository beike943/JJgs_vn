--filename:yuelao_npc.lua
--create date:2006-01-18
--author:yanjun
--describe:ÔÂÀÏ½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if GetLevel() < 10 then
		Say("B¹n míi b­íc ch©n vµo giang hå, h·y rÌn luyÖn thªm råi h·y ®Õn t×m ta.",0)
		return 0
	end
	if Is_QRYX_Activity() == 1 then
		local nDate = tonumber(date("%d"))
		if GetTask(TASK_GOT_AWARD) ~= nDate then
			SetTask(TASK_GOT_AWARD,0)
		end
		if GetTask(TASK_GOT_AWARD) ~= 0 then
			Say("H«m nay b¹n ®· hoµn thµnh xong tÊt c¶ nhiÖm vô lÔ t×nh nh©n vµ ®· nhËn gi¶i th­ëng, ngµy mai h·y lµm tiÕp nhĞ.",0)
			return 0
		end
		if GetTask(TASK_LOVESTORY1) == 0 or GetTask(TASK_LOVESTORY2) == 0 or GetTask(TASK_LOVESTORY3) == 0 or GetTask(TASK_LOVESTORY4) == 0 then
			local selTab = {
						"§o trŞ sè duyªn phËn/question1",
						"Xem néi dung ho¹t ®éng./know_detail",
						"Ta nhËn ®­îc gièng hoa hång, sö dông nh­ thÕ nµo?/know_useseed",
						"NhËn l¹i nhiÖm vô./reaccept",
						"KÕt thóc ®èi tho¹i./nothing"
						}
			Say("LÔ t×nh nh©n lµ do c¸c nhµ truyÒn gi¸o T©y Ph­¬ng mang ®Õn, hiÖn nay nã rÊt phæ biÕn.",5,selTab)
		elseif AllTaskComplete() == 1 then
			local selUseSeed = {
						"Ta muèn l·nh th­ëng./get_present",
						"Ta nhËn ®­îc gièng hoa hång, sö dông nh­ thÕ nµo?/know_useseed",
						"KÕt thóc ®èi tho¹i./nothing"
						}
			Say("Chóc mõng ng­¬i hoµn thµnh tÊt c¶ nhiÖm vô, t×m ta cã viÖc g×?",3,selUseSeed)
		else
			local selReset = {
						"Ta muèn lµm l¹i nhiÖm vô./reset",
						"Ta muèn tra xem quy t¾c nhiÖm vô./know_detail",
						"KÕt thóc ®èi tho¹i./nothing"
						}
			Say("Sao ch­a lµm nhiÖm vô vËy? GÆp khã kh¨n µ?",3,selReset)
		end
	else
		local selUseSeed = {
					"Ta muèn l·nh th­ëng./get_present",
					"Ta nhËn ®­îc gièng hoa hång, sö dông nh­ thÕ nµo?/know_useseed",
					"KÕt thóc ®èi tho¹i./nothing"
					}
		Say("Chóc c¸c ®«i t×nh nh©n sím thµnh phu thª.",3,selUseSeed)
	end
end

function abandon()
	SetTask(TASK_YUANFEN,0)
end

function nothing()

end

function question1()
	if GetTask(TASK_GOT_QRJ) == 1 then
		Say("B¹n ®· tr¶ lêi qu¸ c©u hái, lÏ nµo b¹n quªn chØ sè duyªn phËn! H·y sö dông T×nh nh©n kÕt ®Ó tra xem.",0)
		return 0
	end
	SetTask(TASK_YUANFEN,0)
	local ansTab = {
			"Thİch/#question2(9)",
			"Kh«ng mµng ®Õn/#question2(6)",
			"Kh«ng thİch/#question2(3)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	Say("C©u hái 1: B¹n cã thİch PK gi÷a nh÷ng ng­êi ch¬i víi nhau kh«ng?",4,ansTab)
end

function question2(i)
	local ansTab = {
			"Thİch/#question3(3)",
			"Kh«ng mµng ®Õn/#question3(6)",
			"Kh«ng thİch/#question3(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u hái 2: B¹n cã thİch nh÷ng c©u chuyÖn trong chuçi nhiÖm vô liªn hoµn kh«ng?",4,ansTab)
end

function question3(i)
	local ansTab = {
			"Thİch/#question4(3)",
			"Kh«ng mµng ®Õn/#question4(6)",
			"Kh«ng thİch/#question4(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u hái 3: B¹n cã thİch kü n¨ng sèng kh«ng?",4,ansTab)
end

function question4(i)
	local ansTab = {
			"Thİch/#question5(9)",
			"Kh«ng mµng ®Õn/#question5(6)",
			"Kh«ng thİch/#question5(3)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u hái 4: B¹n cã thİch lµm bang chñ kh«ng?",4,ansTab)
end

function question5(i)
	local ansTab = {
			"Thİch/#question6(3)",
			"Kh«ng mµng ®Õn/#question6(6)",
			"Kh«ng thİch/#question6(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 5: B¹n cã thİch ngo¹i trang kh«ng?",4,ansTab)
end

function question6(i)
	local ansTab = {
			"Thİch/#question7(9)",
			"Kh«ng mµng ®Õn/#question7(6)",
			"Kh«ng thİch/#question7(3)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 6: B¹n cã thİch trang bŞ cùc phÈm kh«ng?",4,ansTab)
end

function question7(i)
	local ansTab = {
			"Thİch/#question8(3)",
			"Kh«ng mµng ®Õn/#question8(6)",
			"Kh«ng thİch/#question8(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 7: B¹n cã thİch hÖ thèng bµy b¸n ®Æc biÖt s¾p më kh«ng?",4,ansTab)
end

function question8(i)
	local ansTab = {
			"Thİch/#question9(3)",
			"Kh«ng mµng ®Õn/#question9(6)",
			"Kh«ng thİch/#question9(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 8: B¹n cã thİch t¹o thªm m«n ph¸i míi kh«ng?",4,ansTab)
end

function question9(i)
	local ansTab = {
			"Thİch/#question10(3)",
			"Kh«ng mµng ®Õn/#question10(6)",
			"Kh«ng thİch/#question10(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 9: B¹n cã thİch hÖ thèng thó nu«i kh«ng?",4,ansTab)
end

function question10(i)
	local ansTab = {
			"Thİch/#question11(3)",
			"Kh«ng mµng ®Õn/#question11(6)",
			"Kh«ng thİch/#question11(9)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 10: B¹n cã thİch khiªu chiÕn víi BOSS cÊp cao kh«ng?",4,ansTab)
end

function question11(i)
	local ansTab = {
			"Thİch/#endquestion(9)",
			"Kh«ng mµng ®Õn/#endquestion(6)",
			"Kh«ng thİch/#endquestion(3)",
			"LÇn sau míi nãi tiÕp nhĞ./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C©u 11: B¹n cã thİch khiªu chiÕn trong Tµng KiÕm s¬n trang?",4,ansTab)
end

function endquestion(i)
	if GetTask(TASK_YUANFEN) >= 30 then
		AddItem(2,1,333,1)	--ÇéÈË½á
		SetTask(TASK_LOVESTORY1,1)
		SetTask(TASK_LOVESTORY2,1)
		SetTask(TASK_LOVESTORY3,1)
		SetTask(TASK_LOVESTORY4,1)
		TaskTip("§Ó tra xem nhiÖm vô lÔ t×nh nh©n, nhÊn F11.")
		Msg2Player("B¹n ®· nhËn 4 nhiÖm vô tõ NguyÖt l·o, h·y tra xem trong giao diÖn nhiÖm vô.")
		SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
		SetTask(TASK_GOT_QRJ,1)
		CreateTrigger(0,1202,3110) --µôÇÉ¿ËÁ¦´¥·¢Æ÷
		Say("Ha! Ha! ChØ sè duyªn phËn cña ng­¬i lµ: <color=yellow>"..GetTask(TASK_YUANFEN).."<color>, h·y mau ®i t×m ı trung nh©n cña m×nh ®i.",0)
	end
end

function know_detail()
	Talk(4,"main","Khi ho¹t ®éng míi b¾t ®Çu, cã thÓ tr¾c nghiÖm chØ sè duyªn phËn ë chç ta. Sau ®ã hai ng­¬i gióp ta t¸c hîp 4 ®«i uyªn ­¬ng kh¸c.",
				"H·y gióp ta t¸c hîp 4 ®«i t×nh nh©n, sau ®ã quay l¹i ®©y nhËn th­ëng nhĞ!",
				"§©y xem nh­ lµ 4 nhiÖm vô nhá, mçi nhiÖm vô mçi ngµy mçi ng­êi chØ cã thÓ lµm 1 lÇn. §ång thêi 2 ng­êi vÉn trong tæ ®éi th× míi hoµn thµnh nhiÖm vô, nÕu kh«ng th× nhiÖm vô h«m ®ã xem nh­ kh«ng hoµn thµnh.",
				"Sù kh¸c nhau chØ sè duyªn phËn vµ ®é th©n thiÖn cña 2 ng­êi sÏ ¶nh h­ëng ®Õn x¸c suÊt r¬i vËt phÈm nhiÖm vô. NÕu chØ sè duyªn phËn t­¬ng ®ång hoÆc ®é th©n thiÖn lín h¬n 2000 th× x¸c suÊt r¬i vËt phÈm cao nhÊt, ng­îc l¹i sÏ thÊp dÇn.")
end

function reset()
	SetTask(TASK_LOVESTORY1,1)
	SetTask(TASK_LOVESTORY2,1)
	SetTask(TASK_LOVESTORY3,1)
	SetTask(TASK_LOVESTORY4,1)
	SetTask(TASK_TEAM_INDEX,0)
	Say("Th«i ®­îc, lÔ héi t×nh nh©n ®· b¾t ®Çu, ng­¬i h·y nhanh chãng tham gia!",0)
	TaskTip("§Ó tra xem nhiÖm vô lÔ t×nh nh©n, nhÊn F11.")	
	Msg2Player("B¹n ®· nhËn 4 nhiÖm vô tõ NguyÖt l·o, h·y tra xem trong giao diÖn nhiÖm vô.")
end

function get_present()
	if AllTaskComplete() == 1 then
		if IsLoversTeam() == 1 then
			local nDate = tonumber(date("%d"))
			local OldPlayerIndex = PlayerIndex
			local maleIndex,femaleIndex = GetLoversIndex()
			local teamIndex1,teamIndex2
			PlayerIndex = maleIndex
			teamIndex1 = GetTask(TASK_TEAM_INDEX)
			PlayerIndex = femaleIndex
			teamIndex2 = GetTask(TASK_TEAM_INDEX)
			if teamIndex1 ~= teamIndex2 then
				Say("Tho¹t ®Çu lµ ®«i b¹n, sao b©y giê lµ ®«i t×nh nh©n vËy?",0)
				PlayerIndex = OldPlayerIndex
				return 0
			else
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					if GetSex() == 1 then
						if AddItem(2,0,352,1) == 1 then	--Ãµ¹å»¨ÖÖ×Ó
							Msg2Player("B¹n nhËn ®­îc 1 h¹t gièng hoa hång.")
							WriteLog("[Ho¹t ®éng lÔ t×nh nh©n vµ tÕt nguyªn tiªu (phÇn th­ëng hoµn thµnh nhiÖm vô)]:"..GetName().."NhËn ®­îc 1 h¹t gièng hoa hång.")						
						end
					end
					if AddItem(2,1,332,1) == 1 then	--Ö¥ÂéÇßÏãÔªÏü
						WriteLog("[Ho¹t ®éng lÔ t×nh nh©n vµ tÕt nguyªn tiªu (phÇn th­ëng hoµn thµnh nhiÖm vô)]:"..GetName().."NhËn ®­îc 1 Chi Ma H­¬ng")
						Msg2Player("B¹n nhËn ®­îc 1 Chi Ma H­¬ng")
					end
					SetTask(TASK_GOT_AWARD,nDate)
					SetTask(TASK_LOVESTORY1,0)
					SetTask(TASK_LOVESTORY2,0)
					SetTask(TASK_LOVESTORY3,0)
					SetTask(TASK_LOVESTORY4,0)
					SetTask(TASK_TEAM_INDEX,0)	
				end
				PlayerIndex = OldPlayerIndex
			end
		else
			Say("Tho¹t ®Çu lµ ®«i b¹n, sao b©y giê lµ ®«i t×nh nh©n vËy?",0)
		end
	else
		Say("H«m nay b¹n ®· hoµn thµnh xong tÊt c¶ nhiÖm vô lÔ t×nh nh©n vµ ®· nhËn gi¶i th­ëng, ngµy mai h·y lµm tiÕp nhĞ.",0)
	end
end

function know_useseed()
	Talk(3,"main","Sau khi hoµn thµnh nhiÖm vô t×nh yªu, nh©n vËt nam sÏ nhËn ®­îc h¹t gièng hoa hång vµ lé thñy, chØ cã ng­êi nam trong tæ ®éi míi cã thÓ trång h¹t gièng hoa hång, sau khi trång, t¹i vŞ trİ ng­êi nam ®ang ®øng sÏ hiÖn lªn 1 c©y con mang tªn nh©n vËt n÷.",
				"Cø 30 phót cã thÓ t­íi lé thñy cho c©y con mét lÇn, trong qu¸ tr×nh t­íi n­íc 2 ng­êi vÉn ë trong tæ ®éi. NÕu nh­ trong vßng 1h, kh«ng t­íi n­íc, hoa hång sÏ kh« chÕt.",
				"Mçi lÇn t­íi n­íc, hoa sÏ lín lªn, sau 30 phót ë tr¹ng th¸i hoa hång, ng­êi n÷ míi cã thÓ h¸i xuèng.")
end

function reaccept()
	if GetTask(TASK_GOT_QRJ) == 0 then
		Say("B¹n vÉn ch­a tiÕp nhËn tr¾c nghiÖm chØ sè duyªn phËn µ?",0)
	else
		SetTask(TASK_LOVESTORY1,1)
		SetTask(TASK_LOVESTORY2,1)
		SetTask(TASK_LOVESTORY3,1)
		SetTask(TASK_LOVESTORY4,1)
		SetTask(TASK_TEAM_INDEX,0)		
		Say("Th«i ®­îc, lÔ héi t×nh nh©n ®· b¾t ®Çu, ng­¬i h·y nhanh chãng tham gia!",0)
		TaskTip("§Ó tra xem nhiÖm vô lÔ t×nh nh©n, nhÊn F11.")
		Msg2Player("B¹n ®· nhËn 4 nhiÖm vô tõ NguyÖt l·o, h·y tra xem trong giao diÖn nhiÖm vô.")
	end
end