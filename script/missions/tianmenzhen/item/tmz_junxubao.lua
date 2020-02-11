--¾üÐè°ü

Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\camp0912\\head.lua")

tJunxuItem = {
	{"Kim Tinh",2,201,2,1990,0},
	{"Méc Tinh",2,201,4,1990,0},
	{"Thñy Tinh",2,201,6,1990,0},
	{"Háa Tinh",2,201,8,1990,0},
	{"Thæ Tinh",2,201,10,1986,0},
	{"LiÖt Nham (®Çu) cÊp 1"		,2 ,144,14,3,0},
	{"Ph¸ Kh«ng (®Çu) cÊp 1"		,2 ,144,23,3,0},
	{"Tóy KiÕm (®Çu) cÊp 1"		,2 ,144,32,3,0},
	{"TËt Phong (®Çu) cÊp 1"		,2 ,144,41,3,0},
	{"TÊn Vò (®Çu) cÊp 1"		,2 ,144,50,3,0},
	{"¦ng TËp (®Çu) cÊp 1"		,2 ,144,2,3,0},
	{"Linh T©m (®Çu) cÊp 1"      ,2 ,144,62,3,0},
	{"Lang Tiªu (®Çu) cÊp 1"      ,2 ,144,71,3,0},
	{"ThÇn Lùc (®Çu) cÊp 1"		,2 ,144,77,3,0},
	{"Ng­ng ThÇn (®Çu) cÊp 1"		,2 ,144,86,3,0},
	{"V« Gian (®Çu) cÊp 1"		,2 ,144,95,3,0},
	{"V« Cùc (®Çu) cÊp 1"		,2 ,144,104,3,0},
	{"Cuån NhÉn (®Çu) cÊp 1"		,2 ,144,113,3,0},
	{"L¨ng NhuÖ (®Çu) cÊp 1"		,2 ,144,122,3,0},
	{"Linh Viªn (®Çu) cÊp 1"		,2 ,144,131,3,0},
	{"H¶i VËn (®Çu) cÊp 1"		,2 ,144,140,3,0},
	{"H¶i T©m (®Çu) cÊp 1"		,2 ,144,149,3,0},
	{"¦ng TËp (®Çu) cÊp 2"		,2 ,144,3,3,0},	
};

function OnUse()
	Say("<color=green>Thiªn M«n TrËn qu©n nhu bao<color>: sö dông qu©n nhu bao Thiªn M«n TrËn cã c¬ héi nhËn ®­îc Ngò Hµnh Nguyªn Th¹ch, muèn sö dông ngay kh«ng?",
		2,
		"\n§óng/confrim_use",
		"\nKh«ng cÇn/gf_DoNothing")
end

function confrim_use()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	local nRand = random(1,10000);
	local nTotal = 0;
	for i = 1,getn(tJunxuItem) do
		nTotal = nTotal + tJunxuItem[i][5];
		if nRand <= nTotal then
			if DelItem(2,1,3855,1) == 1 then
				if isOpen_0912() == 1 then
					AddItem(2,95,203,1,1);
					Msg2Player("NhËn ®­îc [LÔ bao song ®¶n]x1");
				end
				if tJunxuItem[i][6] == 0 then
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1);
				else
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1,-1,-1,-1,-1,-1,-1);
				end
				Msg2Player("B¹n nhËn ®­îc ["..tJunxuItem[i][1].."]x1")
--				Observer:onEvent(OE_TMZ_Open_Junxubao);
			end
			return 1;
		end
	end
end
