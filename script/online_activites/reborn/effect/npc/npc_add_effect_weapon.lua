----------------[话说代码应该是一种艺术]----------------
--------------------------------------------------------
--脚本名称:武器蕴灵对话脚本                            |
--脚本功能:武器蕴灵相关NPC功能                         |
--功能开发人:刘宇斌                                    |
--功能开发时间:2009-12-28                              |
--主要修改记录:                                        |
--------------------------------------------------------

Include("\\script\\online_activites\\reborn\\effect\\head.lua")

---------------------------------------------------------------
--[翻译相关信息]                                              |
--灵魄:effect_soul  灵能:effect_power  活动指引:effect_guide  |
--[说明]越南武器蕴灵成功灵能直接附加不需要材料消耗            |
---------------------------------------------------------------

--//武器特效主对话入口
function weapon_effect()
    local nPlayerRoute = GetPlayerRoute();
    local tbRouteInfo = {0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1};
    tbRouteInfo[0] = 0;
    if tbRouteInfo[nPlayerRoute] == 0 then                                  --是否已经入流派
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][1]);
        return 0;
    end
    local nWeaponIndex = GetPlayerEquipIndex(2);
    SetTaskTemp(VIE_201005_REBORN_TASKTEMP_WeaponIndexSaved, nWeaponIndex); --保存当前武器索引，防止变更武器
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[1][3].."/add_weapon_effect", 
        VIE_201005_REBORN_STR_NpcDialog[1][4].."/del_weapon_effect", 
        VIE_201005_REBORN_STR_NpcDialog[1][5].."/weapon_effect_guide", 
        VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing"
    };
    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][7], getn(tbSays), tbSays);
    return 1;
end

--[蕴灵]--
function add_weapon_effect()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    if nWeaponIndex == 0 then                                               --是否携带武器
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][8]);
        return 0;
    end
    local szWeaponName = GetItemName(nWeaponIndex);
    if AbradeItem(nWeaponIndex, 0) == 0 then                                --是否有耐久
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][9], szWeaponName));
        return 0;
    end
    local szEffectSoulName = GetBindedWeaponEffectName();
    if szEffectSoulName ~= "" then                                          --是否已经附加灵魄
        Talk(1, "" , VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][10], szWeaponName, szEffectSoulName));
        return 0;
    end
    soul_choose_list(1);                                                    --根据资质判断玩家能唤醒的灵魄列表
    return 1;
end

--//根据资质判断玩家能唤醒的灵魄列表
--nPage 分页显示，表示要显示第几页
function soul_choose_list(nPage)
    local szDialogHead = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][11];
    local tbEffectSoul = {};
    local tbDialog = {};
    for i = 1, getn(VIE_201005_REBORN_TB_WeaponEffectInfo) do               --选择具有的灵魄
        if dostring(VIE_201005_REBORN_TB_WeaponEffectInfo[i][6]) == 1 then
            tinsert(tbEffectSoul, i);
        end
    end
    --分页显示处理(共两页)
    if getn(tbEffectSoul) > 5 then                                            --大于5个
        if nPage == 1 then                                                    --第一页
            for i = 1, 5 do 
                local nIndex =  tbEffectSoul[i];
                tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
            end
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][13].."/soul_choose_list(2)");
        else                                                                   --第二页
            for i = 5, getn(tbEffectSoul) do 
                local nIndex =  tbEffectSoul[i];
                tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
            end
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][14].."/soul_choose_list(1)");
        end
    else                                                                        --小于5个
        for i = 1, getn(tbEffectSoul) do
            local nIndex =  tbEffectSoul[i];
            tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
        end
        tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
    end
    if getn(tbEffectSoul) == 0 then                                             --没有资质给出提示
        szDialogHead = szDialogHead..VIE_201005_REBORN_STR_NpcDialog[1][16];
        Talk( 1, "", VIE_201005_REBORN_STR_NpcName..szDialogHead );
        return 0;
    else
        szDialogHead = szDialogHead..VIE_201005_REBORN_STR_NpcDialog[1][15];
    end
    Say(szDialogHead, getn(tbDialog), tbDialog);
    return 1;
