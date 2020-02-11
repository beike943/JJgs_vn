--filename:49_npc.lua
--create date:2006-01-21
--author:yanjun
--describe:ÍçÍ¯°¢±¦½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY1,4) == 1 then
		Talk(5,"gethzmty","Tø Cöu, bĞ ngoan kh«ng ®­îc nãi dèi, ®Ö cã lÊy Kim Lan thiÖp cña L­¬ng thiÕu gia kh«ng?",
				"§óng vËy!",
				"VËy ®­a cho ta nhĞ, ta tr¶ l¹i cho L­¬ng thiÕu gia.",
				"Kh«ng ®­îc ®©u. C¸c huynh (tû) mua <color=red>ChÌ mÌ ®en<color> cho ®Ö, ®Ö ®­a l¹i <color=red>Kim Lan thiÖp<color> cho.",
				"§­îc, <color=yellow>C«n ®å<color> ngoµi thµnh ch¾c cã.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,5)
			CreateTrigger(0,1204,3112)	--´ò¹ÖµôºÚÖ¥ÂéÌÀÔ²´¥·¢Æ÷
			TaskTip("§¸nh C«n ®å ngoµi thµnh lÊy chÌ mÌ ®en.")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,5) == 1 then
		if DelItem(2,0,355,1) == 1 then
			Talk(2,"","Haha, ®©y ®óng lµ chÌ mÌ ®en mµ ®Ö thİch, Kim Lan thiÖp nÌ, c¸c huynh (tû) lÊy ®i.",
					"§Ö thËt lµ tinh nghŞch!")
			AddItem(2,0,356,1)
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY1,6)
				RemoveTrigger(GetTrigger(3112))	--É¾³ı´ò¹Öµô±ùÌÇºùÂ«´¥·¢Æ÷
				TaskTip("§­a Kim Lan thiÖp cho L­¬ng S¬n B¸")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("C¸c huynh (tû) mua <color=red>chÌ mÌ ®en<color> cho ®Ö, ®Ö tr¶ l¹i <color=red>Kim Lan thiÖp<color> cho.",0)
		end	
	else
		Say("ChÌ mÌ ®en thËt lµ ngon!",0)
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H·y ®Õn NguyÖt l·o l·nh th­ëng.")
		Msg2Player("Cuèi cïng ®· gióp NguyÖt l·o t¸c hîp cho 4 cÆp t×nh nh©n, h·y mau gÆp NguyÖt l·o l·nh th­ëng.")
	end
end
