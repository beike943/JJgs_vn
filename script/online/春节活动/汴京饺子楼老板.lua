--filename:ãê¾©½È×ÓÂ¥ÀÏ°å.lua
--create date:2006-01-05
--author:yanjun
--describe:ãê¾©½È×ÓÂ¥ÀÏ°å½Å±¾

RING_COUNTER = 0	--Áú½ä¼ÆÊıÆ÷

Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060216 then
		Say("Chóc mäi ng­êi n¨m míi vui vÎ, vµo <color=red>ngµy 16/02/2008<color> bæn tiÖm sÏ chİnh thøc më cöa, c¸c vŞ"..strSex.."nhí ghĞ nhĞ!",0)
		return 0
	end
	if nDate > 20060221 then
		Say("TÕt qua råi, bæn tiÖm xin phĞp ®ãng cöa nghØ! C¸c vŞ"..strSex.."Nhí tÕt n¨m sau ®Õn ñng hé bæn tiÖm nhĞ!",0)
		return 0
	end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"ChÕ biÕn sñi c¶o./make_dumpling",
					"§æi phÇn th­ëng/request_award",
					"TiÖm sñi c¶o/know_detail",
					"Ta chØ ghĞ ngang qua th«i./nothing"
					}
		Say("ói chµ!"..strSex.."mêi vµo trong, h·y gióp ®ì qu¸n nhá!",4,selTab)
	else
		Say("Bæn tiÖm ch­a më cöa,"..strSex.."h·y ®îi vµi ngµy.",0)
		return 0
	end
end

function make_dumpling()
	local selTab = {
		"Sñi c¶o b¾p c¶i/select_baicai",
		"Sñi c¶o cµ rèt/select_luobo",
		"Sñi c¶o rau cÇn/select_qincai",
		"Sñi c¶o kim chi/select_suancai",
		"Sñi c¶o rau hÑ/select_jiucai",
		"Trang sau./see_nextpage",
		"Ta ch­a muèn ¨n!/nothing"
		}
	Say("Kh¸ch quan muèn ¨n sñi c¶o lo¹i nµo?",7,selTab)
end

function see_nextpage()
	local selTab = {
		"Sñi c¶o thŞt heo/select_zhurou",
		"Sñi c¶o thŞt bß/select_niurou",
		"Sñi c¶o t«m/select_xiaren",
		"Tam Tiªn sñi c¶o/select_sanxian",
		"Sñi c¶o may m¾n/select_xingyun",
		"Sñi c¶o thñy tinh/select_shuijing",
		"Trang tr­íc./see_prepage",
		"Ta ch­a muèn ¨n!/nothing"
		}
	Say("Kh¸ch quan muèn ¨n sñi c¶o lo¹i nµo?",8,selTab)
end

function see_prepage()
	make_dumpling()
end

function request_award()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	local selTab = {
		"Ta muèn ®æi sñi c¶o may m¾n lÊy 1 quyÓn mËt tŞch./want_miji",
		"Ta muèn ®æi sñi c¶o thñy tinh vµ Long cèt lÊy 1 mãn trang søc./want_shipin",
		"Ta ch­a muèn ®æi lÊy phÇn th­ëng./nothing"
		}
	Say("Kh¸ch quan muèn dïng sñi c¶o lo¹i nµo ®Ó ®æi phÇn th­ëng?",3,selTab)
end

function know_detail()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	Say("Sñi c¶o cña bæn tiÖm næi tiÕng kh¾p n¬i, n¨m x­a Th¸i tæ hoµng ®Õ ®· ®İch th©n t¸n th­ëng mïi vŞ th¬m ngon cña sñi c¶o. Nh­ng bæn tiÖm cã 2 quy t¾c: mçi n¨m chØ b¸n mÊy ngµy tÕt vµ sñi c¶o chØ lµm gióp chø kh«ng b¸n, nguyªn liÖu ph¶i tù chuÈn bŞ."..strSex.."NÕu ®· n¾m râ quy t¾c, sao kh«ng tranh thñ thu thËp nguyªn liÖu, bæn tiÖm b¶o ®¶m sÏ lµm ra nh÷ng sñi c¶o th¬m ngon, ¨n vµo nhí m·i h­¬ng vŞ.",0)
end

function nothing()

end

function want_miji()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,252) >= 1 then
		if DelItem(2,1,252,1) == 1 then
			if AddItem(0,107,155,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n dïng sñi c¶o ®æi phÇn th­ëng]:"..GetName().."®æi sñi c¶o may m¾n lÊy 1 quyÓn mËt tŞch.")
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 quyÓn mËt tŞch.")
			end
		end
	else
		Say("D­êng nh­"..strSex..", quªn mang hay lµ ®· ¨n hÕt råi?",0)
	end