end

--//唤醒灵魄并附加灵能
function effect_soul_wakeup(nIndex)
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[1][17].."/#effect_add_determine("..nIndex..")",
        VIE_201005_REBORN_STR_NpcDialog[1][18].."/gf_DoNothing"
    };
    Say( VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][19], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1], cost_string_build(nIndex), VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][5]), getn(tbSays), tbSays);
    return 1;
end

function effect_add_determine(nIndex)
    if is_weapon_changed_chk() ~= 1 then                                        --武器切换检测
        return 0;
    end
    if material_check_or_delete(1, nIndex) ~= 1 then                            --物品携带检测
        return 0;
    end
    if material_check_or_delete(2, nIndex) ~= 1 then                            --物品删除检测
        return 0;
    end
    --特效增加
    if BindWeaponEffect( VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1], (VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][5]*86400) ) == 1 then                                                    --86400 = 24*60*60
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][20], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]) );
        AddGlobalNews( format(VIE_201005_REBORN_STR_NpcDialog[1][21], GetName(), VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]) );
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][1], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][4]), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][1], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][4]), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
        return 0;
    end
    --附加灵能 1-生命上限增加 2-全属性
    if AddWeaponEffectAttribute(1, VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1]) == 1 then --加生命上限
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1], 1), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1], 1), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
    end
    if AddWeaponEffectAttribute(7, VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2]) == 1 then --加生命上限
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2], 2), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
        return 1;
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2], 2), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
        return 0;
    end
    return 1;
end

--[删出特效]--
function del_weapon_effect()
    local szSoulName = GetBindedWeaponEffectName();
    if szSoulName == nil or szSoulName == "" then                       --是否附了灵魄判断
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][22] );
        return 0;
    end
    if GetItemSpecialAttr( GetPlayerEquipIndex(2), "LOCK" ) == 1 then           --武器是否锁定
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][23] );
        return 0;
    end
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[1][24].."/soul_delete",
        VIE_201005_REBORN_STR_NpcDialog[1][18].."/gf_DoNothing",
    };
    Say( VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][25], szSoulName), getn(tbSays), tbSays);
    return 1;
end

--//删除函数
function soul_delete()
    if is_weapon_changed_chk() ~= 1 then                                        --武器是否更换
        return 0;
    end
    local szSoulName = GetBindedWeaponEffectName();                             --是否有灵魄
    if szSoulName == nil or szSoulName == "" then
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][22] );
        return 0;
    end
    if GetItemSpecialAttr( GetPlayerEquipIndex(2), "LOCK" ) == 1 then           --武器是否锁定
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][23] );
        return 0;
    end
    --删除处理
    --先删灵能
    local nSoulNum, tbSoul = GetWeaponEffectAttributes();
    for i = 1, nSoulNum do                                                  --可能武器具有多种灵能
        RemoveWeaponEffectAttribute(tbSoul[i].id);
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][3], tbSoul[i].id), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    end
    --再删灵魄
    UnbindWeaponEffect();    
end

-----------------------------------------[仅供本文件使用的函数]-----------------------------------------
--//武器是否更换检测
--返回1表示没有换过;返回0则表示换过
function is_weapon_changed_chk()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    local nWeaponIndexSaved = GetTaskTemp(VIE_201005_REBORN_TASKTEMP_WeaponIndexSaved);
    if nWeaponIndex == 0 then                                                   --没有装备武器
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][8]);
        return 0;
    end
    if nWeaponIndexSaved ~= nWeaponIndex then                                   --武器配对检测
        Talk( 1, "", VIE_201005_REBORN_STR_NpcName..gf_GetPlayerSexName()..VIE_201005_REBORN_STR_NpcDialog[1][26] );
        return 0;
    end
    return 1;
end

--//灵魄消耗对话字符串生成
--nSouleType 是灵魄种类从1到13
function cost_string_build(nSouleType)
    if nSouleType > 13 or nSouleType < 1 then
        return nil;
    end 
    local szString = nil;
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] ~= 0 then
        szString = format( VIE_201005_REBORN_STR_NpcDialog[1][27], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] );
    end
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] ~= 0 then
        local nMaterialType = VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][3];
        szString = szString..format(VIE_201005_REBORN_STR_NpcDialog[1][28], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][4]);
    end
    return szString;
