Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Cæ L·o Ta<color>:"
function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Th«ng tin chi tiÕt ho¹t ®éng \"Sinh Tö V« Ng·\" , ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	--tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 2/STVN2_NhanNhiemVu")
	tinsert(tbSayDialog,"TiÕn ®é hoµn thµnh nhiÖm vô/STVN2_TienDoNhiemVu")
	tinsert(tbSayDialog,"Hoµn thµnh nhiÖm vô Sinh Tö V« Ng· 2/STVN_Active")
	tinsert(tbSayDialog,"§iÓm tÝch cùc cña b¶n th©n/menu_point")		
	tinsert(tbSayDialog,"NhËn th­ëng mçi ngµy/Award_Daily_Menu")
	tinsert(tbSayDialog,"NhËn th­ëng Th¨ng TiÕn (theo ®¼ng cÊp)/menu_award")
	tinsert(tbSayDialog,"Xem thêi gian cßn l¹i ®Ó nhËn th­ëng/show_time")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/gf_DoNothing"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end