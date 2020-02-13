--脚本名称：外装蕴灵的介绍
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-03-09
--代码修改记录

function ShowHelp()
	local szTitle	= "你知道么？"
	local tMenu	= {
		"我知道了 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Ex()
	local szTitle	= "你知道了？"
	local tMenu	= {
		"我知道了 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat()
	local szTitle	= "";
	szTitle = szTitle.."    ◆外装被收藏后，物品将<color=yellow>消失<color>并记录到“小小衣橱”中，可无限次取出。\n";
	szTitle = szTitle.."    ◆蕴灵被收藏后，物品将<color=yellow>消失<color>并记录到“蕴灵”界面中。在御萱千变盒购买和取出外装时，添加蕴灵效果，可无限次使用。\n";
	szTitle = szTitle.."    ◆外装收藏条件：只要是在<color=yellow>御萱千变盒<color>出售的永久外装都可以被收藏。\n";
	szTitle = szTitle.."    ◆蕴灵能力学习：可以去凤翔的龙光真人处学习与查询。\n";
	szTitle = szTitle.."\n<color>";

	local tMenu	= {
		"我知道了 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat_Ex()
	local szTitle	= "";
	szTitle = szTitle.."    ◆外装被收藏后，物品将<color=yellow>消失<color>并记录到“小小衣橱”中，可无限次取出。\n";
	szTitle = szTitle.."    ◆蕴灵被收藏后，物品将<color=yellow>消失<color>并记录到“蕴灵”界面中。在御萱千变盒购买和取出外装时，添加蕴灵效果，可无限次使用。\n";
	szTitle = szTitle.."    ◆外装收藏条件：从<color=yellow>神奇衣柜、商城或者御萱千变盒<color>购买及取出的永久外装（三件为一套的外装散件），都可以被收藏。\n";
	szTitle = szTitle.."    ◆蕴灵能力学习与查询：可以通过收集散落在江湖中的蕴灵之卷配方学习，通过F1帮助查看所有蕴灵效果。\n";
	szTitle = szTitle.."\n";

	local tMenu	= {
		"我知道了 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end


function nothing()
end
