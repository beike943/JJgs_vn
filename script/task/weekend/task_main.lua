--ÖÜÄ©»î¶¯
--created by lizhi
--2005-9-10 11:46

Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

WEEK_MATERIAL = 2160	--Ò»ÖÜËùĞè¾üÓÃÎï×Ê

function deliver_goods_begin()
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--ãê¾©
	    SetTask(TASK_GQ_DELIVER, PATH_BJ2QZ);
	    --´´½¨´¥·¢Æ÷
	    for index, value in rect_trigger_table do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("TuyÕn ®­êng chuyÓn hµng gåm Nam BiÖn Kinh, H¹nh Hoa Th«n, D­¬ng Ch©u, Long TuyÒn Th«n, B¾c TuyÒn Ch©u, TuyÒn Ch©u");
	    TaskTip("TuyÕn ®­êng chuyÓn hµng gåm Nam BiÖn Kinh, H¹nh Hoa Th«n, D­¬ng Ch©u, Long TuyÒn Th«n, B¾c TuyÒn Ch©u, TuyÒn Ch©u");
	elseif nMapID == 350 then	--ÏåÑô
		SetTask(TASK_GQ_DELIVER, PATH_XY2YZ);
	    --´´½¨´¥·¢Æ÷
	    for index, value in rect_trigger_table_2 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("TuyÕn ®­êng chuyÓn hµng gåm Linh B¶o s¬n, ThiÕu L©m, T©y BiÖn Kinh, BiÖn Kinh, Nam BiÖn Kinh, H¹nh Hoa Th«n, D­¬ng Ch©u");
	    TaskTip("TuyÕn ®­êng chuyÓn hµng gåm Linh B¶o s¬n, ThiÕu L©m, T©y BiÖn Kinh, BiÖn Kinh, Nam BiÖn Kinh, H¹nh Hoa Th«n, D­¬ng Ch©u");
	elseif nMapID == 150 then	--ÑïÖİ
		SetTask(TASK_GQ_DELIVER, PATH_YZ2XY);
	    --´´½¨´¥·¢Æ÷
	    for index, value in rect_trigger_table_3 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("TuyÕn ®­êng chuyÓn hµng gåm H¹nh Hoa Th«n, Nam BiÖn Kinh, BiÖn Kinh, T©y BiÖn Kinh, ThiÕu L©m, Linh B¶o s¬n, T­¬ng D­¬ng");
	    TaskTip("TuyÕn ®­êng chuyÓn hµng gåm H¹nh Hoa Th«n, Nam BiÖn Kinh, BiÖn Kinh, T©y BiÖn Kinh, ThiÕu L©m, Linh B¶o s¬n, T­¬ng D­¬ng");
	end;
end;

function deliver_goods_end()
    SetTask(TASK_GQ_DELIVER, 0);        --¿ÉÒÔ¼ÌĞøËÍ»õÎï
    SetTask(TASK_GQ_KILLWK_START, 1);   --¿ÉÒÔÉ±ÙÁ¿Ü
    --Ëæ±ãÉ¾³ıÒ»¸ö»õÎï
    for index, value in finished_product_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            DelItem(value[1], value[2], value[3], 1);
            --½±Àø
            AddPlayerPoint(POINT_PER_ONCE_DELIVER);
            Msg2Player("Nép 1 c¸i "..value[4].."nhËn ®­îc"..POINT_PER_ONCE_DELIVER.." ®iÓm c«ng lao");
            break
        end;
    end;
    --È«²¿ÒÆ³ı´¥·¢Æ÷£¬Ã»Ê±¼äÁË£¬È«²¿Ğ´ËÀ
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --Çå³ıÈÎÎñ±äÁ¿£¬Ã»Ê±¼äÁË£¬Ö±½ÓĞ´ËÀ
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    local szSay = {
        "§a t¹ <sex> gióp chuyÓn vËt phÈm! Nh­ng hiÖn Oa KhÊu xua qu©n tiÕn vµo H¶i T©n, kh«ng biÕt <sex>gióp ®uæi lò giÆc ®i ®­îc kh«ng?",
        "Quèc gia l©m nguy sao cã thÓ ®øng nh×n/kill_enemy",
        "Ta ®ang bËn!/end_say"
    };
    SelectSay(szSay);
end;

