--Éý¼¶Îä½«¾³½çNPC»á»°½Å±¾
Include ("\\script\\meridian\\meridian_level_update_2.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--Ô½ÄÏ×ªÉú½Å±¾
Include ("\\script\\system_switch_config.lua")
Include("\\script\\lib\\globalfunctions.lua");

SZ_THIS_SCRIPT="\\script\\meridian\\npc_meridian_update_lv2.lua"
N_THIS_CALL_BACK_CODE=1387 --Ëæ±ãµÄÒ»¸öÊýÖµ ÓÃÓÚÐ£ÑéµÄ

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function OnNpcTalkToUpdateLevel2()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh¹c BÊt QuÇn: Ng­êi ch¬i ®· ®¹t C¶nh Giíi Vâ Gi¶ vµ chuyÓn tõ cÊp 1 ®Õn cÊp 99, cã thÓ t×m ta xung kÝch C¶nh Giíi Vâ T­íng. Xung kÝch C¶nh Giíi Vâ T­íng cÇn tiªu hao <color=yellow>%s<color>. X¸c nhËn cã muèn xung kÝch kh«ng?"
		, GetNeedConsumeDesc())
	tinsert(tbSay, format("X¸c ®Þnh/_DoUpdateLevel2"))
	tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel2()
	if 1 == _CheckMeridianCanUpdateToLevel2() then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
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
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
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
			if _CheckMeridianCanUpdateToLevel2() == 1 then
				if 1 == _DoMeridiaUpdateToLevel2() then
					gf_WriteLogEx("KICK HOAT KINH MACH", "thµnh c«ng", 1, "Vâ Gi¶")					
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --µØÃæÌØÐ§
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel2()
	if GetTranslifeCount() < 1 then
		Talk(1,"",format("Kh«ng hoµn thµnh chuyÓn 1 kh«ng thÓ xung kÝch C¶nh Giíi Vâ T­íng!"))
		return 0
	end
	return CheckCondition(2, 1)
end

function _DoMeridiaUpdateToLevel2()
	return MeridianUpdateLevel()
end

function no()
end
