--新手指引
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if ((Uworld1 == 1) and (HaveItem(0)>0)) then
		Say("谢谢你。 我感到很孤单，希望有人分享。 您想知道如何交流吗？",2,"想知道/yes","没必要!/no")
	DelItem(0)
	SetTask(1,2)
	else
		Talk(1,"","今天，我必须参加Tri Chau的晚宴！ 我不知道穿什么！ 多麻烦!")
	end
end;


function yes()
	Talk(1,"no","交流包括：学习，聊天或其他功能.按下 Ctrl 右键单击角色查看. 您可以通过以下方式与他人聊天：在搜索窗口中选择聊天项； 双击要显示的角色名称，或在聊天频道中输入玩家的名称以进行实时交流!")
	AddGoldItem(0,10);
end

function no()
	Talk(1,"","哎....")
end