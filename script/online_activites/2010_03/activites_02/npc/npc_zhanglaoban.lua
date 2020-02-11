--=============================================
--create by zhangming 2010.2.25
--describe:越南版2010年3月活动2 张老板NPC脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_02\\head.lua");--活动头文件
Include ("\\script\\lib\\globalfunctions.lua")
Include ("\\script\\online_activites\\2010_03\\activites_02\\strings.lua")

function isNumber(firstLetter)
   for i = 0, 9 do
      if firstLetter == tostring(i) then
         return 1;
      end
   end
   return 0;
end

tbSay = {};
tbSaySize = 0;
tbDataList = {};

function getTable(start, len)
   if start+len-1 > tbSaySize then
      len = tbSaySize-start+1
      --print(len)
   end 
   local tb = {};
   local i = start;
   for i = start, start-1+len do
      tb[i-start+1] = tbSay[i];
      --print(i)
   end
   i = len;
   --print("i="..i)
   if start ~= 1 then
      i = i + 1;
      tb[i] = format(VET_201003_02_TB_TALK[1].."/#Sayex(%d)",start-6);
      i = i + 1;
      tb[i] = VET_201003_02_TB_TALK[2].."/#Sayex(1)";
   end
   if start+len-1 < tbSaySize then
      i = i + 1;
      tb[i] = format(VET_201003_02_TB_TALK[3].."/#Sayex(%d)",start+len);
   end
   i = i + 1;
   tb[i] = VET_201003_02_TB_TALK[13].."/nothing";
   return tb;
end

function Sayex(nNum)
   local tbSayN = getTable(nNum,6)
   Say(tbSay[0],getn(tbSayN),tbSayN)
end

function main()
   if gf_CheckEventDateEx(VET_201003_02_EVENT_NUMBER) == 0 then
       return 0;
   end
   local file = openfile("script/online_activites/2010_03/activites_02/npc/sell_item_list.txt","r");
   if not file then
      return
   end
   local line = read(file,"*l")
   local count = 1;
   local name = "";
   while 1 do
      local numlist = {};
      local world = read(file,"*w");
      if not world then break end;
      local firstLetter = strsub(world,1,1)
      if isNumber(firstLetter) == 1 then
         numlist[1] = tonumber(world);
         for i = 2, 5 do
            local num = read(file, "*n");
            numlist[i] = num;
         end
         tbDataList[count] = {itemName = name,id = numlist};
         count = count + 1;
         name = "";
      else
         if strlen(name) ~= 0 then
            name = name.." ";
         end
         name = name..world;
      end
   end
   for i = 1, count-1 do
      buildTbSay(tbDataList[i].itemName, tbDataList[i].id[5], i);
      
   end
   tbSaySize = count - 1;
   closefile(file);
   tbSay[0] = "<color=green>"..VET_201003_02_TB_TALK[4]..":<color>"..VET_201003_02_TB_TALK[5];
   Sayex(1)
end

function showSell(num)
   print("num = "..num)
   Say(format(VET_201003_02_TB_TALK[6],tbDataList[num].itemName),2,
      {format(VET_201003_02_TB_TALK[7].."/#sell(%d)",num),VET_201003_02_TB_TALK[8].."/nothing"})
end

function sell(num)
   if GetCash() < tbDataList[num].id[5] then
      Talk(1,"",VET_201003_02_TB_TALK[9]);
      return
   end
   if gf_Judge_Room_Weight(1,100,"") == 0 then
      return
   end
   if Pay(tbDataList[num].id[5]) == 1 then
   print(tbDataList[num].id[4])
      gf_AddItemEx2({tbDataList[num].id[1],tbDataList[num].id[2],tbDataList[num].id[3],1},
         tbDataList[num].itemName,VET_201003_02_STR_LOG_TITAL,VET_201003_02_STR_LOG_ACTIONS,tbDataList[num].id[4],1)
   end
end

function nothing()
end

function buildTbSay(itemName, money, num)
   tbSay[num] = format(VET_201003_02_TB_TALK[10].."%s(%d"..VET_201003_02_TB_TALK[14]..")/#showSell(%d)",itemName,money,num);
end

