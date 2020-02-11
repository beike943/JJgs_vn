--½Å±¾Ãû³Æ£º½á»é¶þÆÚ¹ÖÎïËÀÍö½Å±¾
--½Å±¾¹¦ÄÜ£º½á»é¶þÆÚÖÐÍÚËéÆ¬Ë¢³öµÄ¹ÖÎïµÄËÀÍö»Øµ÷½Å±¾£¬´¦Àí¸øÓÚÍæ¼Ò½±ÀøµÄ¹¦ÄÜ
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-06-07
--´úÂëÐÞ¸Ä¼ÇÂ¼
	Tb_ma_monster_prize = {
		{
			{50,	80,	70,	1,	2},
			{100,	240,100,2,	2},
		},
		{
			{100,	400,50,	3,	4},
			{100,	400,100,9,	4},
		},
	}
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	--ÊÇ·ñÊÇÒÑ»éÈËÊ¿É±µÄ´Ë¹Ö
	if GetMateName() == "" then
		return
	end
        if GetTask(2286) ~= tonumber(index) then
            return
        end
	--¼ÓÎïÆ·(¾­ÑéÏµÊý±£´æ)
	local monster_diff = 1
	if npc_name == "§¹o tÆc h¸o s¾c TrÇn c«ng tö" then
		monster_diff = 2
	end
		--½±ÀøµÈ¼¶
	local prize_level = 1
	local ran_num = random(1,100)
		if ran_num > Tb_ma_monster_prize[monster_diff][1][3] then
			prize_level = 2
		end
	--¿ªÊ¼Ôö¼ÓÎïÆ·
	local ash_num = Tb_ma_monster_prize[monster_diff][prize_level][4]
	if AddItem(2,1,584,ash_num) == 1 then
		Msg2Player("B¹n nhËn ®­îc "..ash_num.." L­u tinh Chi Sa!")
	end
	local frag_num = Tb_ma_monster_prize[monster_diff][prize_level][5]
	for i = 1,frag_num do
		AddItem(2,1,random(568,571),1)
	end
	Msg2Player("B¹n nhËn ®­îc "..frag_num.." m¶nh vì!")

	--Ôö¼Ó¾­Ñé
	local exp_base_num = 1
	if random(1,100) <= Tb_ma_monster_prize[monster_diff][1][1] then
		exp_base_num = Tb_ma_monster_prize[monster_diff][1][2]
	else
		exp_base_num = Tb_ma_monster_prize[monster_diff][2][2]
	end
	local team_member_num = GetTeamSize()
	if team_member_num <= 1 then
            local player_level = GetLevel()
	    local exp_num = player_level * player_level * exp_base_num
            SetTask(2286, 0)
	    ModifyExp(exp_num)
        else
	    for i = 1,team_member_num do
	        PlayerIndex = GetTeamMember(i)
                if GetTask(2286) == tonumber(index) then
		    local player_level = GetLevel()
		    local exp_num = player_level * player_level * exp_base_num
                    SetTask(2286, 0)
		    ModifyExp(exp_num)
	        end
	    end
        end
end
