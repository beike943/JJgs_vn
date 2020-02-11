--神秘宝箱：随机开出任何道具

--获取表格支持
Include("\\script\\class\\ktabfile.lua");
tabItem = new(KTabFile, "\\settings\\item\\random_item.txt"); 

--主体脚本
function OnUse()

local nRow = random(3,tabItem:getRow())
local nItemG = tonumber(tabItem:getCell(nRow,"Genre"));
local nItemD = tonumber(tabItem:getCell(nRow,"Detail"));
local nItemP = tonumber(tabItem:getCell(nRow,"Particular"));
local nItemNum = tonumber(tabItem:getCell(nRow,"Num"));
local nItemName = tabItem:getCell(nRow,"Name");

DelItem(2,0,139,1,1);
AddItem(nItemG,nItemD,nItemP,nItemNum,1);
Say("B筺 nh薾 頲 <color=yellow>"..nItemNum.."<color> <color=yellow>"..nItemName.."<color>!",0);
end;