function check_path(nPath)   --·µ»Ø0ÔòÖ¤Ã÷È«²¿×ß¹ı£¬1ÔòÖ¤Ã÷Ã»ÓĞ×ßÍê
    local nResult = 0;
    if nPath == PATH_BJ2QZ then
	    for index, value in path_table do
	        if GetTask(value) == 0 then     --Èç¹ûÓĞÃ»×ß¹ıµÄµØÍ¼
	            return 1
	        end;
	    end;
	elseif nPath == PATH_XY2YZ then
		for index, value in path_table_2 do
	        if GetTask(value) == 0 then     --Èç¹ûÓĞÃ»×ß¹ıµÄµØÍ¼
	            return 1
	        end;
	    end;
	elseif nPath == PATH_YZ2XY then
		for index, value in path_table_3 do
	        if GetTask(value) == 0 then     --Èç¹ûÓĞÃ»×ß¹ıµÄµØÍ¼
	            return 1
	        end;
	    end;
	end;
end;

function receive_goods()
    local szPathWrong = {
        "Xin lçi! Ng­¬i kh«ng ®i ®óng tuyÕn ®­êng, gióp §¹i Tèng chuyÓn hµng thÊt b¹i."
    };
    local szNoGoods = {
        "Xin lçi! Ng­¬i kh«ng mang qu©n dông, nhiÖm vô gióp §¹i Tèng chuyÓn hµng thÊt b¹i."
    };
    local nPath = GetTask(TASK_GQ_DELIVER);
    local nMapID = GetWorldPos();
    
    if nMapID == 100 then		--ÈªÖİ
    	if nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ T­¬ng D­¬ng giao cho ChØ huy sø D­¬ng Ch©u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ D­¬ng Ch©u giao cho ChØ huy sø T­¬ng D­¬ng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
    elseif nMapID == 150 then	--ÑïÖİ
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ BiÖn Kinh giao cho ChØ huy sø TuyÒn Ch©u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ D­¬ng Ch©u giao cho ChØ huy sø T­¬ng D­¬ng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	elseif nMapID == 350 then	--ÏåÑô
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ BiÖn Kinh giao cho ChØ huy sø TuyÒn Ch©u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ng­¬i mau mang vËt t­ tõ T­¬ng D­¬ng giao cho ChØ huy sø D­¬ng Ch©u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	end;

    if is_exist(finished_product_table) == 0 then   --Èç¹ûÃ»ÓĞ»õÎï
        TalkEx("task_failed", szNoGoods);
        return
    end;
    
    if check_path(nPath) == 1 then   --Ã»×ßÍêËùÓĞµØÍ¼
        TalkEx("task_failed", szPathWrong);
        return
    end;
    
    deliver_goods_end();    --ËÍ»õ½áÊø
end;

function task_failed()
    SetTask(TASK_GQ_DELIVER, 0);
    --È«²¿ÒÆ³ı´¥·¢Æ÷£¬Ã»Ê±¼äÁË£¬È«²¿Ğ´ËÀ
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --Çå³ıÈÎÎñ±äÁ¿£¬Ã»Ê±¼äÁË£¬Ö±½ÓĞ´ËÀ
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    Msg2Player("Gióp §¹i Tèng chuyÓn hµng thÊt b¹i.");
end;

function kill_enemy()
	if GetTask(TASK_WK_ISDISCONNECT) == 0 then	--Õı³£ÍË³öµÄ
		local nCoolDown = GetCooldownTime(1800);
		if nCoolDown > 0 then
			local nMinCD = floor(nCoolDown / 60);
			local nSecCD = mod(nCoolDown, 60);
			local szTalk = {
				"<sex> TËn lùc cho ®Êt n­íc còng kh«ng nªn lµm qu¸ søc, kho¶ng"..nMinCD.." Phót "..nSecCD.." gi©y quay l¹i."
			};
			TalkEx("", szTalk);
			return
		end;
	end;
	local szSay = {
		"<sex> Sau khi vµo ®iÓm ®¨ng nhËp Oa KhÊu mêi ®Õn t­íng lÜnh tiÒn tuyÕn b¸o danh gióp ®¸nh ®uæi Oa KhÊu",
		"Ta ®· chuÈn bŞ!/kill_enemy_start",
		"Ta ®ang bËn!/end_say"
	};
	SelectSay(szSay);
