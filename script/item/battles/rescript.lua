-- Ó¢ĞÛÁî ÓÃÀ´°ÑÍæ¼Ò´«ËÍµ½ÑãÃÅ¹Ø´óÕ½±¨Ãûµã

Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");

function OnUse()
	main()
end

function main()
CleanInteractive()	--¶Ï¿ª½»»¥
	local W,X,Y = GetWorldPos();

	local nMapId = W;
	tbFORBIDDEN_MAP = { };	-- ½ûÓÃÌØÊâµØÍ¼

	if( getn(tbFORBIDDEN_MAP) ~= 0 ) then
		for j = 1, getn(tbFORBIDDEN_MAP) do
			if ( nMapId == tbFORBIDDEN_MAP[j] ) then
				Msg2Player("B¹n kh«ng thÓ sö dông ®¹o cô nµy ë ®©y.");
				return 1;
			end
		end
	end
	
	if( getn(tbBATTLEMAP) ~= 0 ) then
		for i = 1, getn(tbBATTLEMAP) do 
			if ( nMapId == tbBATTLEMAP[i] ) then
				Msg2Player("B¹n kh«ng thÓ sö dông ®¹o cô nµy ë ®©y.");
				return 1;
			end
		end
	end
	
	if (nMapId > 604 and nMapId ~= 806 and nMapId ~= 808) then
		Msg2Player("B¹n kh«ng thÓ sö dông ®¹o cô nµy ë ®©y.");
		return 1
	end

	if( HEROCARD == 1 ) then
		Say ( "                             <color=red>§¹i Tèng anh hïng lÖnh<color><enter><enter><enter> Phe cã ng­êi ®«ng sÏ chiÕm ­u thÕ nh­ng ®iÓm chiÕn c«ng nhËn ®­îc sÏ İt ®i.<enter> B¹n muèn ®Õn b¸o danh phe nµo?", 3, "                           Vµo ®iÓm b¸o danh phe Tèng/ToSong", "                           T×m hiÓu Nh¹n M«n quan/bt_onbattleinfo", "                           Xuşt...Ta lµ ®µo binh./Cancel" );
	else
		Say ( "                             <color=red>§¹i Liªu anh hïng lÖnh<color><enter><enter><enter> Phe cã ng­êi ®«ng sÏ chiÕm ­u thÕ nh­ng ®iÓm chiÕn c«ng nhËn ®­îc sÏ İt ®i.<enter> B¹n muèn ®Õn b¸o danh phe nµo?", 3, "                           Vµo ®iÓm b¸o danh phe Liªu/ToLiao",  "                           T×m hiÓu Nh¹n M«n quan/bt_onbattleinfo", "                           Xuşt...Ta lµ ®µo binh./Cancel" );
	end
	-- ¿Õ¸ñ²»Òª¸ÄÁË£¬ÎªÁË¾ÓÖĞÏÔÊ¾
	return 1;

end

function ToSong()	-- ½øÈëËÎ·½±¨Ãûµã
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i nµo! ChiÕn tr­êng rÊt khèc liÖt! Häc xong vâ nghÖ h·y quay l¹i tham chiÕn!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng rÊt khèc liÖt! Gia nhËp m«n ph¸i, häc xong vâ nghÖ h·y quay l¹i tham chiÕn!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "§Õn ®iÓm b¸o danh Nh¹n M«n quan chiÕn tr­êng s¬ cÊp phe Tèng."
	elseif ( GetLevel() >= 60 ) then
		str = "§Õn ®iÓm b¸o danh Nh¹n M«n quan chiÕn tr­êng cao cÊp phe Tèng."
	end
	if (DelItem( 2, 0, 107, 1) == 1) then
		NewWorld( bt_getsignpos( 1 ));
		SetFightState(0);
--		UseScrollEnable(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( str );
	end
end

function ToLiao()	-- ½øÈëÁÉ·½±¨Ãûµã
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i nµo! ChiÕn tr­êng rÊt khèc liÖt! Häc xong vâ nghÖ h·y quay l¹i tham chiÕn!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng rÊt khèc liÖt! Gia nhËp m«n ph¸i, häc xong vâ nghÖ h·y quay l¹i tham chiÕn!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "§Õn ®iÓm b¸o danh Nh¹n M«n quan chiÕn tr­êng s¬ cÊp phe Liªu."
	elseif ( GetLevel() >= 60 ) then
		str = "§Õn ®iÓm b¸o danh Nh¹n M«n quan chiÕn tr­êng cao cÊp phe Liªu."
	end
	if (DelItem( 2, 0, 108, 1 ) == 1) then
		NewWorld( bt_getsignpos( 2 ));
		SetFightState(0);
--		UseScrollEnable(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( str );
	end
end


function Cancel()
end