--千变盒物品脚本
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Include("\\script\\lib\\globalfunctions.lua")

t_item_para = 
{
	2,1,30494,"御萱千变盒",
}

function OnUse(nItemIndex)
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
		SendScript2Client('Open([[Collection]]);')
	else
		Say("暂时还不能打开衣柜", 1, "\n知道了/no")
	end
end

function no()
end

function NpcTalkMain()
	local tbSay = {}
	local szTitle = ""

	szTitle = format("我们有便于购买和保存外观的时装衣柜")
	tinsert(tbSay, "如何获取衣柜/_npc_get_box")
	tinsert(tbSay, "了解衣柜/_about")
	tinsert(tbSay, "离开/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function _about()
	local tbSay = {}
	local szTitle = "Thi猲 Bi課 Ti誹 l? T? 竜 s? d鬾g <color=yellow>觤 Thng Ti猽 Y Phng<color>  nh薾 ngo筰 trang, ng th阨 <color=yellow>U萵 Linh<color>."
	szTitle = format("%s\n%s", szTitle, "Ngo筰 trang: c竎 h? c? th? th玭g qua t? 竜 n祔 mua ngo筰 trang m韎, ng th阨 c? th? l璾 tr? <color=yellow>3 m鉵 ngo筰 trang v躰h vi詎<color> v祇 trong (bao g錷 hi謚 鴑g u萵 linh)")
	szTitle = format("%s\n%s", szTitle, "U萵 linh: khi c竎 h? <color=yellow>mua ho芻 l蕐<color> ngo筰 trang t? t? 竜, c? th? ti課 h祅h <color=yellow>U萵 Linh<color> l猲 ngo筰 trang. C竎 d遪g ch鋘 u萵 linh 頲 l璾 tr? t? <color=yellow>U萵 Linh kh綾 b秐<color>.")
	szTitle = format("%s\n%s", szTitle, "<color=red>Nh鱪g ngo筰 trang v藅 ph萴 t? T? 竜 Thi猲 Bi課 Ti誹 r髏 ra u 30 ng祔 kh玭g th? giao d辌h<color>")

	tinsert(tbSay, "返回/NpcTalkMain")
	tinsert(tbSay, "退出/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _npc_get_box()
	get_qianbian_box(1)
end

function get_qianbian_box(bNotify)
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
    	--Talk(1,"",format("背包空间不足"))
    	return
    end
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
		--自动学会3个初始蕴灵
		if GetPlayerCollectionData(2,1) == 0 then
			SetPlayerCollectionData(2, 1, 1)
			SetPlayerCollectionData(2, 2, 1)
			SetPlayerCollectionData(2, 3, 1)
		end
		if bNotify==1 then
			Talk(1,"",format("你已经收到了%s.", t_item_para[4]))
		end
	else
		if bNotify==1 then
			Talk(1,"",format("你已经有%s了", t_item_para[4]))
		end
	end
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
        	local tbSay = {}
        	local szTitle = ""
    
        	szTitle = format("C竎 h? s? nh薾 頲 <color=yellow>[T? 竜 Thi猲 Bi課 Ti誹]<color>, trong  c? th? th? v? mua c竎 lo筰 ngo筰 trang xinh p. 觤 thng d飊g  mua ngo筰 trang c? th? i t? Ng? C竎. \nN誹 c竎 h? b蕋 c萵 l祄 m蕋 T? 竜, v蒼 c? th? n t譵 <color=yellow>L璾 T? Anh t筰 Dng Ch﹗<color> nh薾 l筰.")
        	tinsert(tbSay, "知道了/_never_show_login_message")
    
        	Say(szTitle, getn(tbSay), tbSay)
    	end
	end
end

function _never_show_login_message()
	get_qianbian_box(0)
end