end;

function kill_enemy_start()
	SetTask(TASK_WK_ISDISCONNECT, 1);
	SetLaskEnterTime();
	
	local nMapid, nX, nY = GetWorldPos();
	--¼ÇÂ¼µ±Ç°×ø±ê
    SetTask(TASK_POSITION, nMapid);
    SetTask(TASK_POSITION + 1, nX);
    SetTask(TASK_POSITION + 2, nY);
    
    --¼ÇÂ¼µÇÂ½µÄÊÇÄÄ¸öµØÍ¼
    SetTask(TASK_WHICH_MAP, random(0,1))
    
    --¼ÆËãÊÇÉ±Ê²Ã´µµ´ÎµÄÙÁ¿Ü
    local szKey = "wk_";
    local nLevel = GetLevel();
    if nLevel > 0 and nLevel <= 27 then
        szKey = szKey..20;
    elseif nLevel > 27 and nLevel <= 37 then
        szKey = szKey..30;
    elseif nLevel > 37 and nLevel <= 47 then
        szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 47 and nLevel <= 57 then
        szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 57 and nLevel <= 99 then
        szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
    end;
    --´«ËÍ
    CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
    NewWorld(maps_table[szKey][1], maps_table[szKey][2], maps_table[szKey][3]);
end;

function out_map()
    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;

    for index, value in rect_wk_table do    --ÒÆ´¦ÇøÓò´¥·¢Æ÷
        RemoveTrigger(GetTrigger(value[2]));
    end;

	RemoveTrigger(GetTrigger(log_wk_table[2]));
        --ÒÆ³ı¼ÆÊ±Æ÷
	RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
        
    SetTask(TASK_GQ_DELIVER, 0);
	SetTask(TASK_GQ_KILLWK, 0);
	SetTask(TASK_GQ_KILLWK_START, 0);
    SetLogoutRV(0);
    SetFightState(0);
	--´«ËÍ³öÉ±ÙÁ¿ÜµØÍ¼
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
end;

