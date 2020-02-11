--by liubo
--2011Äê12ÔÂÊ¥µ®½ÚÖ÷»î¶¯

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
--externs taskid
--¼ÇÂ¼µ±ÌìÖÖÏÂÖÖ×ÓµÄÊıÁ¿
VET_201112_PLANTTREES_TASKID = 2135

--ÁºÉ½Ã¿ÈÕÈÎÎñ»ñµÃ½±Àø
function get_award_liangshan(nNum)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅĞ¶Ï
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	gf_AddItemEx2({2,1,30347,50},"KÑo Que","Hoat dong thang 12 nam 2011","L­¬ng S¬n v­ît ¶i nhiÖm vô h»ng ngµy",0,1)
end
--ÁºÉ½¿ªÆô¾ÛÒå±¦Ïä»ñµÃ½±Àø
function get_award_juyibox()
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	gf_AddItemEx2({2,1,30347,10},"KÑo Que","Hoat dong thang 12 nam 2011","L­¬ng S¬n Tô NghÜa B¶o R­¬ng",0,1)
end

--ÖÖÏÂÒ»¿ÅÖÖ×Ó
-- function get_award_planttrees()
	--ÊÇ·ñ¿ªÆô»î¶¯ÅĞ¶Ï
	-- if gf_CheckEventDateEx(48) ~= 1 then
		-- return 0
	-- end
	-- if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        -- Talk(1,"",tSTRING_201111_TABLE[3])
		-- return 0
    -- end
	-- local nNum = GetTask(VET_201112_PLANTTREES_TASKID)
	-- if nNum > 0 and nNum <= 6 then
		-- gf_AddItemEx2({2,1,30347,5},"ÌÇ¹û","2011Äê12ÔÂÊ¥µ®½Ú»î¶¯","ÖÖ×Ó",0,1)
	-- elseif nNum > 6 and nNum <= 12 then
		-- gf_AddItemEx2({2,1,30347,15},"ÌÇ¹û","2011Äê12ÔÂÊ¥µ®½Ú»î¶¯","ÖÖ×Ó",0,1)
	-- elseif nNum > 12 and nNum <= 24 then
		-- gf_AddItemEx2({2,1,30347,25},"ÌÇ¹û","2011Äê12ÔÂÊ¥µ®½Ú»î¶¯","ÖÖ×Ó",0,1)
	-- end
-- end

--²Î¼ÓÒ»³¡ÌìÃÅÕó
function get_award_tianmenzhen(nType)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅĞ¶Ï
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	if nType == 1 then
		gf_AddItemEx2({2,1,30347,50},"KÑo Que","Event noel n¨m 2011","Thiªn M«n trËn",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30347,100},"KÑo Que","Event noel n¨m 2011","Thiªn M«n trËn",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30347,300},"KÑo Que","Event noel n¨m 2011","Thiªn M«n trËn",0,1)
	else
		gf_AddItemEx2({2,1,30347,30},"KÑo Que","Event noel n¨m 2011","Thiªn M«n trËn",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
