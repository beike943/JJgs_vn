--=============================================
--create by zhangming 2010.8.20
--describe:Ô½ÄÏ°æ2010Äê9ÔÂÖÐÇï»î¶¯ ¿¾Â¯½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");--¹«¹²º¯ÊýÎÄ¼þ

function main()
    local nNpcIndex = GetTargetNpc()
    local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    end
    
    local nLastTime = GetTask(VET_201009_01_TASK_KAOLU_TIME) 
    local nTimeNow = GetTime()
    if nTimeNow - nLastTime < 30 then
    		local nDiff = 30 - (nTimeNow - nLastTime)
    		Talk(1,"","Cßn "..nDiff.." gi©y n÷a míi cã thÓ lÊy b¸nh ra khái lß!")
    		return
    end
    Say("B¸nh ®· chÝn võa ®ñ, mau lÊy ra kÎo khÐt b¸nh!",2,format("Mau lÊy b¸nh/#get_cake(%d)",nNpcIndex),"T¹m thêi ch­a lÊy/gf_DoNothing")
end


function get_cake(nNpcIndex)
	SetNpcScript(nNpcIndex,"")
	SetNpcLifeTime(nNpcIndex, 0)
	local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    	if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    	end	
    	AddUnitStates(nNpcIndex, 6, 1)
    	SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,0)
	gf_AddItemEx2({2, 1,30237, 20},VET_201009_01_TB_ITEM_LIST[1][1],VET_201009_01_STR_LOG_TITLE, "nhËn b¸nh Thá con n­íng b¸nh",0,1)
end