function deliver_goods()
    local szMsg = {
        "Sø gi¶ ho¹t ®éng: Trªn ng­êi b¹n kh«ng cã vËt t­ qu©n bŞ g× ®Ó göi µ!"
    };
    local szSayQz = {
        "Sø gi¶ ho¹t ®éng: H·y theo tuyÕn ®­êng BiÖn Kinh-Nam BiÖn Kinh-H¹nh Hoa th«n-D­¬ng Ch©u-Long TuyÒn th«n-B¾c TuyÒn Ch©u-TuyÒn Ch©u giao hµng cho ChØ huy sø!",
        "B¾t ®Çu nhiÖm vô chuyÓn vËt t­/deliver_goods_begin",
        "Kh«ng muèn chuyÓn!/end_say"
    };
    local szSayYz = {
        "Sø gi¶ ho¹t ®éng: H·y theo tuyÕn ®­êng T­¬ng D­¬ng-Linh B¶o S¬n-ThiÕu L©m-T©y BiÖn Kinh-BiÖn Kinh-Nam BiÖn Kinh-H¹nh Hoa th«n-D­¬ng Ch©u giao hµng cho ChØ huy sø!",
        "B¾t ®Çu nhiÖm vô chuyÓn vËt t­/deliver_goods_begin",
        "Kh«ng muèn chuyÓn!/end_say"
    };
    local szSayXy = {
        "Sø gi¶ ho¹t ®éng: H·y theo tuyÕt ®­êng D­¬ng Ch©u-H¹nh Hoa th«n-Nam BiÖn Kinh-BiÖn Kinh-T©y BiÖn Kinh-ThiÕu L©m-Linh B¶o S¬n-T­¬ng D­¬ng giao hµng cho ChØ huy sø!",
        "B¾t ®Çu nhiÖm vô chuyÓn vËt t­/deliver_goods_begin",
        "Kh«ng muèn chuyÓn!/end_say"
    };
    local szNoQz = {
    	"Sø gi¶ ho¹t ®éng: Ng­¬i ®· nhËn nhiÖm vô chuyÓn vËt t­ tõ BiÖn Kinh ®Õn TuyÒn Ch©u, mau ®i ®i!"
    };
    local szNoYz = {
    	"Sø gi¶ ho¹t ®éng: Ng­¬i ®· nhËn nhiÖm vô chuyÓn vËt t­ tõ T­¬ng D­¬ng ®Õn D­¬ng Ch©u, mau ®i ®i!"
    };
    local szNoXy = {
    	"Sø gi¶ ho¹t ®éng: Ng­¬i ®· nhËn nhiÖm vô chuyÓn vËt t­ tõ D­¬ng Ch©u ®Õn T­¬ng D­¬ng, mau ®i ®i!"
    };
    
    if is_exist(finished_product_table) == 0 then   --Èç¹ûÃ»ÓĞ»õÎï
        TalkEx("deliver_goods_nogoods", szMsg);
        return
    end;
    
    if GetTask(TASK_GQ_DELIVER) == PATH_BJ2QZ then
    	TalkEx("", szNoQz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_XY2YZ then
    	TalkEx("", szNoYz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_YZ2XY then
    	TalkEx("", szNoXy);
    	return
    end;
    
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--ãê¾©
		SelectSay(szSayQz);
		return
	end;
	if nMapID == 350 then	--ÏåÑô
		SelectSay(szSayYz);
		return
	end;
	if nMapID == 150 then	--ÑïÖİ
		SelectSay(szSayXy);
		return
	end;
end;

function deliver_goods_nogoods()
    SetTask(TASK_GQ_DELIVER, 0);
    --È«²¿ÒÆ³ı´¥·¢Æ÷£¬Ã»Ê±¼äÁË£¬È«²¿Ğ´ËÀ
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --Çå³ıÈÎÎñ±äÁ¿£¬Ã»Ê±¼äÁË£¬Ö±½ÓĞ´ËÀ
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
end;

function supply_armament()
    local szMsg = {
        "Sø gi¶ ho¹t ®éng: H×nh nh­ ng­êi kh«ng mang vËt t­ cho §¹i Tèng."
    };
    --Ã»ÓĞ³ÉÆ·(¾ü±¸)Ò²Ã»ÓĞ²ÄÁÏ
    if is_exist(material_table) == 0 then
        TalkEx("", szMsg);
        return
    end;
    
    supply_material();
end;

function supply_material()
	local selTab = {
				"Ta muèn nép nguyªn liÖu cña tuÇn nµy/supply_week_material",
				"Ta muèn nép tÊt c¶ c¸c nguyªn liÖu/supply_material_all",
				"Ta muèn nép nguyªn liÖu/supply_somekind_material",
				"T¹m thêi kh«ng nép/end_say",
				}
	Say("<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i muèn nép nguyªn liÖu nµo?",getn(selTab),selTab);
end;

function supply_week_material()
	local nTotalCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i kh«ng ®ñ nguyªn liÖu, x¸c nhËn chØ cã <color=yellow>"..WEEK_MATERIAL.."<color>Nguyªn liÖu qu©n dông, hiÖn ng­¬i chØ cã<color=yellow>"..nTotalCount.."<color> phÇn Qu©n phÈm.");
		return 0;
	end;
	local selTab = {
				"§óng vËy, ta muèn nép nguyªn liÖu cña tuÇn nµy/supply_week_material_confirm",
				"Ta suy nghÜ l¹i/supply_material",
				}
	Say("<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i muèn nép nguyªn liÖu cña tuÇn nµy? Sè nguyªn liÖu tuÇn tr­íc cña ng­¬i bŞ trõ <color=yellow><color=yellow>"..WEEK_MATERIAL.."<color>, ng­¬i nhËn ®­îc<color=yellow>"..WEEK_MATERIAL.."<color> ®iÓm ®Şnh quèc an bang",getn(selTab),selTab);
end;

function supply_week_material_confirm()
	local nTotalCount = 0;
	local nCount = 0;
	local nDelCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i kh«ng ®ñ nguyªn liÖu, x¸c nhËn chØ cã <color=yellow>"..WEEK_MATERIAL.."<color>Nguyªn liÖu qu©n dông, hiÖn ng­¬i chØ cã<color=yellow>"..nTotalCount.."<color> phÇn Qu©n phÈm.");
		return 0;
	end;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nDelCount = nDelCount + nCount;
		if nCount >= WEEK_MATERIAL then	--ÏÖÔÚÓ¦¸Ã²»¿ÉÄÜÓĞ¾üÓÃ¿ÉÒÔµş¼Ó³¬¹ı2160µÄ£¬²»¹ı²»ÅÅ³ıÒÔºóÓĞ¿ÉÄÜ£¬ËùÒÔ»¹ÊÇ×öÒ»ÏÂ´¦Àí°É
			DelItem(value[1], value[2], value[3], WEEK_MATERIAL);	
			break;
		elseif nDelCount < WEEK_MATERIAL then
			DelItem(value[1], value[2], value[3], nCount);
		else
			DelItem(value[1], value[2], value[3], nCount-nDelCount+WEEK_MATERIAL);
			nDelCount = WEEK_MATERIAL;	--Õâ¾äÊÇÓÃÀ´ËµÃ÷Ò»ÏÂ¶øÒÑ£¬Ã»Ê²Ã´ÒâÒå
			break;
		end;
	end;
	AddPlayerPoint(nDelCount);
 	Msg2Player("B¹n nhËn ®­îc "..nDelCount.." ®iÓm c«ng lao");
	Talk(1,"","<color=green>Sø gi¶ ho¹t ®éng<color>: Tæng céng ng­¬i ®· nép <color=yellow>"..WEEK_MATERIAL.."<color>, nhËn ®­îc<color=yellow>"..WEEK_MATERIAL.."<color> ®iÓm ®Şnh quèc an bang");	
end;

function supply_material_all()
	local selTab = {
				"Ta muèn giao toµn bé nguyªn liÖu/supply_material_all_confirm",
				"§Ó ta suy nghÜ l¹i/supply_material",
				}
	Say("<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i muèn nép nguyªn liÖu qu©n dông ­? TuÇn nµy chØ dïng nhiÒu nhÊt <color=yellow>"..WEEK_MATERIAL.."<color> ®iÓm An Bang §Şnh Quèc ®æi phÇn th­ëng, nh­ng nÕu tİch lòy nhiÒu ®iÓm ng­¬i sÏ ®æi ®­îc danh hiÖu Kh¸ng Oa",getn(selTab),selTab);
end;

function supply_material_all_confirm()
	local nCount = 0;
	local nPoint = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		DelItem(value[1], value[2], value[3], nCount);
		nPoint = nPoint + POINT_PER_MATERIALS * nCount;
	end;
	AddPlayerPoint(nPoint);
    Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm c«ng lao");
end;

function supply_somekind_material()
	local selTab = {};
    for index, value in material_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            tinsert(selTab,value[4].."/#supply_material_ok("..index..")");
        end;
    end;
    tinsert(selTab,"Ta suy nghÜ l¹i/supply_material");
    Say("<color=green>Sø gi¶ ho¹t ®éng<color>: Ng­¬i muèn nép nguyªn liÖu nµo?",getn(selTab),selTab);	
end;

function supply_material_ok(index)
    --¸øÓè½±Àø
    local szSay = {
    	"Sø gi¶ ho¹t ®éng: Mçi nguyªn liÖu ®æi ®­îc 1 ®iÓm c«ng lao, ng­¬i muèn nép bao nhiªu?",
    	"1 /#once("..index..", 1)",
    	"10 /#once("..index..", 10)",
    	"50/#once("..index..", 50)",
    	"100 /#once("..index..", 100)",
    	"Nép hÕt/#once_all("..index..")",
    	"Ta ch­a muèn giao/end_say"
    };
    SelectSay(szSay);
end;

function once(index, nPoint)
	local nCount = POINT_PER_MATERIALS * nPoint;
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Ng­¬i kh«ng cßn nguyªn liÖu ®Ó nép!"
	};
	if GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]) < nPoint then
		TalkEx("", szTalk);
		return
	end;
    DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nPoint);
    AddPlayerPoint(nCount);
    Msg2Player("B¹n nhËn ®­îc "..nCount.." ®iÓm c«ng lao");
