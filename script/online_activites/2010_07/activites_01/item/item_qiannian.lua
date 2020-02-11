--=============================================
--create by zhangming 2010.6.18
--describe:‘Ωƒœ∞Ê2010ƒÍ7‘¬ªÓ∂Ø1 ºÕƒÓ…˝¡˙“ª«ßƒÍΩ≈±æŒƒº˛
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--ªÓ∂ØÕ∑Œƒº˛
Include("\\script\\online\\viet_event\\vng_task_control.lua");

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[15][1], 2, 1);

tb_list_1000_chat = 
{
	[1] = "Chÿ cﬂn %d ngµy n˜a lµ Æ’n k˚ ni÷m 1000 n®m Th®ng Long rÂi!",
	[2] = "ßπi L‘ mıng 1000 n®m Th®ng Long cﬂn %d ngµy n˜a sœ di‘n ra!",
	[3] = "%d ngµy n˜a lµ ßπi L‘ 1000 n®m Th®ng Long, cÔng ÆËt ph∏o hoa nµo!",
	[4] = "Cﬂn %d ngµy n˜a th´i, chÍ ÆÓi lµ hπnh phÛc!",
	[5] = "ChÛc c∏c bπn 1 ngµy l‘ vui vŒ!",
	[6] = "K˚ ni÷m 1000 n®m Th®ng Long chÛng ta Æi ch¨i nµo!",
	[7] = "ChÛc mıng ßπi L‘ k˚ ni÷m 1000 n®m Th®ng Long!",
}

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d")) > 101024 then
		return
	end
	if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Chÿ c„ nh©n vÀt Æºng c p 77 trÎ l™n, Æ∑ gia nhÀp m´n ph∏i vµ th´ng thπo k¸ n®ng c p 55 mÌi c„ th” sˆ dÙng vÀt ph»m nµy!")
            return
     end
--	X∏c Æﬁnh ngµy th∏ng sˆ dÙng vµ sË l«n sˆ dÙng item
    local nCount = mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 100)
--    local nReceive = mod(floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 100), 100)
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if nCount >= 40 then
        Talk(1,"","MÁi ngµy chÿ c„ th” sˆ dÙng tËi Æa 40 l«n!")
        return
    end
    local nDelay = 30 - (GetTime() - GetTask(VET_1000_THANGLONG_TIME))
    if nDelay >= 0 then
    	   Talk(1,"",format("Cﬂn %d gi©y n˜a mÌi c„ th” ti’p tÙc sˆ dÙng", nDelay))
        return
    end
    local nHour = tonumber(date("%H%M"))
    if (nHour >= 0900 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1630) or (nHour >= 2030 and nHour <= 2130) then  
	    if DelItemByIndex(nItemIdx, 1) == 1 then
	        DoFireworks(871, 1)
	    	   local nExp = 200000
	        SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM,GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM)+1)
	        if tonumber(date("%y%m%d")) == 101010 then
	        		nExp = 400000
	        end
	        if tonumber(date("%y%m%d")) < 101010 then
	        local nDes = 10
	        	if tonumber(date("%m")) == 9 then
	        		nDes = nDes + 30
	        	end
	        	local nDay = nDes - tonumber(date("%d"))
	        	NpcChat(PIdx2NpcIdx(), format(tb_list_1000_chat[random(1,4)], nDay))
	        else
	        	NpcChat(PIdx2NpcIdx(), tb_list_1000_chat[random(5,7)])
	        end
	        VET_201007_01_get_exp(nExp)
	        Msg2Player("NhÀn Æ≠Óc "..nExp.." Æi”m kinh nghi÷m.")
	        SetTask(VET_1000_THANGLONG_TIME, GetTime())
	        StartTimeGuage("1000 n®m Th®ng Long", 30,0,1)
	        gf_WriteLogEx("Hoat dong thang 9 nam 2010", "Sˆ dÙng 1000 n®m Th®ng Long nhÀn "..nExp.." Æi”m kinh nghi÷m")
	    end
	else
		Talk(1,"","Chÿ c„ th” sˆ dÙng vÀt ph»m nµy trong kho∂ng thÍi gian tı 9 giÍ Æ’n 10 giÍ, 15 giÍ 30 Æ’n 16 giÍ 30, 20 giÍ 30 Æ’n 21 giÍ 30.")
		return
	end
end

function get_1000_tl()
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        	return
    end
    local nReceive = floor(mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 1000)/100)
    if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Chÿ c„ nh©n vÀt Æºng c p 77 trÎ l™n, Æ∑ gia nhÀp m´n ph∏i vµ th´ng thπo k¸ n®ng c p 55 mÌi c„ th” nhÀn vÀt ph»m nµy!")
            return
     end
    if nReceive >= 1 then
    	   Talk(1,"","MÁi ngµy chÿ c„ th” nhÀn vÀt ph»m nµy 1 l«n!")
        return
    end
    gf_AddItemEx2({2,1,30219,40}, "K˚ Ni÷m 1000 n®m Th®ng Long", "Hoat dong thang 9 nam 2010", "nhÀn")
    SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) + 100)
end