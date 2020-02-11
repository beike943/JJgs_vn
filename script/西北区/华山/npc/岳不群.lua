--NPCÄ¬ÈÏ¶Ô»°½Å±¾
Include("\\settings\\static_script\\meridian\\npc_meridian_level_update.lua")
Include("\\script\\meridian\\npc_meridian_restore.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")



function main()
	local tbSay = {};
	--tinsert(tbSay, format("Ta cÇn kİch ho¹t c¶nh giíi kinh m¹ch/onNpcTalkToUpdateMeridianLevel"))	--is KS
		tinsert(tbSay, format("Ta cÇn kİch ho¹t c¶nh giíi kinh m¹ch/onNpcTalkToUpdateMeridianLevel_vng"))
	--tinsert(tbSay, format("ÎÒÒªÏ´ËèÒ×½î/OnNpcTalkToRestore"))
	tinsert(tbSay, format("Ta muèn nhËn danh hiÖu c¶nh giíi/#merdiantitle_check_add_title(1)"))
	tinsert(tbSay, "Ta chØ ghĞ ch¬i/no")
	Say("<color=green>Nh¹c BÊt QuÇn: <color> ta cã thÓ gióp ®­îc ®iÒu g×?",getn(tbSay),tbSay);
end

function no()
end

function onNpcTalkToUpdateMeridianLevel_vng()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh¹c BÊt QuÇn: L·o phu cã thÓ gióp thiÕu hiÖp kİch ho¹t khai th«ng kinh m¹ch, nh­ng ®Ó kİch ho¹t c¶nh giíi kh¸c nhau cã yªu cÇu tiªu hao kh¸c nhau, thiÕu hîp cÇn khai th«ng c¶nh giíi nµo?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("Kİch ho¹t %s c¶nh giíi %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "Kİch ho¹t Vâ T«n/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta chØ ghĞ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh¹c BÊt QuÇn: ®¹t ®Õn %s ®ång thêi ®· ®¹t c¶nh giíi %s, cã thÓ t×m ta khai th«ng c¶nh giíi %s. CÇn tiªu hao <color=yellow>%s<color>. X¸c ®Şnh thùc hiÖn?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X¸c ®Şnh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("trë l¹i/onNpcTalkToUpdateMeridianLevel_vng"))
	tinsert(tbSay, "Ta chØ ghĞ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end