end;

function once_all(index)
	local nCount = POINT_PER_MATERIALS * GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]);
	DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nCount);
	AddPlayerPoint(nCount);
    Msg2Player("B¹n nhËn ®­îc "..nCount.." ®iÓm c«ng lao");
end;

function calculate_exp()
    local nLevel = GetLevel();
    local nExpTableIndex = 0;
	local tExpTable = {5,8,10,15,30,60,90};
	if nLevel >=1 and nLevel <= 30 then
		nExpTableIndex = 1;
	elseif nLevel >=31 and nLevel <= 40 then
		nExpTableIndex = 2;
	elseif nLevel >=41 and nLevel <= 50 then
		nExpTableIndex = 3;
	elseif nLevel >=51 and nLevel <= 60 then
		nExpTableIndex = 4;
	elseif nLevel >=61 and nLevel <= 70 then
		nExpTableIndex = 5;
	elseif nLevel >=71 and nLevel <= 80 then
		nExpTableIndex = 6;
	else
		nExpTableIndex = 7;
	end;
	return nLevel^2*tExpTable[nExpTableIndex]
end;

function get_award()
	local nCurPoint = QueryPoint();
	if nCurPoint < 240 then
		local nMaxExp = calculate_exp();
		local nGetExp = floor(nMaxExp*nCurPoint/240);
		local selTab1 = {
					"Ta muèn dïng ®iÓm An Bang §Şnh Quèc ®Ó ®æi kinh nghiÖm/get_cheap_exp",
					"Ta kh«ng muèn ®æi phÇn th­ëng/end_say",
					}
		Say("HiÖn ng­¬i cã <color=yellow>"..nCurPoint.."<color> ®iÓm An Bang §Şnh Quèc, cã thÓ ®æi <color=yellow>"..nGetExp.."<color> ®iÓm kinh nghiÖm, nÕu ®iÓm An Bang > 240 ®iÓm cã thÓ ®æi phÇn th­ëng",getn(selTab1),selTab1);
	else
		local selTab2 = {"Dïng 240 ®iÓm An Bang ®Ó ®æi kinh nghiÖm vµ phÇn th­ëng./award_240",
						 "Ta kh«ng muèn ®æi phÇn th­ëng/end_say",}
		Say("Ng­¬i cã muèn dïng ®iÓm An Bang ®æi phÇn th­ëng kh«ng? Tr­íc khi ®æi phÇn th­ëng xin kiÓm tra l¹i kho¶ng trèng trong hµnh trang.",
			getn(selTab2),
			selTab2)
	end;
