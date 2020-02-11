--filename:zhuyingtai.lua
--create date:2006-01-21
--author:yanjun
--describe:×£Ó¢Ì¨½Å±¾
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
	if GetTask(TASK_LOVESTORY1) == 0 then
		Say("Kh«ng biÕt lµm sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,1) == 1 then
		Talk(5,"","Ph¶i lµm sao ®©y?",
				"ChuyÖn g× lµm c« n­¬ng buån phiÒn vËy?",
				"Ta muèn ra ngoµi ®i häc, nªn ph¶i gi¶ d¹ng nam nhi. MÊy h«m tr­íc ta ®· giÆt mÊy bé nam trang, giê kh«ng cã ¸o mÆc, l¹i kh«ng tiÖn ®Õn TiÖm Nam phôc, «ng chñ sÏ hiÓu lÇm.",
				"DÔ th«i, ta sÏ gióp c« n­¬ng mua 1 bé nam trang <color=red>HiÖp ThiÕu Bè Y<color>, <color=red>HiÖp ThiÕu Bè Trang<color>, <color=red>HiÖp ThiÕu c©n<color>.",
				"TiÖn n÷ xin ®a t¹.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("TiÕp nhËn nhiÖm vô thÊt b¹i, xin h·y thö l¹i!",0)
			return 0
		end
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("Mua cho Chóc Anh §µi 1 bé HiÖp ThiÕu Bè Y, HiÖp ThiÕu Bè Trang, HiÖp ThiÕu c©n.")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,2) == 1 then
		if GetItemCount(0,100,1) >= 1 and GetItemCount(0,101,1) >= 1 and GetItemCount(0,103,19) >= 1 then
			Talk(5,"","C« n­¬ng mÆc thö 3 mãn ®å nµy xem cã võa ng­êi hay kh«ng?",
					"§a t¹! LÇn nµy ta cã thÓ gi¶ nam trang ra ngoµi råi, nh­ng tiÖn n÷ vÉn cßn 1 viÖc muèn nhê.",
					"Cã viÖc g× cø nãi ®õng ng¹i, ta sÏ gióp cho.",
					"ThËt ra còng kh«ng cã g×, nh­ng thËt khã nãi, ta vµ <color=yellow>L­¬ng S¬n B¸<color> l©u råi ch­a gÆp, l¹i kh«ng tiÖn ®i xa. Muèn nhê c¸c vŞ thay ta ®Õn th¨m huynh Êy, hiÖn ®ang ë <color=red>D­¬ng Ch©u<color>.",
					"§­îc! Ta lËp tøc ®Õn ®ã.")
			local OldPlayerIndex = PlayerIndex
			if GetItemCount(0,100,1) >= 1 and GetItemCount(0,101,1) >= 1 and GetItemCount(0,103,19) >= 1 then
				DelItem(0,100,1,1)
				DelItem(0,101,1,1)
				DelItem(0,103,19,1)
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY1,3)
					TaskTip("§Õn D­¬ng Ch©u gÆp L­¬ng S¬n B¸")
				end
			else
				Say("Trang phôc ®©u? B»ng h÷u kh«ng g¹t ta thÕ?",0)
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("<color=red>HiÖp ThiÕu Bè Y<color>, <color=red>HiÖp ThiÕu Bè Trang<color>, <color=red>HiÖp ThiÕu c©n<color> ë TiÖm Nam phôc cã b¸n, nhê c¸c vŞ mua gióp.",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY1,3) == 1 then
		Say("<color=red>L­¬ng S¬n B¸<color> ®ang ë D­¬ng Ch©u.",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,4) == 1 or CanAcceptTask(TASK_LOVESTORY1,5)== 1 or CanAcceptTask(TASK_LOVESTORY1,6)== 1 then
		Say("Sao ta c¶m thÊy l©u råi kh«ng gÆp <color=red>L­¬ng S¬n B¸<color> vËy?",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,7) == 1 then
		Talk(5,"","C¸c vŞ vÒ råi? L­¬ng S¬n B¸ d¹o nµy kháe kh«ng? Cã nhí ta kh«ng?",
				"L­¬ng S¬n B¸ vÉn kháe, cßn nãi cã r¶nh mêi c« n­¬ng uèng trµ ng©m th¬, nh­ng sao c«ng tö gäi c« n­¬ng lµ Chóc hiÒn ®Ö vËy? LÏ nµo L­¬ng huynh vÉn ch­a biÕt c« lµ n÷ gi¶ nam trang sao?",
				"Chµng y nh­ t­îng gç vËy, uæng c«ng ta nhiÒu lÇn ra hiÖu. §¸ng tiÕc ®µn g¶y tay tr©u, chØ tr¸ch L­¬ng huynh sao ngèc thÕ!",
				"ThËt kh«ng hiÓu hai ng­êi n÷a, trùc tiÕp nãi th¼ng kh«ng ®­îc sao!",
				"Xin gióp ta ®­a  tr©m nµy cho S¬n B¸, vµ nãi víi chµng: <color=red>mét b¶y, hai t¸m, ba s¸u, bèn chİn<color>.")
			if AddItem(2,0,357,1) == 1 then
				local OldPlayerIndex = PlayerIndex
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY1,8)
					TaskTip("§­a tr©m cµi tãc vµ nh¾n cho L­¬ng S¬n B¸")
				end
				PlayerIndex = OldPlayerIndex
			end
	elseif CanAcceptTask(TASK_LOVESTORY1,8) == 1 then
		Say("Xin gióp ta ®­a  tr©m nµy cho S¬n B¸, vµ nãi víi chµng: <color=red>mét b¶y, hai t¸m, ba s¸u, bèn chİn<color>.",0)
	elseif GetTask(TASK_LOVESTORY1) == 9 then
		Talk(2,"","S¬n B¸ ®· hiÓu t©m ı cña c«, nãi nhÊt ®Şnh y hÑn mµ ®Õn.",
				"§a t¹! Chóc thiÕu hiÖp vui vÎ!")
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
