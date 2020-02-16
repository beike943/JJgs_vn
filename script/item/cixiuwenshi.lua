--刺绣纹饰脚本

t_collect_consume = 
{
	[1] = {
		gold = 10,
		},
	[2] = {
		gold = 20,
		t_item = {
			{"刺绣纹饰",2, 1, 30373,2},
		},
	},
	[3] = {
		gold = 40,
		t_item = {
			{"刺绣纹饰",2, 1, 30373,4},
		},
	},
	[4] = {
		gold = 5,
		t_item = {
			{"刺绣纹饰",2, 1, 30373,10},
		},
	},
	[5] = {
		gold = 100,
		t_item = {
			{"刺绣纹饰",2, 1, 30373,20},
		},
	},
	[6] = {
		gold = 900,
		t_item = {
			{"刺绣纹饰",2, 1, 30373,40},
		},
	},
}

function OnUse(nItemIdx)
	OnUse_real(nItemIdx)
end

function OnUse_real(nItemIdx)
	local tbSay = {}
	local szTitle = ""
	szTitle = format("你可以直接把装到到你的外装上，也可以把它放到到你的衣橱里。\n配色后储存在小箱子里,每次你从衣橱里拿出来的时候，你都可以在你的衣服上涂上颜色，这很方便。")
	tinsert(tbSay, format("我想装到外装上/_OpenForCiXiu"))
	tinsert(tbSay, format("我想存放到衣橱里/#_Collect(%d)", nItemIdx))
	tinsert(tbSay, "只是看看/no")
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
		Talk(1,"","你已经有这种类型的了");
		return 0;
	elseif nResult == -1 then
		return 0;
	end
	
	local tbSay = {}
	local szTitle = ""
	local nLevel = GetItemLevel(nItemIdx)
	szTitle = format("存储%s需要消耗<color=yellow>%s<color>, 确定要寄存吗？", GetItemName(nItemIdx), _get_consume_desc(nLevel))
	tinsert(tbSay, format("确定/#_do_collect(%d)", nItemIdx))
	tinsert(tbSay, format("返回/#OnUse_real(%d)", nItemIdx))
	tinsert(tbSay, "放弃/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_collect(nItemIdx)
	local nLevel = GetItemLevel(nItemIdx)
	if _check_consume(nLevel, 1, 1) ~= 1 then
		Talk(1,"","存储纹理失败");
		return
	end
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if DelItemByIndex(nItemIdx,-1) == 1 then
		
		SetPlayerCollectionData(2, nCollectIndex, 1);
		Talk(1,"","成功保存, 从现在起<color=yellow>[衣柜]<color>你也可以使用这个效果");
	end
end

--获取消耗详细内容描述
--返回szDesc
function _get_consume_desc(nLevel)
	local szDesc = ""
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			szDesc = format("金卷%d", t.gold)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][1], t.t_item[i][5])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[不足]"
	end
	return szDesc
end

--IB修炼条件检查或操作
--0 表示未达成
--1表示已达成
function _check_consume(nLevel, bDelete, bNotify)
	if nLevel < 1 or nLevel > getn(t_collect_consume) then
		return 0
	end
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			if GetCash() < t.gold * 10000 then
				if 1 == bNotify then
					Msg2Player(format("<font style="金卷不足", t.gold))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        			if 1 == bNotify then
        				Msg2Player(format("%sx%d不足", ti[1], ti[5]))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --所有都检查通过了，执行删除
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