end

function want_shipin()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if RING_COUNTER >= 50 then
		Say("Ho¹t ®éng sñi c¶o x¶y ra lçi hÖ thèng, h·y liªn hÖ GM ®Ó kh¾c phôc!",0)
		return 0
	end
	if GetItemCount(2,1,253) >= 1 and GetItemCount(2,1,116) >= 1 then
		if DelItem(2,1,253,1) == 1 and DelItem(2,1,116,1) == 1 then
			if AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1) == 1 then
				RING_COUNTER = RING_COUNTER + 1
				WriteLog("[Ho¹t ®éng mïa xu©n dïng sñi c¶o ®æi phÇn th­ëng]:"..GetName().."dïng sñi c¶o thñy tinh vµ Long cèt ®æi §«ng Ph­¬ng Long Ch©u.")
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 mãn trang søc.")
				AddGlobalNews("Chóc mõng"..GetName().."NhËn ®­îc §«ng Ph­¬ng Long Ch©u.")
			end
		end
	else
		Say("D­êng nh­"..strSex..", quªn mang theo µ?",0)
	end
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function select_niurou()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o thŞt bß./make_niurou",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o thŞt bß<color>: <color=red>1 Sñi c¶o thŞt heo, 1 thŞt bß, 1 bét m×<color>, 30 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_zhurou()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o thŞt heo./make_zhurou",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o thŞt heo<color>: <color=red>1 Sñi c¶o rau hÑ, 1 thŞt heo, 1 bét m×<color>, 20 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_xiaren()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o t«m./make_xiaren",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o t«m<color>: <color=red>1 sñi c¶o thŞt bß, 1 t«m nân, 1 bét m×<color>, 40 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_luobo()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o cñ c¶i./make_luobo",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o cñ c¶i<color>: <color=red>1 Sñi c¶o c¶i tr¾ng, 1 cñ c¶i, 1 bét m×, 1 thËp tam h­¬ng<color>, 1 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_suancai()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o d­a chua./make_suancai",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o d­a chua<color>: <color=red>1 Sñi c¶o cÇn t©y, 1 c¶i tr¾ng, 1 bét m×, 1 thËp tam h­¬ng<color>, 4 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_baicai()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o c¶i tr¾ng./make_baicai",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o c¶i tr¾ng<color>: <color=red>1 c¶i tr¾ng, 1 bét m×, 1 thËp tam h­¬ng<color>, 1 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_qincai()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o cÇn t©y./make_qincai",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o cÇn t©y<color>: <color=red>1 sñi c¶o cñ c¶i, 1 cÇn t©y, 1 bét m×, 1 thËp tam h­¬ng<color>, 2 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_jiucai()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o rau hÑ./make_jiucai",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o rau hÑ<color>: <color=red>1 sñi c¶o d­a chua, 1 rau hÑ, 1 bét m×, 1 thËp tam h­¬ng<color>, 8 l­îng b¹c, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt hÕt. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_sanxian()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o ba mãn./make_sanxian",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o ba mãn<color>: <color=red>3 Sñi c¶o t«m<color>, 1 l­îng vµng, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt 1 sñi c¶o t«m. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_xingyun()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o may m¾n./make_xingyun",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o may m¾n<color>: <color=red>3 Sñi c¶o ba mãn<color>, 4 l­îng vµng, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt 1 Sñi c¶o ba mãn. Ngµi cã muèn lµm kh«ng?",2,selTab)
end

function select_shuijing()
	local selTab = {
				"§­¬ng nhiªn, ta ®ang muèn ¨n sñi c¶o thñy tinh./make_shuijing",
				"§Ó ta suy nghÜ l¹i./noting"
				}
	Say("Nguyªn liÖu ®Ó lµm <color=yellow>Sñi c¶o thñy tinh<color>: <color=red>3 Sñi c¶o may m¾n<color>, 20 l­îng vµng, nÕu thÊt b¹i nguyªn liÖu sÏ mÊt 1 sñi c¶o may m¾n. Ngµi cã muèn lµm kh«ng?",2,selTab)
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function make_niurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(1,0,33) == 0 or GetItemCount(2,1,258) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end
	if GetCash() < 3000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if DelItem(1,0,33,1) == 1 and DelItem(2,1,258,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(3000)
		if nRandomNum <= 50 then
			if AddItem(1,0,34,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."NhËn ®­îc 1 sñi c¶o thŞt bß.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o thŞt bß")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o thŞt bß thÊt b¹i.")
		end
	end
end

function make_zhurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,247) == 0 or GetItemCount(2,1,257) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 2000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	if DelItem(2,1,247,1) == 1 and DelItem(2,1,257,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(2000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,0,33,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."NhËn ®­îc 1 sñi c¶o thŞt heo.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o thŞt heo")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o thŞt heo thÊt b¹i.")
		end	
	end
end

function make_xiaren()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,259) == 0 or GetItemCount(1,0,34) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 4000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	if DelItem(2,1,259,1) == 1 and DelItem(1,0,34,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(4000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,0,35,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."NhËn ®­îc 1 sñi c¶o t«m.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o t«m")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o t«m thÊt b¹i.")
		end		
	end
end

function make_luobo()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,243) == 0 or GetItemCount(2,1,260) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end
	if GetCash() < 100 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	if DelItem(2,1,243,1) == 1 and DelItem(2,1,260,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then	
			if AddItem(2,1,244,1) == 1 then
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o cñ c¶i")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o cñ c¶i thÊt b¹i.")
		end
	end