end

--//检测携带或者删除携带
--nFlag:1为携带检测,2为携带删除
--nSouleType:消耗类型,就是VIE_201005_REBORN_TB_SoulEffectCostInfo某行
function material_check_or_delete(nFlag, nSouleType)
    local nCheckFlag = 1;
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] ~= 0 then         --金钱检测
        if nFlag == 1 then
            if GetCash() < (VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] * 10000) then
                 nCheckFlag = 0;
            end
        else
            if Pay(VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] * 10000) ~= 1 then
                nCheckFlag = 0;
            end
        end
		if nCheckFlag == 0 then
            Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][29], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1]));
            return 0;
        end
    end
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] ~= 0 then         --材料检测
        local nMaterialType = VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][3];
        if nFlag == 1 then
            if GetItemCount(VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][3]) <  VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] then
                nCheckFlag = 0;
            end
        else
            if DelItem(VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][3], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2]) ~= 1 then
                nCheckFlag = 0;
            end
        end
        if nCheckFlag == 0 then
            Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][30], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][4], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2]));
            return 0;
        end
    end
    return 1;
end

--//guide book
function weapon_effect_guide()
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[2][1].."/say_1",               --"如何唤醒灵魄"
		VIE_201005_REBORN_STR_NpcDialog[2][2].."/#say_2(1)",           --"灵魄的等级，颜色"
        VIE_201005_REBORN_STR_NpcDialog[2][3].."/#say_3(1)",           --"灵魄的唤醒条件"
        VIE_201005_REBORN_STR_NpcDialog[2][4].."/say_4",               --"如何唤醒灵能"
        VIE_201005_REBORN_STR_NpcDialog[2][5].."/#say_5(1)",           --"灵能的作用"
        VIE_201005_REBORN_STR_NpcDialog[2][6].."/main",                --"我都了解清楚了"
    };
    Say( VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][7], getn(tbSays), tbSays );
end

--如何唤醒灵魄
function say_1()
    Talk( 1, "weapon_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][8] );
end

--"灵魄的等级，颜色"
function say_2(nPage)
--nPage:页数
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][9];
    local nMin = (nPage - 1) * 5 + 1 ;                                          --每一页开始的序列号
    local nMax = min( (nMin + 4), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString = szString..format( VIE_201005_REBORN_STR_NpcDialog[2][10], VIE_201005_REBORN_TB_WeaponEffectInfo[i][2],  VIE_201005_REBORN_TB_WeaponEffectInfo[i][5] );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_2("..(nPage + 1)..")", szString);
    end
end

--"灵魄的唤醒条件"
function say_3(nPage)
--nPage:页数
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][11];
    local nMin = (nPage - 1) * 4 + 1 ;                                          --每一页开始的序列号
    local nMax = min( (nMin + 3), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString =szString..format( VIE_201005_REBORN_STR_NpcDialog[2][12], VIE_201005_REBORN_TB_WeaponEffectInfo[i][1], VIE_201005_REBORN_TB_WeaponEffectInfo[i][3], cost_string_build(i) );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_3("..(nPage + 1)..")", szString);
    end
end

--"如何唤醒灵能"
function say_4()
    Talk( 1, "weapon_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][13]);
end

--"灵能的作用"
function say_5(nPage)
--nPage:页数
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][14];
    local nMin = (nPage - 1) * 5 + 1 ;                                          --每一页开始的序列号
    local nMax = min( (nMin + 4), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString =szString..format( VIE_201005_REBORN_STR_NpcDialog[2][15], VIE_201005_REBORN_TB_WeaponEffectInfo[i][1], VIE_201005_REBORN_TB_SoulPowerInfo[i][1]*500, VIE_201005_REBORN_TB_SoulPowerInfo[i][2]*3 );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_5("..(nPage + 1)..")", szString);
    end
end