end;

function get_cheap_exp()
	local nCurPoint = QueryPoint();
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	local selTab = {
				"Ta muèn ®æi/get_cheap_exp_confirm",
				"§Ó ta suy nghÜ l¹i/end_say",
				}
	Say("HiÖn ng­¬i cã <color=yellow>"..nCurPoint.."<color> ®iÓm An Bang §Şnh Quèc, cã thÓ ®æi <color=yellow>"..nGetExp.."<color> ®iÓm kinh nghiÖm. NÕu ®iÓm An Bang nhiÒu h¬n <color=yellow>240<color> ®iÓm, cã thÓ ®æi ®­îc phÇn th­ëng gi¸ trŞ. Nh­ng lÇn ®æi nµy còng ®­îc tİnh vµo sè lÇn ®æi quµ trong ngµy, (mçi ngµy chØ ®æi ®­îc 3 lÇn) ng­¬i ®ång ı chø?",getn(selTab),selTab);
end;

function get_cheap_exp_confirm()
	local nCurPoint = QueryPoint();
	if nCurPoint <= 0 then
		Talk(1,"get_award","RÊt tiÕc ®iÓm An Bang cña ng­¬i ch­a ®ñ. H·y v× §¹i Tèng cèng hiÕn thªm.");
		return 0;
	end
	if Add240Times() ~= 1 then	--Ê§°Ü
		Talk(1,"get_award","Mçi ngµy chØ ®æi phÇn th­ëng ®­îc 3 lÇn");
		return 0;
	end;
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	AddPlayerPoint(-nCurPoint);
	ModifyExp(nGetExp);
	Msg2Player("B¹n nhËn ®­îc "..nGetExp.." ®iÓm kinh nghiÖm");
end;

function award_240()
	if QueryPoint() < 240 then
		Talk(1,"get_award","RÊt tiÕc ®iÓm An Bang cña ng­¬i ch­a ®ñ. H·y v× §¹i Tèng cèng hiÕn thªm.");
		return 0;
	end
	if Add240Times() ~= 1 then	--Ê§°Ü
		Talk(1,"get_award","Mçi ngµy chØ ®æi phÇn th­ëng ®­îc 3 lÇn");
		return 0;
	end
	AddPlayerPoint(-240);	
	local nExpAward = calculate_exp()
	nExpAward = nExpAward + 100000
	ModifyReputation(random(7,15), 0)
	ModifyExp(nExpAward);
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
	WriteLog("[Ho¹t ®éng cuèi tuÇn]:"..GetName().."Dïng 240 ®iÓm An Bang ®æi phÇn th­ëng")
