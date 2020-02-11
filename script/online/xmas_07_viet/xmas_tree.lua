--
-- Ω£œ¿«È‘µÕ¯¬Á∞Ê2
-- xmas_seed.lua
-- 2007‘Ωƒœ •µÆªÓ∂Ø ÷÷◊”Ω≈±æ
-- 2007-12-12
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function main()
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[xmas_tree]:"..GetName().."Khi t≠Ìi n≠Ìc, GetTargetNpc trﬁ quay lπi lµ 0");
		 return 0;
	end;
	
	local nnpc_type = GetTask(TASKID_XMAS_TREE_TYPE );
	setup_global_value(nnpc_type);

	local npcName = GetTargetNpcName();
	local nNameLen = strlen(GetName());

	if GetName() ~= strsub(npcName,1,nNameLen) then
		if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) > XMAS_TREELIFETIME 
			or GetTask(TASKID_XMAS_PLANTTIME) == 0 
			or npcTreeIndex ~= GetTask(TASKID_XMAS_TREEINDEX) 
		then
			Msg2Player("ß©y kh´ng ph∂i lµ c©y bπn trÂng");
			return 0;
		end;
	end;

	local nTreeGrow = GetTask(TASKID_XMAS_TREE_GROW);
	local nTimePassed = GetTime() - GetTask(TASKID_XMAS_PLANTTIME);
	local nScore = GetTask(TASKID_XMAS_TREE_SCORE);
	
	local sSaySth = "";
	local selTab = {};
	if floor(nTimePassed/60) >= XMAS_GATHER_TIME then
		if nScore < XMAS_GATHER_SCORE_LIMIT then
			Say("  "..XMAS_TREE_NAME.." cÒa bπn kh´ng Æ≠Óc ch®m s„c tËt n™n Æ∑ bﬁ ÆÊ, l«n sau cË gæng h¨n!.", 0);
			SetNpcLifeTime(npcTreeIndex, 0);
			clear_xmas_state();
			return 1;
		else
			tinsert(selTab,"Ta sœ nhÀn th≠Îng/get_award");
			tinsert(selTab,"Kh´ng c„ g◊/nothing");
			sSaySth = "Hi÷n giÍ bπn c„ th” nhÀn ph«n th≠Îng Gi∏ng Sinh, n’u sau <color=yellow>"..Get_Time_String(XMAS_TREELIFETIME-nTimePassed).."<color> kh´ng nhÀn, c©y th´ng sœ bi’n m t.";
			Say( sSaySth, getn(selTab), selTab );
			return 1;
		end;
	else
		local nwater_time = next_water_time();
		if nwater_time == 0 then
			select_water();
			return 1;
		end
	end;
	local nwater_time = next_water_time();
	if nwater_time == nil then
		local naward_time = XMAS_GATHER_TIME * 60 - nTimePassed;
		Talk(1,"","Bπn c«n ph∂i <color=yellow>"..Get_Time_String(naward_time).."<color> mÌi c„ th” nhÀn l y ph«n th≠Îng.");
		return 0;
	end
	Talk( 1, "", "  "..XMAS_TREE_NAME.." C©y Æ—p læm, thÍi gian trang tr› c©y l«n sau cﬂn <color=yellow>"..Get_Time_String(nwater_time).."<color>" );
end;

function nothing()

end;

function next_water_time()
	local nplanted_time = GetTime() - GetTask(TASKID_XMAS_PLANTTIME);
	local nplanted_min = floor(nplanted_time / 60);
	local nlast_water = floor((GetTask(TASKID_XMAS_LAST_WATER_TIME) - GetTask(TASKID_XMAS_PLANTTIME))/60);
	for i = 1, getn(XMAS_WATER_TIME[1]) do
		if nplanted_min >= XMAS_WATER_TIME[1][i] 
			and nplanted_min < XMAS_WATER_TIME[1][i] + XMAS_WATER_TIME[2] 
			and not (nlast_water >= XMAS_WATER_TIME[1][i] and nlast_water < XMAS_WATER_TIME[1][i] + XMAS_WATER_TIME[2] )
		then
			return 0;
		elseif nplanted_min < XMAS_WATER_TIME[1][i] then
			return 1 + XMAS_WATER_TIME[1][i] * 60 - nplanted_time;
		end
	end
	return nil;
end

function select_water()
	local sSayStr = "Bπn ph∂i treo vÀt ph»m trang tr› c©y th´ng?";
	local tSaytab = {};
	
	local nTreeType = is_jh_xmas_tree();
	if nTreeType == -1 then
		return
	elseif nTreeType == 1 then
		if GetItemCount( tTreeItem[1][1], tTreeItem[1][2], tTreeItem[1][3] ) > 0 then
			tinsert( tSaytab, tTreeItem[1][4].."/#put_water(1)" );
		end
	else
		for i = 2, 5 do
			if GetItemCount( tTreeItem[i][1], tTreeItem[i][2], tTreeItem[i][3] ) > 0 then
				tinsert( tSaytab, tTreeItem[i][4].."/#put_water("..i..")" );
			end		
		end
	end
	if getn(tSaytab) < 1 then
		Say("Bπn kh´ng c„ vÀt ph»m trang tr› c©y th´ng.", 0);
		return
	end
	tinsert(tSaytab , "LÛc kh∏c sœ trang tr› sau/nothing")
	Say(sSayStr, getn(tSaytab), tSaytab);
