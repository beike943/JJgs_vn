-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");

Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\西北区\\昆仑\\npc\\陈不为.lua";	--默认值
g_szInforHeader = "<color=green>Tr莕 B蕋 Vi<color>:";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	--backroom_main();
	
	--一般情况下的对话
	strTalk = {
		{"陈不为: 上次我们出海真是太有趣了."},
		{"昆仑之道，天地之道。清静自然，无为而修。太真峰是昆仑自然仙气最集中的地方，各前辈都喜欢在那里参道修气，更可以观则天文地理，紫微斗数，参悟符法天道。弟子前去秘境，定要向前辈们虚心请教，千万不要鲁莽行事啊。. "},
		{"V﹏ phi猽 t竛 th苙g h? ca dao, ti猽 di猽 t? phng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
end