end;

function query_offer()
    local nOffer = QueryPoint();
    Talk(1,"","Sø gi¶ ho¹t ®éng: §iÓm c«ng lao hiÖn t¹i lµ <color=yellow>["..nOffer.."]<color>.");
end;

function introduce_detail()
    szSay = {
        "Sø gi¶ ho¹t ®éng: §¹i Tèng tuy lín m¹nh thùc chÊt lo¹n trong giÆc ngoµi. Tõ lóc S¬n Hµ X· T¾c xuÊt hiÖn, c¸c thÕ lùc ngÊm ngÇm næi dËy. ChiÕn sù ph­¬ng b¾c liªn miªn, Oa KhÊu nh©n c¬ héi x©m nhËp vïng biÓn. Binh lùc §¹i Tèng kh«ng ®ñ chèng tr¶! Cã thÓ gióp ®¸nh ®uæi bän chóng kh«ng?",
        "Thø 6: Trang bŞ qu©n lùc/introduce_5",
        "Thø 7: Anh dòng giÕt ®Şch/introduce_6",
        "Chñ NhËt: Tinh vâ kh¸ng ®Şch/introduce_7",
        "Chó ı/introduce_inportant",
        "PhÇn th­ëng ho¹t ®éng/introduce_award",
        "HÖ thèng x­ng hiÖu/introduce_title",
        "HiÓu råi!/end_say"
    };
    SelectSay(szSay);
end;

function GetCallBossItem()
	if QueryTimes() > 0 then
		Talk(1,"GiveCallBossItem","Sö dông chóng ®¸nh b¹i vâ s­ ngo¹i téc.");
	end;
end;

function GiveCallBossItem()
	if g_probability(19, 100) then
		AddItem(boss_item_table[1][1], boss_item_table[1][2], boss_item_table[1][3],1,1);
	elseif g_probability(39, 100) then
		AddItem(boss_item_table[2][1], boss_item_table[2][2], boss_item_table[2][3],1,1);
	elseif g_probability(59, 100) then
		AddItem(boss_item_table[3][1], boss_item_table[3][2], boss_item_table[3][3],1,1);
	elseif g_probability(74, 100) then
		AddItem(boss_item_table[4][1], boss_item_table[4][2], boss_item_table[4][3],1,1);
	elseif g_probability(84, 100) then
		AddItem(boss_item_table[5][1], boss_item_table[5][2], boss_item_table[5][3],1,1);
	elseif g_probability(89, 100) then
		AddItem(boss_item_table[6][1], boss_item_table[6][2], boss_item_table[6][3],1,1);
	elseif g_probability(94, 100) then
		AddItem(boss_item_table[7][1], boss_item_table[7][2], boss_item_table[7][3],1,1);
	elseif g_probability(97, 100) then
		AddItem(boss_item_table[8][1], boss_item_table[8][2], boss_item_table[8][3],1,1);
	else
		AddItem(boss_item_table[9][1], boss_item_table[9][2], boss_item_table[9][3],1,1);
	end;
	--¼õÒ»ÂÖ
	AddKillWkTimes(-1);
	ModifyReputation(2, 0);	--2µãÉùÍû
end;

