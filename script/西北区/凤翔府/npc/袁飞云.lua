-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÔ¬·ÉÔÆScript
-- By StarryNight
-- 2007/06/12 AM 11:25

-- ¸ĞĞ»Ö÷°¡£¬¿ÉÒÔÈÃÎÒ·ÅÆ¨

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nNpcIndex = GetTargetNpc();

	--È¡²»µ½IndexÖ±½Ó·µ»Ø
	if nNpcIndex == 0 then
		return
	end

	--ÅĞ¶ÏÊÇ·ñÎªµ±Ç°Íæ¼ÒÕÙ»½³öÀ´µÄNpc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex then
	
		---------------------------------- Î÷±±Çø05³Â²Ö°µ¶È----------------------------------
		
		--ÓëÔ¬·ÉÔÆ¶Ô»°È¡µÃÂ·ÏßÍ¼
		if nStep_XBTask == 19 then
			task_005_04_0();
			return
		end
		
		--ÓëÔ¬·ÉÔÆ¶Ô»°×¼±¸½ÙÇô
		if nStep_XBTask == 23 then
			task_005_08_0(nNpcIndex);
			return
		end
		
		---------------------------------- Î÷±±Çø07ÄĞ¶ùï£¹Ç----------------------------------
		
		--ÓëÔ¬·ÉÔÆ¶Ô»°ËÍÓëÉËÒ©
		if nStep_XBTask == 35 then
			task_007_07_0();
			return
		end
	
	else
		strTalk = {
			"D­êng nh­ nhÇm ng­êi."
			}
		TalkEx("",strTalk);
	end

end;

--Ô¬·ÉÔÆËÀÍö½Å±¾
function OnDeath(NpcIndex)

	NpcIndex = tonumber(NpcIndex);
	SetNpcLifeTime(NpcIndex,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	SetNpcScript(NpcIndex,"");--³·Ïú¸ÃNpcËù¹Ò½Å±¾
	
	if GetTask(TASK_XB_ID) == 23 and GetTask(YUANFEIYUN_NPCINDEX) == NpcIndex then
		--Ë¢³öÍŞÍŞÉ±ÊÖ
		KillFollower();
		--Çå³ıÂ·ÏßÍ¼ÎïÆ·
		DelItem(2,0,693,1);
		DelItem(2,0,694,1);--É¾³ıÑÌÎíµ¯
		task_005_08_3();
	end
		
end