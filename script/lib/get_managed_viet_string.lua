--定义直接获取预定义的越南文字符串的方法
Include("\\script\\ks2vng\\lib\\managed_viet_string_id_def.lua")
Include("\\script\\lib\\managed_viet_string_id_def_ks.lua")

SZ_MANAGEED_VIET_STRING_FILE = "\\script\\ks2vng\\lib\\managed_viet_string.ini"
SZ_MANAGEED_VIET_STRING_FILE_KS = "\\script\\lib\\no_trans\\managed_viet_string_ks.ini"

t_stringres = 
{
}

function getManagedVietString(nStringIndex)
	if nStringIndex and nStringIndex > 0 then
		if not t_stringres[nStringIndex] then
			local szIniFile = ""
			if nStringIndex >= VIET_STR_ID_KINGSOFT_BEGIN and nStringIndex <= VIET_STR_ID_KINGSOFT_BEGIN  then
				szIniFile = SZ_MANAGEED_VIET_STRING_FILE_KS
			else
				szIniFile = SZ_MANAGEED_VIET_STRING_FILE
			end
			--只有未载入的时候才从文件去读入，防止所有需要用到该文件的脚本都去载入所有的字符串资源
    		IniFile_Load(szIniFile)
    		local key = format("%d", nStringIndex)
    		t_stringres[nStringIndex] =  IniFile_GetData(szIniFile, "string_res", key)
    		IniFile_Unload(szIniFile)
    	end
    	return t_stringres[nStringIndex]
	end
	return ""
end