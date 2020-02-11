--Éý¼¶Îä½«¾³½çNPC»á»°½Å±¾
Include ("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")

SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\npc_meridian_level_update.lua"
N_THIS_CALL_BACK_CODE=100 --Ëæ±ãµÄÒ»¸öÊýÖµ ÓÃÓÚÐ£ÑéµÄ£¨*10+levelÒª>=100±íÊ¾²»ÐèÒª¼ì²éÕæÆøÈÝÁ¿£©

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function onNpcTalkToUpdateMeridianLevel()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh¹c BÊt QuÇn: L·o phu cã thÓ gióp thiÕu hiÖp kÝch ho¹t khai th«ng kinh m¹ch, nh­ng ®Ó kÝch ho¹t c¶nh giíi kh¸c nhau cã yªu cÇu tiªu hao kh¸c nhau, thiÕu hîp cÇn khai th«ng c¶nh giíi nµo?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("KÝch ho¹t %s c¶nh giíi %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "KÝch ho¹t Vâ T«n c¶nh giíi/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh¹c BÊt QuÇn: ®¹t ®Õn %s ®ång thêi ®· ®¹t c¶nh giíi %s, cã thÓ t×m ta khai th«ng c¶nh giíi %s. CÇn tiªu hao <color=yellow>%s<color>. X¸c ®Þnh thùc hiÖn?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X¸c ®Þnh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("trë l¹i/onNpcTalkToUpdateMeridianLevel"))
	tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel(nNewLevel)
	if 1 == _CheckMeridianCanUpdateToLevel(nNewLevel) then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE*10+nNewLevel, SZ_THIS_SCRIPT, 1) then
    		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,912,0,1); --µØÃæÌØÐ§
			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1, getn(t_rand_npc_sfx))],2,1); --ÌØÐ§
    	end
	else
		--Talk(1,"",format("ÄãÏÖÔÚ²»ÄÜ³å»÷Îä½«¾³½ç!"))
	end
end

--²½½ø»Øµ÷º¯Êý
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if floor(wCheckCode/10) ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,912,0,1); --µØÃæÌØÐ§
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --ÌØÐ§
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
	else
		if wCurProcess ==  (wMaxProcess - 1) then
			local nNewLevel = mod(wCheckCode,10)--»Øµ÷È·ÈÏÂë¸öÎ»±íÊ¾³å»÷µÈ¼¶
			if _CheckMeridianCanUpdateToLevel(nNewLevel) == 1 then
				if 1 == _DoMeridiaUpdateToLevel(nNewLevel) then
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --µØÃæÌØÐ§
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel(nNewLevel)
	return meridianlevel_check_all_ib(nNewLevel, 1)
end

function _DoMeridiaUpdateToLevel(nNewLevel)
	local bUpdateSuccess = MeridianUpdateLevel()
	if 0 ~= bUpdateSuccess then
		return meridianlevel_check_consume(nNewLevel, 1, 0)
	end
	return 0
end

function no()
end
