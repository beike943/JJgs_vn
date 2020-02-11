--filename:baisuzhen.lua
--create date:2006-01-22
--author:yanjun
--describe:°×ËØÕê½Å±¾
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
	if GetTask(TASK_LOVESTORY2) == 0 then
		Say("Sao Høa Tiªn vÉn ch­a ®Õn?",0)	
	elseif CanAcceptTask(TASK_LOVESTORY2,1) == 1 then
		Talk(3,"","B¹ch c« n­¬ng cã chuyÖn g× mµ buån phiÒn vËy?",
				"MÊy h«m tr­íc, ta cã m­în Høa Tiªn 1 c©y dï, hÑn Høa Tiªn h«m nay ®Õn lÊy. Sao giê vÉn ch­a thÊy ®Õn!",
				"B¹ch c« n­¬ng ®õng lo l¾ng, ®Ó ta hái Høa Tiªn.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("TiÕp nhËn nhiÖm vô thÊt b¹i, xin h·y thö l¹i!",0)
			return 0
		end
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("§Õn xem Høa Tiªn ®ang lµm g×")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,2) == 1 or CanAcceptTask(TASK_LOVESTORY2,3) == 1 or CanAcceptTask(TASK_LOVESTORY2,4) == 1 then
		Say("B»ng h÷u vÉn ch­a gÆp Høa Tiªn ­?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,5) == 1 then
		Talk(6,"","B¹ch c« n­¬ng ®õng lo, Høa c«ng tö v× chuÈn bŞ mét sè lÔ vËt vµ mua Hïng Hoµng töu nªn ®Õn trÔ.",
				"Hïng Hoµng töu? Sao lÔ vËt l¹i cã Hïng Hoµng töu?",
				"B¹ch c« n­¬ng sao kinh ng¹c thÕ?",
				"Kh«ng giÊu g×, ta vèn lµ b¹ch xµ tu luyÖn thµnh ng­êi. ChØ cÇn ngöi mïi r­îu th«i còng sÏ hiÖn nguyªn h×nh.",
				"ThÕ nµy ®i, ®Ó t¹i h¹ thuyÕt phôc Høa c«ng tö ®æi lÔ vËt kh¸c." ,
				"Tèt qu¸……")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,6)
			TaskTip("Trë vÒ thuyÕt phôc Høa Tiªn thay Hïng Hoµng töu b»ng lÔ vËt kh¸c")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY2,6) == 1 or CanAcceptTask(TASK_LOVESTORY2,7) == 1 then
			Say("B»ng h÷u vÉn ch­a thuyÕt phôc <color=yellow>Høa Tiªn<color> sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,8) == 1 then
		Talk(4,"","Xin hái, viÖc ®ã tiÕn triÓn nh­ thÕ nµo råi?",
				"Yªn t©m. T¹i h¹ ®· khuyªn Høa c«ng tö thay Hïng Hoµng töu b»ng b¸nh lÔ, mét l¸t n÷a c«ng tö sÏ ®Õn ngay.",
				"§a t¹ nhŞ vŞ. Chóc c¸c vŞ vui vÎ!",
				"Kh«ng cã chi, chØ cÇn yªu nhau kh«ng g× c¶n trë ®­îc.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,9)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("KÕt thóc nhiÖm vô")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY2) == 9 then
		Say("Chóc nh÷ng ®«i t×nh nh©n sím thµnh phu thª.",0)
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