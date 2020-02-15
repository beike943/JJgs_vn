

function yxl_killed()
    local Index,TemplateID,MonsterName = GetTriggeringUnit();
    --判断玩家是否是30级以上任务，如果是的话，就要看他是否在带新手，触发掉落英雄令
   if (GetLevel()>=30) then
       if (MonsterName=="家丁"   or MonsterName=="恶犬" or MonsterName=="护院"   or MonsterName=="内院护卫"   or MonsterName=="五行守卫" or MonsterName=="庄主亲卫"
        or MonsterName=="外院总管" or MonsterName=="内院总管" or MonsterName=="大小姐" or MonsterName=="大庄主" or MonsterName=="大长老"   or MonsterName=="剑魔"
        or MonsterName=="英雄岭剑阵"   or MonsterName=="英雄岭高手" or MonsterName=="英雄岭隐士"   or MonsterName=="王天袁"   or MonsterName=="天罡大阵"   or MonsterName=="耶律小凤"
        or MonsterName=="段宏永" or MonsterName=="英雄岭掌门" or MonsterName=="独孤求败") then
            local TeamNum = GetTeamSize();
            --计算队伍里面有多少个新手
            local myPlayerId = PlayerIndex;
            local myLevel = GetLevel();
            local NewerNum = 0;--新手数目
            if (TeamNum>=2) then
                local OtherLevel = 0;
                for i=1,TeamNum do
		            PlayerIndex = GetTeamMember(i);
		            if (PlayerIndex~=myPlayerId) then
                        OtherLevel = GetLevel();
                        if (OtherLevel<30 and myLevel>=OtherLevel+9 and IsPlayerNear(myPlayerId)~=0) then
                            NewerNum = NewerNum+1;
                        end;
		            end;
	            end;
                PlayerIndex = myPlayerId;

                if (NewerNum > 0) then
                    local LostNum = 0;--掉落概率,千分率
                        if (NewerNum == 1) then
                            LostNum = 30;
                    elseif (NewerNum == 2) then
                            LostNum = 50;
                    elseif (NewerNum == 3) then
                            LostNum = 70;
                    elseif (NewerNum == 4) then
                            LostNum = 100;
                    elseif (NewerNum == 5) then
                            LostNum = 70;
                    elseif (NewerNum == 6) then
                            LostNum = 50;
                    elseif (NewerNum == 7) then
                            LostNum = 30;
                    end;

                    --给予英雄令
                    if (random(1,1000) <= LostNum) then
                        AddItem(2,0,31,1);
                    end;
                end;
            end;
        end;
    end;
end