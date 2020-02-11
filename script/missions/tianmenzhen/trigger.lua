Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
function OnLogin()
	SetTask(705,0);
	TMZ_RestorePlayerState();
end;
