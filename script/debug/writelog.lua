--¹¦ÄÜ¿ªÆô
DEBUG_MODE=1
function DebugWriteLog(strFormat, ...)
	if DEBUG_MODE then
		local strLogPath = "logs/debug_log/"
    	local strLog = format(strFormat, unpack(arg));
    	local strDate = date("%Y_%m_%d");
    	local strLogFile = format("debug_log_%s.log", strDate);
    	local strLogFilePath = format("%s%s",strLogPath, strLogFile);
    
    	local hFile = openfile(strLogFilePath, "a+");
    	if (hFile == nil) then
    		execute(format("mkdir \"%s\"", strLogPath));
    		hFile = openfile(strLogFilePath, "a+");
    	end
    	if (hFile ~= nil) then
    		write (hFile, strLog .. "\n");
    		closefile (hFile);
    	end
	end
end