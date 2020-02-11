-- Event B¹ch Tiªn Sinh VNG
-- Created by TuanNA5

TSK_NGOCTRAI = 2542
BYTE_COUNT = 1
BYTE_FLAG = 2
TSK_THONUONG = 2543
BYTE_COUNT_COLLECT = 1
BYTE_COUNT_FINISH = 2
BYTE_DAY = 3 
BYTE_MONTH = 4
TSK_THONUONG_ACCEPT = 2544

szNpcName = "<color=green>B¹ch Tiªn Sinh<color>: "

tb_20101201_ThitNuong = 
{
	[2] = { 60000 ,  2 },
	[3] = { 120000 , 2 },
	[4] = { 240000 , 2 },
	[5] = { 360000 , 2 },
	[6] = { 480000 , 2 },
	[7] = { 600000 , 2 },
	[8] = { 1500000 , 4 },
	[9] = { 1500000 , 4 }	
}

tb_thonuong_award = {	
	[2] = 55555,
	[3] = 111111,
	[4] = 222222,
	[5] = 333333,
	[6] = 444444,
	[7] = 555555,
	[8] = 666666,
	[9] = 777777,
}


function get_task_thonuong(nByte)
	return GetByte(GetTask(TSK_THONUONG),nByte)
end

function set_task_thonuong(nByte,nVal)
	SetTask(TSK_THONUONG, SetByte(GetTask(TSK_THONUONG),nByte,nVal))
end
