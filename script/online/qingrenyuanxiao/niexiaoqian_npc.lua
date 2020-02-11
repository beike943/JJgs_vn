--filename:niexiaoqian.lua
--create date:2006-01-21
--author:yanjun
--describe:ÄôĞ¡Ù»½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY3,2) == 1 then
		Talk(5,"","C« n­¬ng cã ph¶i lµ NhiÕp TiÓu S¶nh kh«ng? Ninh Th¸i ThÇn ®· b×nh an quay vÒ Thµnh §«, nhê ta ®Õn hái th¨m. C« n­¬ng vÉn kháe chø?",
				"Ta vÉn kháe, L·o L·o kh«ng ®Ó ta bŞ g× ®©u, nh­ng L·o L·o ®· d¸n cho ta 1 tÊm ®Şnh th©n phï kh«ng cho bá trèn.",
				"Cã c¸ch nµo hãa gi¶i kh«ng?",
				"§Şnh th©n phï sî nhÊt lµ m¸u chã, h·y t×m <color=red>3 chĞn H¾c KhuyÓn Linh HuyÕt<color> ®Ó hãa gi¶i nã.",
				"Hay qu¸! Ta ®i ngay ®©y!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY3,3)
			TaskTip("T×m 3 H¾c KhuyÓn Linh HuyÕt cho NhiÕp TiÓu S¶nh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY3,3) == 1 then
		if GetItemCount(2,2,33) >= 3 then
			DelItem(2,2,33,3)
			Talk(6,"","Chİnh lµ c¸i nµy, cã thÓ hãa gi¶i ®Şnh th©n phï råi. MÆc dï kh«ng bŞ bã buéc, nh­ng còng kh«ng thÓ ch¹y tho¸t.",
					"VËy th× h·y ®Ó ta ®¸nh b¹i L·o L·o",
					"Kh«ng thÓ, Quû Vùc L·o L·o qu¸ nham hiÓm, c¸c vŞ kh«ng ®¸nh næi ®©u",
					"Ph¶i thö míi biÕt.",
					"Th«i ®­îc, muèn tiªu diÖt ®­îc Quû Vùc L·o L·o ph¶i cã <color=red>YÕn Xİch Hµ b¶o kiÕm<color>, hiÖn ®ang ë chç Ninh c«ng tö. LÇn tr­íc YÕn Xİch Hµ tÆng b¶o kiÕm cho <color=yellow>Th¸i ThÇn<color> ®Ó trõ tµ ma.",
					"VËy ®Ó ta ®Õn chç Ninh Th¸i ThÇn.")
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY3,4)
				TaskTip("T×m Ninh Th¸i ThÇn lÊy YÕn Xİch Hµ b¶o kiÕm.")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("§Şnh th©n phï sî nhÊt lµ m¸u chã, h·y t×m <color=red>3 chĞn H¾c KhuyÓn Linh HuyÕt<color> ®Ó hãa gi¶i nã.",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,4) == 1 then
		Say("Th«i ®­îc, muèn tiªu diÖt ®­îc Quû Vùc L·o L·o ph¶i cã <color=red>YÕn Xİch Hµ b¶o kiÕm<color>, hiÖn ®ang ë chç Ninh c«ng tö. LÇn tr­íc YÕn Xİch Hµ tÆng b¶o kiÕm cho <color=yellow>Th¸i ThÇn<color> ®Ó trõ tµ ma.",0)
	elseif CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		Say("B»ng h÷u ®· lÊy ®­îc YÕn Xİch Hµ b¶o kiÕm, nÕu nh­ ®¸nh b¹i L·o L·o, ta vµ Th¸i ThÇn suèt ®êi kh«ng quªn ¬n.",0)
	elseif GetTask(TASK_LOVESTORY3) == 6 or GetTask(TASK_LOVESTORY3) == 7 then
		Say("§a t¹, chóc nhŞ vŞ vui vÎ!",0)
	elseif GetTask(TASK_LOVESTORY3) == 0 or GetTask(TASK_LOVESTORY3) == 1 then
		Say("Kh«ng biÕt Th¸i ThÇn hiÖn giê b×nh an hay kh«ng……",0)
	elseif GetTeamSize() == 2 then
		Say("Tho¹t ®Çu lµ ®«i b¹n, sao b©y giê lµ ®«i t×nh nh©n vËy?",0)
	else
		Say("D­êng nh­ 1 m×nh ng­¬i kh«ng thÓ gióp ta, ph¶i lµ 1 ®«i t×nh nh©n míi ®­îc.",0)
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H·y ®Õn NguyÖt l·o l·nh th­ëng.")
		Msg2Player("Cuèi cïng ®· gióp NguyÖt l·o t¸c hîp cho 4 cÆp t×nh nh©n, h·y mau gÆp NguyÖt l·o l·nh th­ëng.")
	end
end