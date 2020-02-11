
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÎäÆ÷µêÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=517  --½ğµ¶ÖØÏÖÈÎÎñ
TASK_GATHER_FLAG=1931 --ÈÎÎñÎïÆ·²É¼¯±êÊ¾

strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*****************************************
function main()

	strName = GetTargetNpcName();
	if strName=="" or strName==nil then return end;
	strTitle = "<color=green>"..strName.."<color>: ";
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local strTitle = "<color=yellow>Chñ tiÖm vò khİ: <color>"
	local a =  goto_takelifeskill_task()
	
----------------------------------------------Ö÷¶Ô»°-----------------------------------------------
	if (nState==1) then	
		task_001_00();
		return	
	end
	
	local tSay = {
		"Mua vò khİ/_buy_sale_equip",
		"Trang bŞ t¸ch/_equip_recycle",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>Chñ TiÖm Vò Khİ:<color> Vò khİ ë chç cña ta vÉn lµ mÆt hµng phæ biÕn, kh«ng biÕt mãn vò khİ cã thuéc quÎ sÏ nh­ thÕ nµo!", getn(tSay), tSay);
end;		

function _buy_sale_equip()
	Sale(33);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end
		
--  Ç¿»¯ÎäÆ÷ÈÎÎñ
--  ·®ÍòËÉ
--  2004.01.17
--Include("\\script\\global\\itemhead.lua")
	
	
-- UTask_world1502 = GetTask(1502)
--	if (UTask_world1502 == 0) and (GetLevel() > 7) then 		--ÈÎÎñÆô¶¯
--		Talk(2,"W1502_get","Ìú½³£ºÕâÎ»Ğ¡ÏÀÏë±ØÒ²ÔÚ½­ºşÉÏ»ìÁËÒ»Ğ©Ê±ÈÕÁË£¬ÔõÃ´Ã»°Ñ¾«Á¼µÄ±øÈĞ°¢£¿¡£","<color=green>Íæ¼Ò<color>£ºÄÇÇëÎÊÕâÎ»Ê¦¸µ¿ÉÒÔ°ïÃ¦Ã´£¿")
--	elseif (UTask_world1502 == 5) then
--		if (GetItemCount("XXXX") >= N) and (GetItemCount("XXXX") >= N) then		-- ÈÎÎñÍê³É
--			SetTask(1502,10)
--				for i=1,N do
--							DelItem("XXX")
--							DelItem("XXXX")
--				end
--			Talk(1,"","Ìú½³£ººÃ£¬²ÄÁÏÈ«ÁË£¡ÔÛÕâ¾ÍÎªĞ¡ÏÀ´òÔìÒ»°ÑÇ¿Á¦µÄ±øÈĞ¡£")
--			AddNote("½«XXXºÍXXXX½»¸øÌú½³£¬ÈÎÎñÍê³É¡£")
--			TaskTip("½«XXXºÍXXXX½»¸øÌú½³£¬ÈÎÎñÍê³É¡£")
--			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
--			if(GetSex() == 0) then
--				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("µÃµ½ÂÌòÄÓñÅå¡£")
--			else
--				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("µÃµ½Ñ¬ÒÂÏãÄÒ¡£")
--			end
--			AddRepute(8)
--			TaskTip("ÄãµÄ½­ºşÉùÍûÌáÉıÁË8µã")
--			AddItem(0)
--		else
--			Talk(1,"","Ìú½³£ºÔõÃ´Ñù£¿²ÄÁÏÕÒÆëÁËÃ´Âğ£¿")
--		end
--	elseif (UTask_world1502 == 10) then		-- ÈÎÎñÒÑ¾­Íê³É
--		EnchaseItem() --´ò¿ª¾«Á¶½çÃæ£¬µ«ÊÇÕâ¸öÊÇÏâÇ¶µÄ½Å±¾
--	else
--		Talk(1,"","Ìú½³£º´òÔì¸÷ÖÖ½­ºşÀûÈĞ£¡")
--	end

		
		
--		Talk(1, "", "ÒÑ¾­Ëµ¹ı»°ÀÏ£¡")
--	end
--end;
-- Vaiable States
--	Task(2) = 6/7

-- Start of Sub Function
function W1502_get()
	Say("Ta cã thÓ gióp ng­¬i söa vò khİ nh­ng cÇn 2 lo¹i nguyªn liÖu XXX vµ XXXX mçi lo¹i N phÇn, ng­¬i h·y ra ngoµi BiÖn Kinh phñ t×m chóng!",2,"Ta ®i ngay!/W1502_get_yes","Sau nµy h·y tİnh/W1502_get_no")
end

function W1502_get_yes()
	SetTask(1502,5)
	Talk(1,"","Tèt l¾m! Ta ®i t×m ngay ®©y!")
	AddNote("NhËn nhiÖm vô: ®i t×m xxx vµ xxxx, ®Õn Thî rÌn gióp n©ng cÊp vò khİ.")
	TaskTip("NhËn nhiÖm vô: ®i t×m xxx vµ xxxx, ®Õn Thî rÌn gióp n©ng cÊp vò khİ.")
end

function W1502_get_no()
end