end

function put_water(nwater_type)
	if DelItem(tTreeItem[nwater_type][1], tTreeItem[nwater_type][2], tTreeItem[nwater_type][3], 1) == 1 then
		SetTask( TASKID_XMAS_LAST_WATER_TIME, GetTime() );
		local nscore = GetTask(TASKID_XMAS_TREE_SCORE) + tTreeItem[nwater_type][5];
		SetTask(TASKID_XMAS_TREE_SCORE, nscore );
		change_tree(nscore);
	end
end

function change_tree(nscore)
	local ngrow = floor( nscore/8 );
	local nlast_grow = GetTask(TASKID_XMAS_TREE_GROW);
	if ngrow > nlast_grow then
		local old_tree_index = GetTargetNpc();
		local new_tree_index = CreateNpc( txmas_tree_mode[2], GetTargetNpcName(), GetNpcWorldPos(old_tree_index)); -- ˜µƒ–ŒÃ¨‘ı√¥»∑∂®£ø
		SetNpcLifeTime(old_tree_index, 0);
		SetCurrentNpcSFX(new_tree_index, Xmas_tree_SFX_table[ngrow], 1, 1);
		SetNpcLifeTime(new_tree_index, 25*60);
		SetNpcScript(new_tree_index,"\\script\\online\\xmas_07_viet\\xmas_tree.lua");
		SetTask(TASKID_XMAS_TREEINDEX, new_tree_index);
		SetTask(TASKID_XMAS_TREE_GROW, ngrow);
	end
end

function get_award()
	local nTreeType = is_jh_xmas_tree();
	if nTreeType == 1 then
		get_jh_award();
	elseif nTreeType == 0 then
		get_ml_award();
	else
		WriteLog("[xmas_tree] get_award nTreeType sai");
		return
	end
	clear_xmas_state();
end

function get_jh_award()
	local nscore = GetTask(TASKID_XMAS_TREE_SCORE);
	if nscore < 15 then
		Msg2Player("[xmas]error!");
		return 0;
	end
	SetNpcLifeTime(GetTargetNpc(), 0);
	local nrnd = random(1,100);
	if nrnd < 24 then	-- 1∏ˆ •µÆ◊∞ & 1000 exp
		local tAward = {
			{ {0, 108, 109, 1, 1}, "N„n gi∏ng sinh chu»n"},		
			{ {0, 109, 109, 1, 1}, "Th≠Óng y gi∏ng sinh chu»n"},	
			{ {0, 110, 73,  1, 1}, "Hπ y Gi∏ng sinh chu»n"},	
			{ {0, 108, 110, 1, 1}, "N„n gi∏ng sinh kh´i ng´"},		
			{ {0, 109, 110, 1, 1}, "Gi∏ng sinh kh´i ng´"},	
			{ {0, 110, 74,  1, 1}, "Trang phÙc gi∏ng sinh kh´i ng´"},	
			{ {0, 108, 111, 1, 1}, "N„n gi∏ng sinh nh·"},		
			{ {0, 109, 111, 1, 1}, "Th≠¨ng y gi∏ng sinh Ki“u n˜"},	
			{ {0, 110, 75,  1, 1}, "Gi∏ng sinh Ki“u n˜"},	
			{ {0, 108, 112, 1, 1}, "N„n gi∏ng sinh gÓi c∂m"},		
			{ {0, 109, 112, 1, 1}, "Th≠¨ng y gi∏ng sinh gÓi c∂m"},	
			{ {0, 110, 76,  1, 1}, "Hπ y gi∏ng sinh n˜ gÓi c∂m"},	
		};
		award = tAward[random(1, getn(tAward))];
		gf_SetLogCaption("xmas_tree");
		gf_AddItemEx( award[1], award[2] );
		gf_Modify("Exp", 1000);
		gf_SetLogCaption("");
	else
		gf_SetLogCaption("xmas_tree");
		gf_Modify("Exp", random(2,5) * 1000);
		gf_SetLogCaption("");
	end
end

function get_ml_award()
	local nscore = GetTask(TASKID_XMAS_TREE_SCORE);
	if nscore < 3 then 
		Msg2Player("[xmas]error!");
		return 0;
	end
	SetNpcLifeTime(GetTargetNpc(), 0);
	local tAward = {
		{ {1, 0, 9  , 5, 1}, "ßπi Hoµn Æ¨n"     , 3, 5},	
		{ {1, 0, 4  , 5, 1}, "Bπch V©n t∏n"     , 6, 9},
		{ {1, 0, 14 , 5, 1}, "Ng‰c Linh t∏n"     , 10, 15},
		{ {1, 5, 1  ,10, 1}, "Bi÷n Kinh HÂi phÔ" , 16, 18},
		{ {2, 0, 141, 1, 1}, "Ti™u Ki’p t∏n"     , 19, 21},
		{ {2, 1, 343, 1, 1}, "Th«n N´ng ß¨n"     , 22, 24},
	}
	for i = 1, getn(tAward) do
		if nscore >= tAward[i][3] and nscore <= tAward[i][4] then
			gf_SetLogCaption("xmas_tree");
			award = tAward[i];
			gf_AddItemEx( award[1], award[1][4].."c∏i"..award[2] );
			gf_SetLogCaption("");
			return 1;
		end
	end
end
