--filename:liangshanbo_npc.lua
--create date:2006-01-21
--author:yanjun
--describe:ÁºÉ½²®½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")


function main()
	if CanAcceptTask(TASK_LOVESTORY1,3) == 1 then
		Talk(4,"","VŞ nµy ch¾c lµ L­¬ng S¬n B¸ råi? Chóc Anh §µi gÇn ®©y cã viÖc bËn, b¶o ta ®Õn hái th¨m c«ng tö!",
				"Ta ®ang buån chÕt mÊt th«i! <color=yellow>Kim Lan thiÖp<color> tİn vËt kÕt nghÜa cña ta vµ Chóc hiÒn ®Ö ®· bŞ mÊt. Ta nghi ngê lµ do th»ng nhãc nghŞch ngîm <color=red>Tø Cöu<color> lÊy. Nh­ng ta kh«ng tiÖn ®ßi nã. ThËt lµ phiÒn qu¸.",
				"T­ëng chuyÖn g× chø viÖc nµy rÊt dÔ, ®Ó ta ®i hái cho.",
				"ThÕ th× hay qu¸, <color=red>Tø Cöu<color> hiÖn ®ang ch¬i ë D­¬ng Ch©u, xin h·y gióp ta!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,4)
			TaskTip("§Õn D­¬ng Ch©u t×m Tø Cöu lÊy l¹i Kim Lan thiÖp.")
		end
		PlayerIndex = OldPlayerIndex	
	elseif CanAcceptTask(TASK_LOVESTORY1,4) == 1 or CanAcceptTask(TASK_LOVESTORY1,5)== 1 then
		Say("<color=red>Tø Cöu<color> th»ng bĞ nµy ®ang ch¬i ë D­¬ng Ch©u ®Êy!",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,6) == 1 then
		Talk(2,"","¤! H«! Ng­êi ®· kiÕm l¹i Kim Lan thiÖp råi sao! §a t¹! Xin gióp ta chuyÓn lêi víi Chóc hiÒn ®Ö, ta d¹o nµy vÉn kháe, cã r¶nh cïng uèng trµ ng©m th¬!",
				"<color=green>Ng­êi ch¬i<color>: §­îc! Ta sÏ chuyÓn lêi gióp c«ng tö.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			DelItem(2,0,356,1)
			SetTask(TASK_LOVESTORY1,7)
			TaskTip("VÒ gÆp Chóc Anh §µi")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,7) == 1 then
		Say("Xin gióp ta chuyÓn lêi víi Chóc hiÒn ®Ö, ta d¹o nµy vÉn kháe, cã r¶nh cïng uèng trµ ng©m th¬!",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,8) == 1 then
		Talk(9,"","Chµng khê, Chóc Anh §µi b¶o ta mang vËt nµy vµ chuyÓn 1 lêi cho c«ng tö",
				"Chµng khê? ThËt ta kh«ng hiÓu?",
				"Chóc Anh §µi nhê ta ®­a c©y tr©m nµy vµ nãi víi c«ng tö: <color=red>mét b¶y, hai t¸m, ba s¸u, bèn chİn<color>.",
				"Ta kh«ng ph¶i lµ con g¸i, Chóc hiÒn ®Ö t¹i sao l¹i tÆng ta c©y tr©m nhØ?",
				"C«ng tö cã nhí ®· nãi g× víi Chóc Anh §µi khi chia tay nhau kh«ng?",
				"NÕu L­¬ng huynh Thİch mÉu ®¬n, h·y ®Õn nhµ tiÓu ®Ö ch¬i, sau nhµ cã v­ên mÉu ®¬n rÊt ®Ñp, L­¬ng huynh nghÜ sao!",
				"Chóc hiÒn ®Ö nãi, nÕu Anh §µi lµ g¸i gi¶ trai, th× L­¬ng huynh cã muèn kÕt lµm ®«i uyªn ­¬ng kh«ng?", 
				"Chóc hiÒn ®Ö nãi, L­¬ng huynh cã thÊy con vŞt n­íc kia kh«ng, nã ®ang c­êi L­¬ng huynh gièng nh­ chµng khê ®ã!",
				"Chóc hiÒn ®Ö nãi, hai ta gièng nh­ Ng­u Lang Chøc N÷ ®i qua cÇu ¤ Th­íc!")
		Talk(9,"","Chóc hiÒn ®Ö nãi, bÒ ngoµi lµ 1 nam tö h¸n, nh­ng thËt ra lµ g¸i gi¶ trai.", 
				"Chóc hiÒn ®Ö nãi, L­¬ng huynh cã nh×n thÊy 2 bãng ng­êi ë ®¸y giÕng, 1 ®«i nam n÷ ®ang c­êi ®ïa k×a!", 
				"Chóc hiÒn ®Ö nãi, Quan ¢m ®¹i sÜ se duyªn cho ®«i ta ®ã, chóng ta h·y b¸i ®­êng ®i!",
				"Cßn g× n÷a? Sau ®ã Chóc ®Ö cßn nãi 1 c©u n÷a mµ?",
				"Chóc hiÒn ®Ö nãi, L­¬ng huynh anh h·y sím mang kiÖu hoa ®Õn, ®Ö hÑn huynh vµo lÔ ThÊt TŞch nhĞ!",
				"Chµng khê, h«m nay Anh §µi ®­a c©y tr©m nµy, lÏ nµo c«ng tö vÉn ch­a hiÓu sao?",
				"Trêi, ta qu¶ lµ th»ng ngèc, ta ®· hiÓu <color=red>mét b¶y, hai t¸m, ba s¸u, bèn chİn<color>, ta sÏ chuÈn bŞ lÔ c­íi ®Õn nhµ Anh §µi.",
				"ThÕ th× tèt, chóc ®«i t×nh nh©n sím thµnh phu thª!",
				"Chóc b»ng h÷u vui vÎ! §©y lµ mãn quµ t¹ lÔ, xin b»ng h÷u ®õng tõ chèi!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,9)
			DelItem(2,0,357,1)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("Hoµn thµnh nhiÖm vô")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY1) == 9 then
		Say("Chóc b»ng h÷u vui vÎ!",0)
	elseif GetTask(TASK_LOVESTORY1) == 0 or GetTask(TASK_LOVESTORY1) == 1 or GetTask(TASK_LOVESTORY1) == 2 then
		Say("CÇu vång mu«n dÆm tr¨m hoa në, ®«i b­ím bay l­în trong v­ên hoa.",0)
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

