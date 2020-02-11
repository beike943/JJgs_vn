--¾­ÂöÏµÍ³¾³½ç´ï³ÉÌõ¼þ

t_meridian_level_condition =
{
	[1] = 
		{
			sz_name = "Vâ HiÒn",
			t_require = 
				{
					trans_count = 0,
					level = 80,
				},
			t_ib_consume =
				{
					exp = 100*10000,
					t_item =
						{
							{2, 1, 270, 1, "B¹ch C©u Hoµn"},
						},
				},
		},
	[2] = 
		{
			sz_name = "Vâ T­íng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 10*10000*10000,
					t_item =
						{
--							{2, 0, 1083, 1, "Ì«Ò×»ìÔª¹¦Æ×"},
--							{2, 0, 553, 9, "´óÈË²Î¹û"},
--							{2, 1, 1008, 9, "°×¾ÔÏÉµ¤"},
							
							{2, 0, 553, 5, "§¹i Nh©n s©m"},
							{2, 1, 1008, 5, "B¹ch C©u Tiªn ®¬n"},
						},
				},
		},
	[3] = 
		{
			sz_name = "Vâ V­¬ng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 15*10000*10000, --20*10000*10000,
					t_item =
						{
							--{2, 95,  204, 4, "Ììî¸Áî"	},
							----{2, 1, 30370, 1, "ÌìÃÅ½ðÁî"	},
							
							{2, 1, 30730, 10, "Kinh M¹ch §ång Nh©n"},
							{2, 1, 270, 10, "B¹ch C©u Hoµn"},
							{2, 1, 30669, 10, "M¶nh MËt TÞch"},
						},
				},
		},
	[4] = 
		{
			sz_name = "Vâ T«n",
			t_require = 
				{
					trans_count = 6,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 95,  204, 20, "Thiªn Cang LÖnh"	},
							{2, 1, 30370, 20, "Thiªn M«n Kim LÖnh"	},
						},
				},
			global_msg = 1,
		},
	[5] = 
		{
			sz_name = "Vâ Hoµng",
		},
	[6] = 
		{
			sz_name = "Vâ Th¸nh",
		},
}

function meridianlevel_check_all_ib(nNewLevel, bNotify)
	if meridianlevel_check_require(nNewLevel, bNotify) ~= 1 then
		return 0
	end
	if meridianlevel_check_consume(nNewLevel, 0, bNotify) ~= 1 then
		return 0
	end
	return 1
end

--»ñÈ¡¾³½çÃû
function meridianlevel_getname(nNewLevel)
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name="[kh«ng]"}
	local szName = tCfg.sz_name or "[kh«ng]"
	return szName
end

--»ù±¾ÐÞÁ¶Ìõ¼þ¼ì²é
--0 ±íÊ¾Î´´ï³É
--1±íÊ¾ÒÑ´ï³É
function meridianlevel_check_require(nNewLevel, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local tPreCfg = t_meridian_level_condition[nNewLevel - 1] or {sz_name=""}
	if MeridianGetLevel() ~= (nNewLevel - 1) then
		if 1 == bNotify then
			if nNewLevel > 1 then
    			Talk(1,"",format("HiÖn ch­a ph¶i lµ c¶nh giíi %s kh«ng thÓ kÝch ho¹t c¶nh giíi %s!", tPreCfg.sz_name, tCfg.sz_name))
			else
				Talk(1,"",format("§· kÝch ho¹t c¶nh giíi cao h¬n, kh«ng thÓ kÝch ho¹t l¹i c¶nh giíi %s!", t_meridian_level_condition[nNewLevel].sz_name))
			end
		end
		return 0
	end
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			if gf_GetTransCount() < t.trans_count then
				if 1 == bNotify then
        			Talk(1,"",format("Ch­a ®¹t ®Õn chuyÓn sinh %d kh«ng thÓ kÝch ho¹t c¶nh giíi %s!", t.trans_count, tCfg.sz_name))
        		end
        		return 0
			end
		end
		if t.level and t.level > 0 then
			if GetLevel() < t.level then
				if 1 == bNotify then
        			Talk(1,"",format("CÊp ®é ch­a ®¹t %d kh«ng thÓ kÝch ho¹t c¶nh giíi %s!", t.level, tCfg.sz_name))
        		end
        		return 0
			end
		end
	else
		return 0
	end
	return 1
end

--IBÐÞÁ¶Ìõ¼þ¼ì²é»ò²Ù×÷
--0 ±íÊ¾Î´´ï³É
--1±íÊ¾ÒÑ´ï³É
function meridianlevel_check_consume(nNewLevel, bDelete, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local t = _get_ib_consume_cfg(nNewLevel) 
	if t then
		if t.exp then
			if GetExp() < t.exp then
				if 1 == bNotify then
					Talk(1,"",format("Kinh nghiÖm kh«ng ®ñ %d, kÝch ho¹t c¶nh giíi %s thÊt b¹i!", t.exp, tCfg.sz_name))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[1], ti[2], ti[3]) < ti[4] then
        			if 1 == bNotify then
        				Talk(1,"",format("%sx%d kh«ng ®ñ, kÝch ho¹t c¶nh giíi %s thÊt b¹i!", ti[5], ti[4], tCfg.sz_name))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
    		if t.exp then
            	local nCanModifyExpFlag = CanModifyExp(-1 * t.exp) or 0
            	if nCanModifyExpFlag ~= 1 then
            		return 0
            	end
            	ModifyExp(-1 * t.exp)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[1], ti[2], ti[3], ti[4])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
    		--É¾³ýÍê±ÏËµÃ÷³å»÷³É¹¦ÁË,ÅÐ¶ÏÊÇ·ñÐèÒª¹ã²¥
    		if tCfg.global_msg then
    			Msg2Global(format("[%s] kÝch ho¹t c¶nh giíi thµnh c«ng, b­íc vµo c¶nh giíi [%s], c¸c ho¹t qu¶ thËt lîi h¹i.", GetName(), meridianlevel_getname(nNewLevel)))
    		end
		end
	end
	return 1
end

--»ñÈ¡IBÏûºÄÏêÏ¸ÄÚÈÝÃèÊö
--·µ»ØszDesc
function meridianlevel_get_ib_consume_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_ib_consume_cfg(nNewLevel)
	if t then
		if t.exp then
			szDesc = format("Kinh nghiÖm %d", t.exp)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][5], t.t_item[i][4])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[kh«ng]"
	end
	return szDesc
end

function meridianlevel_get_require_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			szDesc = format("%s chuyÓn sinh %d", szDesc, t.trans_count)
		end
		if t.level and t.level > 0 then
			szDesc = format("%s cÊp %d", szDesc, t.level)
		end
	else
		szDesc = "[kh«ng]"
	end
	return szDesc
end

function _get_ib_consume_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_ib_consume
	end
end

function _get_require_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_require
	end
end

--Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--Ô½ÄÏ×ªÉú½Å±¾
--VNG define begin
--Ö±½Ó°Ñ½Å±¾ÒýÓÃ¹ýÀ´£¬²»Òª°üº¬ÎÄ¼þÁË
function vng_get_translife_count()
	local TRANSLIFE_TASK_ID = 1538
	local TRANSLIFE_BYTE_COUNT = 1
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end
--VNG define end

function gf_GetTransCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--Ô½ÄÏ×ªÉú±äÁ¿×î¶à½øÐÐ5×ª£¬6×ªÒÔÉÏÖÐ·½ÏµÍ³¼ÇÂ¼
		return nAddvanceTrans + 5
	end
	return vng_get_translife_count()
end

