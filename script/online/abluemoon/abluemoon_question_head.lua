-----------------------------------------
-- 下列哪些物品组不全是/全是收集品的是?	
-- 三件一套的组合是?	
-- 某个道具不可能得到的地方是?	
-- 某个怪物经常出现在什么地方?	
-- 某个地方出现什么怪?	
-- 以下怪中等级最高的是?最低的是?	
-- 下列装备种等级最高最低的是?	
-- 都是某个体型穿的是?	
-- 强化+N的外功点数	
-- 某个NPC肯定不会出现的地方是?	
-- 技能描述猜技能名字	
------------------------------------------

Include("\\Script\\Class\\ktabfile.lua");

--QNA_BaseClass = new( kTabFile, "BaseClass.txt");
tabOQIS = new(KTabFile, "\\settings\\abluemoon_item_sect.txt");		-- 物品&描述
tabPOEM = new(KTabFile, "\\settings\\abluemoon_poem_sect.txt");   -- 诗 上句&下句
tabNPC = new(KTabFile, "\\settings\\abluemoon_npcpos_sect.txt");   -- 根据NPC名字猜坐标
tabWORD = new(KTabFile, "\\settings\\abluemoon_word_sect.txt");   -- 生僻字
--三件一套的组合是?	
tabOQOutSuit = new( KTabFile, "\\settings\\out_suit.txt");	-- 套装


-- 通过描述选择物品
function OQ_Item_Sect()
	if tabOQIS == nil or tabPOEM == nil or tabNPC == nil or tabWORD == nil then
		return
	end
	local nMaxRow ;
	local tabQuest;
	local select = random(5)
	if select == 1 then
		tabQuest = tabOQIS;
	elseif select == 2 then
		tabQuest = tabPOEM;
	elseif select == 3 then
		tabQuest = tabNPC;
	elseif select == 4 or select == 5 then
		tabQuest = tabWORD
	end	
	
	nMaxRow = tabQuest:getRow();
	if nMaxRow < 3 then
		return
	end
	
	local riddle;
	local answer;
	local temp;
	if select == 1 then -- 物品&描述
		riddle = "描述"
		answer = "物品"
	elseif select == 2 then -- 诗 上句&下句
		riddle = "上句"
		answer = "下句"
	elseif select == 3 then -- 根据NPC名字猜坐标
		riddle = "NPC名字"
		answer = "坐标"
	elseif select == 4 then -- 根据文字猜读音
		riddle = "文字"
		answer = "读音"
	elseif select == 5 then -- 根据文字猜字义
		riddle = "文字"
		answer = "字义"
	end
	local Quest;		-- 问题
	local Sels = {};	-- 选择
	local nRow = random(3,nMaxRow)
	Sels[2] = nRow;
	Sels[6] = 0;
	for i=3,5 do
		Sels[i] = random(3,nMaxRow)
		for j=2,i-1 do
			if Sels[j] == Sels[i] then	-- 重复
				Sels[i] = random(3,nMaxRow)
				Sels[6] = Sels[6] + 1
				if Sels[6] > 10 then
					break;
				end
				j=2
			end
		end
	end
	
	for i=3,5 do
		Sels[i] = tostring(tabQuest:getCell(Sels[i], answer))
	end
	Quest = tostring(tabQuest:getCell(nRow, riddle))
	Sels[2] = tostring(tabQuest:getCell(nRow, answer))
	
	nRow = random(2,5);	-- 正确答案
	if nRow ~= 2 then
		temp = Sels[nRow];
		Sels[nRow] = Sels[2];
		Sels[2] = temp;
	end
	Sels[1] = "请根据<color=gold>"..riddle.."<color>选择对应的<color=gold>"..answer.."<color>.\n<color=green>"..riddle..":"..Quest.."<color>\n请选择:\n";
	Sels[6] = nRow;
	return Sels;
end

-- 1套外装
function OQ_OutSuit()	
	if tabOQOutSuit == nil then
		return
	end
	local nMaxRow = tabOQOutSuit:getRow();
	if nMaxRow < 3 then
		return
	end
	-- 头,身,脚
	local tSels = {};
	
	local nRow = random(2, nMaxRow);
	tSels[1] = "请从下列选项中选择相配的<color=gold>一套外装<color>\n"
	local head = tabOQOutSuit:getCell(nRow,"头");
	local cloth = tabOQOutSuit:getCell(nRow,"身");
	local shoe = tabOQOutSuit:getCell(nRow,"脚")
	tSels[2] = head..","..cloth..","..shoe;
	local temp = 0;
	temp = random(2,nMaxRow)
	if nRow - temp == 0 then		-- 防止取到一样的
		temp = nMaxRow - temp/2 
	end
	tSels[3] = tabOQOutSuit:getCell(temp,"头")..","..cloth..","..shoe;
	tSels[4] = head..","..tabOQOutSuit:getCell(temp,"身")..","..shoe;
	tSels[5] = head..","..cloth..","..tabOQOutSuit:getCell(temp,"脚");
	--交换3,4,5选项
	for i=3,4 do
		temp = random(3,5)
		tSels[6] = tSels[i]
		tSels[i] = tSels[temp]
		tSels[temp] = tSels[6];
	end
	nRow = random(2,5);	-- 正确答案
	if nRow ~= 2 then
		temp = Sels[nRow];
		Sels[nRow] = Sels[2];
		Sels[2] = temp;
	end
	tSels[6] = nRow - 1;
	return tSels;
end

function MoonRabbit_GetAQuestion(nQuestNum)
	if nQuestNum == 1 then
		return OQ_Item_Sect();
	end
end