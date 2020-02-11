

function yxl_killed()
    local Index,TemplateID,MonsterName = GetTriggeringUnit();
    --≈–∂œÕÊº“ «∑Ò «30º∂“‘…œ»ŒŒÒ£¨»Áπ˚ «µƒª∞£¨æÕ“™ø¥À˚ «∑Ò‘⁄¥¯–¬ ÷£¨¥•∑¢µÙ¬‰”¢–€¡Ó
   if (GetLevel()>=30) then
       if (MonsterName=="Th· rıng"   or MonsterName=="Th· x∏m" or MonsterName=="L≠u Manh"   or MonsterName=="C´n ÆÂ"   or MonsterName=="S„i x∏m" or MonsterName=="Thi’t Gi∏p TrÔng"
        or MonsterName=="S„i xanh" or MonsterName=="Heo rıng" or MonsterName=="Ong vµng" or MonsterName=="B∏ch NhÀt Ti‘n" or MonsterName=="TrÈm v∆t"   or MonsterName=="D¨i"
        or MonsterName=="Ki’m Kh∏ch"   or MonsterName=="M∑ H«u" or MonsterName=="Phi t∆c"   or MonsterName=="ßao Hi÷p"   or MonsterName=="M∑nh hÊ"   or MonsterName=="HÒ thi"
        or MonsterName=="N˜ ki’m kh∏ch" or MonsterName=="Hµnh Thi" or MonsterName=="S„i Æi™n") then
            local TeamNum = GetTeamSize();
            --º∆À„∂”ŒÈ¿Ô√Ê”–∂‡…Ÿ∏ˆ–¬ ÷
            local myPlayerId = PlayerIndex;
            local myLevel = GetLevel();
            local NewerNum = 0;--–¬ ÷ ˝ƒø
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
                    local LostNum = 0;--µÙ¬‰∏≈¬ ,«ß∑÷¬ 
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

                    --∏¯”Ë”¢–€¡Ó
                    if (random(1,1000) <= LostNum) then
                        AddItem(2,0,31,1);
                    end;
                end;
            end;
        end;
    end;
end