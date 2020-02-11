Include("\\script\\system_switch_config.lua")

function main()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local msg = "Tö ThÇn §iÖn H¹, §¹i Héi TØ Vâ s¾p b¾t ®Çu, mêi c¸c ch­ vÞ ®¹i hiÖp ®Õn BiÖn Kinh th«ng qua [§Æc Sø §¹i Héi TØ Vâ] tham gia"
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
end
