--by liubo
--×°ÊÎÊ¥µ®Ê÷»î¶¯½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201111_DECORATE_TREE_ID = 50 --Ê¥µ®Ê÷»î¶¯ID
VET_201111_TREE_VALUE = 50 --Ê¥µ®Ê÷¼Û¸ñ*10000
VET_201111_TREE_EXITSTIME = 3*60 --Ê¥µ®Ê÷´æÔÚµÄÊ±¼ä
VET_201111_TIMESPACE_MAX = 1*60 --×°ÊÎµÄ×îÐ¡Ê±¼ä¼ä¸ô
VET_201111_DECOTIMES_MAX = 10 --×°ÊÎÊ¥µ®Ê÷¿ÃÊ÷ÉÏÏÞ
--Ê±¼ä´¥·¢Æ÷
VET_201111_TRIGGER_TBID = 1517
VET_201111_TRIGGER_UFID = 1517*2

VET_201111_TREENPC_NAME = {
	[1] = "C©y Gi¸ng sinh 2d",
	[2] = "C©y Gi¸ng sinh 2c",
	[3] = "C©y Gi¸ng sinh 1c",
	[4] = "C©y Gi¸ng sinh 1b",
	[5] = "C©y Gi¸ng sinh 1a",
}
VET_201111_DECORATETREE_TASK = TaskManager:Create(5,1)
VET_201111_DECORATETREE_TASK.IsCreate = 1 --ÊÇ·ñ´´½¨£¬1ÊÇ0·ñ£¬×°ÊÎÒ»´Î¼Ó1
VET_201111_DECORATETREE_TASK.TreeIndex = 2 --Ê¥µ®Ê÷Ë÷Òý
VET_201111_DECORATETREE_TASK.DecoTimes = 3 --×°ÊÎ´ÎÊý
VET_201111_DECORATETREE_TASK.TimeSpace = 4 --×°ÊÎµÄÊ±¼ä¼ä¸ô
VET_201111_DECORATETREE_TASK.DaySeq = 5 --Ìì´Î
VET_201111_DECORATETREE_TASK.PlayerIndex = 6 --Íæ¼ÒË÷Òý


function VET_201111_DecorateTreeDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) == 1 then
		tinsert(tbSayDialog, format(tSTRING_DECORATETREE_TABLE[1],VET_201111_TREE_VALUE).."/sale_christmas_tree")
	end
    return tbSayDialog, szSayHead 
end

function sale_christmas_tree()
	Say(format(tSTRING_DECORATETREE_TABLE[2],VET_201111_TREE_VALUE),2,"§ång ý/ensure","Kh«ng cÇn ®©u/do_nothing")
end

function ensure()
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	if Pay(VET_201111_TREE_VALUE*10000) == 1 then
		gf_AddItemEx2({2,1,30350,1},"C©y th«ng gi¸o héi","Event trang trÝ c©y th«ng noel","Mua c©y th«ng noel",24*60*60,1)
	else
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[3],VET_201111_TREE_VALUE))
	end
end

function do_nothing()
end