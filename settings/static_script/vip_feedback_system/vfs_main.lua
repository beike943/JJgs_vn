--Ïû·Ñ»ý·Ö·´À¡ÏµÍ³
Include("\\settings\\static_script\\vip_feedback_system\\vfs_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\global\\ib_callback.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")

--Óù½ÖÏûºÄ»Øµ÷-----
--nCostÏûºÄµÄXuµ¥¼Û
--nExpValue¾­ÑéÖµ±¶ÂÊ
--nJinJuan½ðÈ¯Êý±¶ÂÊ
function vfs_main_callback(nCost, nExpValue, nJinJuan)
	if not nCost or not nExpValue or not nJinJuan then
		print("UDERROR:vfs_main_callback error");
		return 0;
	end
	--×öÒÔÇ°µÄÊÂ------------------------------------------
	ib_status_relay_ret(tonumber(nCost));
	--Ïû·Ñ·´À¡--------------------------------------------
	if tonumber(nCost) <= 0 then
		--µÈÓÚÁã±íÊ¾²»·´À¡
		return 0;
	end
	_vfs_AddVipXuValue(tonumber(nCost));
	if tonumber(nExpValue) > 0 then
		_vfs_AddVipExpValue(tonumber(nCost) * tonumber(nExpValue) * VFS_XU_TO_EXP);
	end
	if tonumber(nJinJuan) > 0 then
		_vfs_AddVipJinJuan(tonumber(nCost) * tonumber(nJinJuan) * VFS_XU_TO_JJ);
	end
	--ÑûÇëÂë»î¶¯
	_ic_IbCcost(tonumber(nCost));
end

function vfs_open_JJ_shop()
	local tSay = {
		"TiÖm ViP cÊp 1/#vfs_open_shop(3030)",
		"TiÖm ViP cÊp 2/#vfs_open_shop(3031)",
		"TiÖm ViP cÊp 3/#vfs_open_shop(3032)",
		"Ra khái/do_nothing"
	}
	Say("§¹i hiÖp ng­êi cÊn g× kh«ng?", getn(tSay), tSay);
end

function vfs_open_shop(nIndex)
	show_equip_shop(tonumber(nIndex));
end

function vfs_open_YJ_shop()
	show_equip_shop(3033);
end

--------------------------------------------------------------------------------
--Ôö¼Óµ±Ç°VIPµÈ¼¶¾­ÑéÖµ
function _vfs_AddVipExpValue(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nCurrentLevel = GetVipLevel();
	if nCurrentLevel < 0 or nCurrentLevel >= getn(VFS_VIP_LEVEL_TABLE) then
		return 0;
	end
	--×î´óÖµ¼ì²â
	if nValue > VFS_VIP_EXP_MAX then
		gf_WriteLogEx("[vip_feedback_system]", "_vfs_AddVipExpValue", tostring(nValue));
		print("UDERROR: [vip_feedback_system] _vfs_AddVipExpValue this value is too large, pls check!");
		nValue = VFS_VIP_EXP_MAX;
	end
	local nValueAfter = GetVipExp() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	local msg = format("Ng­¬i nhËn ®­îc %d ®iÓm ViP kinh nghiÖm Ngù C¸c!", tonumber(nValue));
	Msg2Player(msg);
	--Say(msg,0);
	
	--¾ö¶¨ÊÇ·ñÒªÉý¼¶VIPµÈ¼¶
	local bIsUpdate = 0;
	while VFS_VIP_LEVEL_TABLE[GetVipLevel() + 1] and nValueAfter >= VFS_VIP_LEVEL_TABLE[GetVipLevel() + 1] do
		if 1 == _vfs_AddVipLevel() then
			nValueAfter = nValueAfter - VFS_VIP_LEVEL_TABLE[GetVipLevel()];
			SetVipExp(VFS_VIP_LEVEL_TABLE[GetVipLevel()]);
		else
			break;
		end
		bIsUpdate = 1;
	end
	if GetVipLevel() < getn(VFS_VIP_LEVEL_TABLE) then
		SetVipExp(nValueAfter);
	end
	if 1 == bIsUpdate then
		local msg = format("Chóc mõng ng­¬i n©ng cÊp lµ Ngù C¸c ViP%d!", GetVipLevel());
		Msg2Player(msg);
		Say(msg,0);
	end
	return 1;
end

--Ôö¼Óµ±Ç°ÏûºÄXU×ÜÖµ
function _vfs_AddVipXuValue(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nValueAfter = GetVipCost() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	
	SetTask(VFS_TASK_VIP_COST, nValueAfter, TASK_ACCESS_CODE_VIP_FEEDBACK_SYS);
	return 1;
end

--Ôö¼ÓVipµÈ¼¶+1
function _vfs_AddVipLevel()
	local nVipLevel = GetVipLevel();
	if nVipLevel >= getn(VFS_VIP_LEVEL_TABLE) then
		return 0;
	end
	SetTask(VFS_TASK_VIP_LEVEL, nVipLevel + 1, TASK_ACCESS_CODE_VIP_FEEDBACK_SYS);
	return 1;
end

function _vfs_AddVipJinJuan(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nValueAfter = GetVipJinJuan() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	--×î´óÖµ¼ì²â
	if nValue > VFS_VIP_JJ_MAX then
		gf_WriteLogEx("[vip_feedback_system]", "_vfs_AddVipJinJuan", tostring(nValue));
		print("UDERROR: [vip_feedback_system] _vfs_AddVipJinJuan this value is too large, pls check!");
		nValue = VFS_VIP_JJ_MAX;
	end
	if -1 == ModifyJinJuan(nValue,1) then
		return 0;
	end
	--local msg = format("Äú»ñµÃ%dµã½ðÈ¯£¡", tonumber(nValue));
	--Say(msg,0);
	return 1;
end