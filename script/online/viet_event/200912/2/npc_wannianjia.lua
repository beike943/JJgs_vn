--=============================================
--create by baiyun 2009.11.18
--describe:越南版12月份活动 万年家NPC脚本文件
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function main()
    	local tbDialog = {
            "Th鵦 hi謓 1 甶襲 c (c莕 10 B竛h Kem Vani)/give_xiangcaodangao_get_award",
            "Th玭g Gi竛g Sinh th藅 p!/nothing",
    	};
    	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091225 and nDate < 100125 then
 		Say("Th玭g Gi竛g Sinh V筺 Ni猲 s竛g l蕄 l竛h. H穣 mau th鵦 hi謓 甶襲 c.", getn(tbDialog), tbDialog);
 	else
 		Say("Th玭g Gi竛g Sinh V筺 Ni猲 s竛g l蕄 l竛h",0);
 	end
end



function nothing()

end
