--filename:ningcaichen.lua
--create date:2006-01-21
--author:yanjun
--describe:Äş²É³¼½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local selTab = {
				"Ta ®ång ı/ok",
				"§Ó ta suy nghÜ l¹i/nothing"
				}
	if NoTaskBegin() == 1 then
		Say("4 nhiÖm vô nµy cÇn ph¶i tæ ®éi thùc hiÖn suèt tõ ®Çu ®Õn cuèi! NÕu kh«ng sÏ kh«ng thÓ hoµn thµnh",2,selTab)
	else
		ok()
	end
end

function ok()
	if GetTask(TASK_LOVESTORY3) == 0 then
		Talk(2,"","huhu……",
				"ThËt nguy hiÓm!")
	elseif CanAcceptTask(TASK_LOVESTORY3,1) == 1 then
		Talk(6,"","Cã viÖc g× mµ vÎ mÆt c«ng tö hèc h¸c thÕ?",
				"Ta vµ TiÓu S¶nh muèn bá trèn, nh­ng Quû Vùc L·o L·o ph¸t hiÖn, suıt chót n÷a mÊt m¹ng, hiÖn giê vÉn cßn run sî!",
				"Ch¶ tr¸ch!",
				"May m¾n tho¸t ®­îc, nh­ng TiÓu S¶nh v× cøu ta nªn bŞ Quû Vùc L·o L·o b¾t, hiÖn bŞ cÇm gi÷ ë Giang T©n th«n, Ta kh«ng nghÜ ra c¸ch cøu nµng, nhŞ vŞ h·y gióp ta víi1",
				"§­îc! §Ó ta gióp.",
				"<color=yellow>TiÓu S¶nh<color> ®ang ë <color=red>Giang T©n th«n<color>, nhê nhŞ vŞ th¨m dß t×nh h×nh TiÓu S¶nh råi vÒ nãi cho ta biÕt.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("TiÕp nhËn nhiÖm vô thÊt b¹i, xin h·y thö l¹i!",0)
			return 0
		end		
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY3,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("§Õn Giang T©n th«n gÆp NhiÕp TiÓu S¶nh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY3,2) == 1 or CanAcceptTask(TASK_LOVESTORY3,3) == 1 then
		Say("C¸c vŞ vÉn ch­a ®i ­? <color=yellow>TiÓu S¶nh<color>hiÖn ë <color=red>Giang T©n th«n<color>.",0)
	elseif CanAcceptTask(TASK_LOVESTORY3,4) == 1 then
		Talk(5,"","Sao thÕ? GÆp TiÓu S¶nh ch­a? Nµng vÉn kháe chø? L·o L·o cã b¾t ®­îc ch­a?",
				"Nµng vÉn b×nh an, chØ lµ bŞ Quû Vùc L·o L·o ®iÓm bïa ®Şnh th©n, nh­ng ®· ®­îc hãa gi¶i. NÕu kh«ng ®¸nh b¹i L·o L·o th× TiÓu S¶nh vÜnh viÔn kh«ng ®­îc gi¶i tho¸t. Nghe nãi chØ cã YÕn Xİch Hµ b¶o kiÕm míi cã thÓ tiªu diÖt L·o L·o.",
				"C¸c vŞ muèn gióp tiªu diÖt Quû Vùc L·o L·o ­? ThËt hay qu¸! YÕn Xİch Hµ b¶o kiÕm vµ Ngäc béi lµ L·o L·o cho ta ®Ó phßng th©n, nay c¸c vŞ h·y lÊy mµ dïng, H·y ®Õn <color=red>Giang T©n th«n<color> ®iÓm nã, L·o L·o sÏ t­ëng ta ®Õn, nhÊt ®Şnh sÏ hiÖn th©n.",
				"§­îc! §Ó ta gióp.",
				"§Õn Phong §« sö dông <color=red>Ngäc béi<color>, Quû Vùc L·o L·o sÏ xuÊt hiÖn, nhŞ vŞ h·y cÇm YÕn Xİch Hµ b¶o kiÕm tiªu diÖt L·o. Ta vµ TiÓu S¶nh suèt ®êi kh«ng quªn ®¹i ©n ®¹i ®øc cña nhŞ vŞ.")
		local OldPlayerIndex = PlayerIndex
		if AddItem(2,0,353,1) == 1 and AddItem(2,0,354,1) == 1 then
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY3,5)
				TaskTip("§Õn Giang T©n th«n sö dông ngäc béi Ninh Th¸i ThÇn")
			end
			PlayerIndex = OldPlayerIndex
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		Say("§Õn Phong §« sö dông <color=red>Ngäc béi<color>, Quû Vùc L·o L·o sÏ xuÊt hiÖn, nhŞ vŞ h·y cÇm YÕn Xİch Hµ b¶o kiÕm tiªu diÖt L·o. Ta vµ TiÓu S¶nh suèt ®êi kh«ng quªn ®¹i ©n ®¹i ®øc cña nhŞ vŞ.",0)
		if GetItemCount(2,0,354) == 0 then
			AddItem(2,0,354,1)
			TaskTip("§Õn Giang T©n th«n sö dông ngäc béi Ninh Th¸i ThÇn")
		end
		if GetItemCount(2,0,353) == 0 then
			AddItem(2,0,353,1)
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,6) == 1 then
		Talk(4,"","Cã tin mõng! Quû Vùc L·o L·o ®· bŞ ®¸nh b¹i! Tr¶ cho c«ng tö YÕn Xİch Hµ b¶o kiÕm.",
				"Ta ®ang m¬ sao? ThËt hay qu¸! Tõ nay kh«ng cßn ai c¶n trë n÷a!",
				"ThÕ th× tèt, chóc ®«i t×nh nh©n sím thµnh phu thª!",
				"Chóc nhŞ vŞ vui vÎ! §©y lµ mãn quµ t¹ lÔ, xin c¸c vŞ ®õng tõ chèi!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			DelItem(2,0,354,1)
			DelItem(2,0,353,1)
			SetTask(TASK_LOVESTORY3,7)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("Hoµn thµnh nhiÖm vô")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY3) == 7 then	
		Say("§a t¹, chóc nhŞ vŞ vui vÎ!",0)
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

function nothing()

end