function introduce_5()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Ho¹t ®éng tõ 19h-24h<enter>1) Ng­êi ch¬i häc kü n¨ng chÕ t¹o cã thÓ ®Õn s­ phô t­¬ng øng häc phèi chÕ. <enter>2) Qu¸ tr×nh ®¸nh qu¸i nhËn ®­îc c¸c lo¹i nguyªn liÖu qu©n dông ®em nép ®æi ®iÓm c«ng lao. <enter>3) Tİch lòy ®iÓm c«ng lao ®Õn mét møc ®é sÏ nhËn ®­îc c¸c x­ng hiÖu. <enter>4) §Õn gÆp LÔ quan BiÖn Kinh, Thµnh §«, TuyÒn Ch©u dïng ®iÓm c«ng lao ®æi phÇn th­ëng*2 mçi ngµy chØ cã 3 c¬ héi nhËn, cã thÓ lùa chän."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_6()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Ho¹t ®éng tõ 19h- 24h <enter>1) §¸nh qu¸i nhËn ®­îc c¸c lo¹i nguyªn liÖu qu©n dông. <enter>2) Dïng kü n¨ng häc ®­îc ®em c¸c lo¹i nguyªn liÖu qu©n dông lµm thµnh phÈm. <enter>3) Mang qu©n dông ®Õn ®èi tho¹i víi Sø gi¶ ho¹t ®éng ë BiÖn Kinh, T­¬ng D­¬ng hoÆc D­¬ng Ch©u më nhiÖm vô chuyÓn vËt t­. <enter>4) Theo tuyÕn ®­êng chØ ®Şnh mang vËt t­ giao cho ChØ huy sø nhËn 25 ®iÓm c«ng lao vµ c¬ héi ra tiÒn tuyÕn giÕt Oa KhÊu."
	};
	TalkEx("introduce_6_next", szTalk);
end;

function introduce_6_next()
	local szTalk = {
		"5) Vµo khu vùc Oa KhÊu trong 30 phót tiªu diÖt 50 tªn. Sau ®ã tù ®éng tho¸t khái khu vùc ®Õn ChØ huy sø nhËn b¶o vËt §¹i Tèng. <enter>6) Dïng b¶o vËt §¹i Tèng gäi vâ s­ ngo¹i téc, ®¸nh b¹i cã c¬ héi nhËn ®­îc m¶nh tranh b¸t qu¸i. <enter>7) b¶o vËt §¹i Tèng kh¸c nhau t­¬ng øng víi ®¼ng cÊp vâ s­ ngo¹i téc. <enter>8) Dïng m¶nh tranh b¸t qu¸i sÏ cã chØ dÉn, theo chØ dÉn t×m kho b¸u."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_7()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Ho¹t ®éng tõ 14h-22h <enter>1) Kh«ng rít nguyªn liÖu qu©n dông, cßn l¹i gièng thø 7."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_inportant()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Ho¹t ®éng tõ 19h-24h thø 6, thø 7, Chñ NhËt tõ 14h-22h. Nh÷ng giê kh¸c kh«ng thÓ tham gia ho¹t ®éng. C¸c nguyªn liÖu qu©n ®éi cÇn chØ r¬i vµo tèi thø 6, thø 7. <enter>Häc phèi chÕ, chÕ t¹o qu©n dông thµnh phÈm vµ dïng ®iÓm c«ng lao ®æi phÇn th­ëng diÔn ra tõ thø 6 ®Õn Chñ NhËt. <enter>X­ng hiÖu dùa theo ®iÓm c«ng lao hiÖn t¹i. <enter> §æi ®iÓm c«ng lao mçi tuÇn ®Òu xãa, kh«ng thÓ tİch lòy."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_award()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: PhÇn th­ëng ho¹t ®éng phong phó! Më hÖ thèng ngo¹i trang, c¸c trang bŞ cao cÊp, B¨ng th¹ch vµ Thiªn th¹ch, Ngò hµnh th¹ch thÇn bİ, c«ng cô Hoµng Kim! ChØ cÇn gióp §¹i Tèng ®¸nh ®uæi Oa KhÊu lµ cã c¬ héi nhËn ®­îc."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_title()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Më tr­íc hÖ thèng x­ng hiÖu! HiÖp kh¸ch diÖt Oa, n÷ hiÖp diÖt Oa, tiªn phong diÖt Oa, dòng sÜ diÖt Oa, tinh anh diÖt Oa, anh hïng diÖt Oa, danh t­íng diÖt Oa, chØ huy sø diÖt Oa, ®¹i t­íng qu©n diÖt Oa, tæng nguyªn so¸i diÖt Oa."
	};
	TalkEx("introduce_detail", szTalk);
end;

function goto_liguan()
	local szTalk = {
		"Sø gi¶ ho¹t ®éng: Mêi ®Õn LÔ quan BiÖn Kinh, Thµnh §« hoÆc TuyÒn Ch©u nhËn phÇn th­ëng t­¬ng øng."
	};
	TalkEx("", szTalk);
end;

function end_say()

end;