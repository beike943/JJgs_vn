

function yxl_killed()
    local Index,TemplateID,MonsterName = GetTriggeringUnit();
    --�ж�����Ƿ���30��������������ǵĻ�����Ҫ�����Ƿ��ڴ����֣���������Ӣ����
   if (GetLevel()>=30) then
       if (MonsterName=="�Ҷ�"   or MonsterName=="��Ȯ" or MonsterName=="��Ժ"   or MonsterName=="��Ժ����"   or MonsterName=="��������" or MonsterName=="ׯ������"
        or MonsterName=="��Ժ�ܹ�" or MonsterName=="��Ժ�ܹ�" or MonsterName=="��С��" or MonsterName=="��ׯ��" or MonsterName=="����"   or MonsterName=="��ħ"
        or MonsterName=="Ӣ���뽣��"   or MonsterName=="Ӣ�������" or MonsterName=="Ӣ������ʿ"   or MonsterName=="����Ԭ"   or MonsterName=="�����"   or MonsterName=="Ү��С��"
        or MonsterName=="�κ���" or MonsterName=="Ӣ��������" or MonsterName=="�������") then
            local TeamNum = GetTeamSize();
            --������������ж��ٸ�����
            local myPlayerId = PlayerIndex;
            local myLevel = GetLevel();
            local NewerNum = 0;--������Ŀ
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
                    local LostNum = 0;--�������,ǧ����
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

                    --����Ӣ����
                    if (random(1,1000) <= LostNum) then
                        AddItem(2,0,31,1);
                    end;
                end;
            end;
        end;
    end;
end