end

function make_suancai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,245) == 0 or GetItemCount(2,1,262) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end	
	if GetCash() < 400 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end	
	if DelItem(2,1,245,1) == 1 and DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(400)
		local nRandomNum = random(1,100)
		if nRandomNum <= 60 then
			if AddItem(2,1,246,1) == 1 then
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o d­a chua")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi! .",0)
			Msg2Player("ChÕ biÕn sñi c¶o d­a chua thÊt b¹i.")
		end		
	end
end

function make_baicai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,262) == 0 or GetItemCount(2,1,255) == 0  or GetItemCount(2,1,256) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 100 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	if DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,243,1) == 1 then
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o c¶i tr¾ng")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o c¶i tr¾ng thÊt b¹i.")
		end		
	end
end

function make_qincai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,244) == 0 or GetItemCount(2,1,263) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 200 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	if DelItem(2,1,244,1) == 1 and DelItem(2,1,263,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(200)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,245,1) == 1 then
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o cÇn t©y")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o cÇn t©y thÊt b¹i.")
		end			
	end
end

function make_jiucai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,246) == 0 or GetItemCount(2,1,264) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end	
	if GetCash() < 800 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end	
	if DelItem(2,1,246,1) == 1 and DelItem(2,1,264,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(800)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(2,1,247,1) == 1 then
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o rau hÑ")
			end
		else
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi! .",0)
			Msg2Player("ChÕ biÕn sñi c¶o rau hÑ thÊt b¹i.")
		end		
	end
end

function make_sanxian()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(1,0,35) < 3 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 10000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(1,0,35,3) == 1 then
			Pay(10000)
			if AddItem(2,1,251,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."NhËn ®­îc 1 sñi c¶o ba mãn.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o ba mãn")
			end
		end
	else
			DelItem(1,0,35,1)
			Pay(10000)
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi! .",0)
			Msg2Player("ChÕ biÕn sñi c¶o ba mãn thÊt b¹i.")	
	end
end

function make_xingyun()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if GetItemCount(2,1,251) < 3 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 40000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(2,1,251,3) == 1 then
			Pay(40000)
			if AddItem(2,1,252,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."NhËn ®­îc 1 sñi c¶o may m¾n.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o may m¾n")
			end
		end
	else
			DelItem(2,1,251,1)
			Pay(40000)
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o may m¾n thÊt b¹i.")	
	end
end

function make_shuijing()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	if RING_COUNTER >= 50 then	--³¬¹ı50¸ö¾Í²»ÔÙ²úÉúÁË
		return 0
	end
	if GetItemCount(2,1,252) < 3 then
		Say("Xin lçi, b¹n kh«ng ®ñ vËt liÖu.",0)
		return 0
	end		
	if GetCash() < 200000 then
		Say("Xin lçi, b¹n kh«ng ®ñ tiÒn.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 20 then
		if DelItem(2,1,252,3) == 1 then
			Pay(200000)
			if AddItem(2,1,253,1) == 1 then
				WriteLog("[Ho¹t ®éng mïa xu©n ChÕ biÕn sñi c¶o]:"..GetName().."nhËn ®­îc 1 sñi c¶o thñy tinh.")
				Say("Sñi c¶o th¬m ngon ®©y!"..strSex.."h·y th­ëng thøc!",0)
				Msg2Player("B¹n nhËn ®­îc 1 sñi c¶o thñy tinh")
			end
		end
	else
			DelItem(2,1,252,1)
			Pay(200000)
			Say("Sao thÕ? LÏ nµo l¹i thÊt b¹i? ThËt xin lçi!",0)
			Msg2Player("ChÕ biÕn sñi c¶o thñy tinh thÊt b¹i.")	
	end
end
