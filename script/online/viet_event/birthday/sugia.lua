Include("\\script\\lib\\globalfunctions.lua")

BIRTHDAY2010_LOG_TITLE = "Sinh Nhat VL2 2010"

szNpcName = "<color=green>Sø Gi¶ Sù KiÖn :<color>"

function main()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 110102 then
		Talk(1, "", szNpcName.."§· hÕt h¹n nhËn th­ëng, hÑn gÆp l¹i ®¹i hiÖp vµo dŞp kh¸c!")
		return
	end
	local tSay = {}
	local szHeader = szNpcName.."Chóc mõng sinh nhËt Vâ L©m TruyÒn Kú 2. Ho¹t ®éng mõng sinh nhËt n¨m nay diÔn ra tõ ngµy <color=red>3/12/2010<color> ®Õn hÕt ngµy <color=red>2/1/2011<color>."
	
	tinsert(tSay, "NhËn th­ëng may m¾n mõng sinh nhËt Vâ L©m TruyÒn Kú 2/receive_birthday_award_2010")
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function receive_birthday_award_2010()
	if gf_GetTaskBit(TSK_BIRTHDAY_AWARD, 1)  == 1 then
		Talk(1, "", szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi, chØ ®­îc phĞp nhËn 1 lÇn duy nhÊt!")
		return
	end
	
	if GetExtPoint(6) ~= 1 then
		Talk(1, "", szNpcName.."C¸c h¹ kh«ng cã m· nhËn th­ëng, sao l¹i ®Õn t×m ta!")
		return
	end
	
	if GetExtPoint(6) == 1 then
		local nRand = random(1, 10000)
		if nRand <= 9835 then
			gf_AddItemEx2({2,1,1009,1}, "Thiªn Th¹ch Tinh Th¹ch", BIRTHDAY2010_LOG_TITLE, "nhËn th­ëng")
			Msg2SubWorld("Chóc mõng nh©n sÜ "..GetName().." ®· nhËn ®­îc phÇn th­ëng 1 Thiªn Th¹ch Tinh Th¹ch mõng sinh nhËt VLTK II trßn 3 tuæi!")
		elseif nRand <= 9985 then
			gf_AddItemEx2({2,1,1068,1,4}, "Thiªn Th¹ch Linh Th¹ch", BIRTHDAY2010_LOG_TITLE, "nhËn th­ëng", 7 * 24 * 3600)
			Msg2SubWorld("Chóc mõng nh©n sÜ "..GetName().." ®· nhËn ®­îc phÇn th­ëng 1Thiªn Th¹ch Linh Th¹ch mõng sinh nhËt VLTK II trßn 3 tuæi!")
		else
			gf_AddItemEx2({2,1,1067,1,4}, "§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch", BIRTHDAY2010_LOG_TITLE, "nhËn th­ëng", 7 * 24 * 3600)
			Msg2SubWorld("Chóc mõng nh©n sÜ "..GetName().." ®· nhËn ®­îc phÇn th­ëng 1 §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch mõng sinh nhËt VLTK II trßn 3 tuæi!")
		end
		AddExtPoint(6, 1)
		gf_SetTaskBit(TSK_BIRTHDAY_AWARD, 1)
	end
end

function do_nothing()
end