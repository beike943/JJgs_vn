--File name:xisuidan_item.lua
--Describe:Ï´Ëèµ¤µÀ¾ß½Å±¾
--Create Date:2006-3-22
--Author:yanjun
Include("\\script\\online\\qingming\\qingming_head.lua");
function OnUse()
	local selTab = {
				"§­îc! Ta muèn sö dông./use",
				"Th«i ®Ó sau nµy h·y dïng./nothing",
				};
	Say("B¹n cã ®ång ý sö dông TÈy Tñy ®¬n kh«ng? Nã cã t¸c dông tÈy l¹i ®iÓm tiÒm n¨ng",2,selTab);
end;

function use()
	if DelItem(2,0,386,1) == 1 then
		ResetProperty();
		Write_Log("Sö dông vËt phÈm","§· sö dông TÈy Tñy ®¬n ");
	end;
end;

function nothing()

end;