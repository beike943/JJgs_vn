--´ÌÐåÎÆÊÎ½Å±¾

t_collect_consume = 
{
	[1] = {
		gold = 10,
		},
	[2] = {
		gold = 20,
		t_item = {
			{"Kh¾c b¶n",2, 1, 30373,2},
		},
	},
	[3] = {
		gold = 40,
		t_item = {
			{"Kh¾c b¶n",2, 1, 30373,4},
		},
	},
	[4] = {
		gold = 5,
		t_item = {
			{"Kh¾c b¶n",2, 1, 30373,10},
		},
	},
	[5] = {
		gold = 100,
		t_item = {
			{"Kh¾c b¶n",2, 1, 30373,20},
		},
	},
	[6] = {
		gold = 900,
		t_item = {
			{"Kh¾c b¶n",2, 1, 30373,40},
		},
	},
}

function OnUse(nItemIdx)
	OnUse_real(nItemIdx)
end

function OnUse_real(nItemIdx)
	local tbSay = {}
	local szTitle = ""
	szTitle = format("C¸c h¹ cã thÓ uÈn linh trùc tiÕp ®Õn ngo¹i trang hoÆc mang uÈn linh lµm thµnh phèi ph­¬ng l­u tr÷ trong Tñ ¸o Thiªn BiÕn TiÕu. \nPhèi ph­¬ng sau khi ®­îc l­u tr÷ trong Tñ ¸o Thiªn BiÕn TiÕu, mçi lÇn rót ngo¹i trang tõ tñ ¸o ra sö dông ®Òu cã thÓ thªm uÈn linh lªn ngo¹i trang, v« cïng tiÖn lîi.")
	tinsert(tbSay, format("Ta muèn g¾n linh tÝnh/_OpenForCiXiu"))
	tinsert(tbSay, format("Ta muèn l­u tr÷/#_Collect(%d)", nItemIdx))
	tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OpenForCiXiu()
	SendScript2Client("Open([[CommonEnhanceItem]], 1);");
end

function _Collect(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if nCollectIndex < 0 then
		return
	end
	local nResult = GetPlayerCollectionData(2, nCollectIndex);
	if nResult == 1 then
		Talk(1,"","C¸c h¹ ®· cã uÈn linh nµy råi.");
		return 0;
	elseif nResult == -1 then
		return 0;
	end
	
	local tbSay = {}
	local szTitle = ""
	local nLevel = GetItemLevel(nItemIdx)
	szTitle = format("L­u tr÷ %s cÇn tiªu hao <color=yellow>%s<color>, x¸c ®Þnh muèn l­u tr÷?", GetItemName(nItemIdx), _get_consume_desc(nLevel))
	tinsert(tbSay, format("X¸c ®Þnh/#_do_collect(%d)", nItemIdx))
	tinsert(tbSay, format("trë l¹i/#OnUse_real(%d)", nItemIdx))
	tinsert(tbSay, "Tõ bá/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_collect(nItemIdx)
	local nLevel = GetItemLevel(nItemIdx)
	if _check_consume(nLevel, 1, 1) ~= 1 then
		Talk(1,"","L­u tr÷ UÈn Linh thÊt b¹i!");
		return
	end
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if DelItemByIndex(nItemIdx,-1) == 1 then
		
		SetPlayerCollectionData(2, nCollectIndex, 1);
		Talk(1,"","C¸c h¹ ®· l­u tr÷ UÈn Linh nµy thµnh c«ng, tõ nay vÒ sau khi rót ngo¹i trang tõ <color=yellow>[Tñ ¸o Thiªn BiÕn Tiªu]<color> ®Òu cã thÓ ®Ýnh kÌm hiÖu øng uÈn linh nµy.");
	end
end

--»ñÈ¡ÏûºÄÏêÏ¸ÄÚÈÝÃèÊö
--·µ»ØszDesc
function _get_consume_desc(nLevel)
	local szDesc = ""
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			szDesc = format("Vµng %d", t.gold)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][1], t.t_item[i][5])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[kh«ng]"
	end
	return szDesc
end

--IBÐÞÁ¶Ìõ¼þ¼ì²é»ò²Ù×÷
--0 ±íÊ¾Î´´ï³É
--1±íÊ¾ÒÑ´ï³É
function _check_consume(nLevel, bDelete, bNotify)
	if nLevel < 1 or nLevel > getn(t_collect_consume) then
		return 0
	end
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			if GetCash() < t.gold * 10000 then
				if 1 == bNotify then
					Msg2Player(format("Vµng kh«ng ®ñ %d!", t.gold))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        			if 1 == bNotify then
        				Msg2Player(format("%sx%d kh«ng ®ñ", ti[1], ti[5]))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
    		if t.gold then
            	Pay(t.gold*10000)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
		end
	end
	return 1
end

function no()
end



