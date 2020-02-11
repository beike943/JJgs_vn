--=============================================
--create by zhoulimei 2010.6.4
--describe:Ô½ÄÏ°æ2010Äê6ÔÂ¶ËÎç½Ú»î¶¯  ×ãÇò±¦±´¿¨ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_06\\activites_03\\head.lua");--»î¶¯Í·ÎÄ¼þ

function OnUse(nItemIdx)
	KillFollower();
    local tbSay = {};
    tinsert(tbSay,  format("%s/vet_201006_03_create_pet_2", "B¸o Zakumi"));
    for i=1,getn(VET_201006_03_TB_NPC_LIST) do
    		tinsert(tbSay,  format("%s/#vet_201006_03_use(%d)", "Cæ ®éng viªn bãng ®¸ "..VET_201006_03_TB_NPC_LIST[i][2],i));
    end    
    tinsert(tbSay,  format("%s/vet_201006_03_nothing", VET_201006_03_TB_STRING_LIST[18]));
    Say(VET_201006_03_TB_STRING_LIST[15],getn(tbSay),tbSay);    
end

function vet_201006_03_use(nChoice)    
    SetTaskTemp(VET_201006_03_TASK_TMP_CHOICE,nChoice)    
    AskClientForString("vet_201006_03_create_pet","",1,31,VET_201006_03_TB_STRING_LIST[19]);
end

function vet_201006_03_create_pet(sName)
--    if DelItem(VET_201006_03_TB_ITEM_LIST[5][2], VET_201006_03_TB_ITEM_LIST[5][3], VET_201006_03_TB_ITEM_LIST[5][4], 1) == 1 then
	local nMapID = GetWorldPos()
	if nMapID == 606 or nMapID >= 700 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ sö dông vËt phÈm.")
	      return
	  end
        local nRand = GetTaskTemp(VET_201006_03_TASK_TMP_CHOICE)        
        SetTask(VET_201006_03_TASK_GET_BAOBEI_DATE,GetTime());
        SummonNpc(VET_201006_03_TB_NPC_LIST[nRand][2],sName);
        Say(VET_201006_03_TB_STRING_LIST[20],0);
        SetTaskTemp(VET_201006_03_TASK_TMP_CHOICE,0)
--    end
end

function vet_201006_03_create_pet_2()
--    if DelItem(VET_201006_03_TB_ITEM_LIST[6][2], VET_201006_03_TB_ITEM_LIST[6][3], VET_201006_03_TB_ITEM_LIST[6][4], 1) == 1 then		
		local nMapID = GetWorldPos()
		if nMapID == 606 or nMapID >= 700 then
			Talk(1,"","Khu vùc nµy kh«ng thÓ sö dông vËt phÈm.")
			return
		end
		SetTask(VET_201006_03_TASK_GET_CHONGWU_DATE,GetTime());
		SummonNpc(VET_201006_03_CHONGWU_NPC,"WorldCup 2010");
		Say(VET_201006_03_TB_STRING_LIST[21],0);
	--	end
end

function vet_201006_03_nothing()
end