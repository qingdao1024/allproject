

-define(DC_WEB, <<"dc_web">>).

-record(dc_log1, {id, ip, sys_at, ipcode, refer, browser, os, resolution, url}).%% id = {ip, sys_at}.

%%dets默认存放路径
-define(PATH, "./data/log/").

%%打印用宏
%-define(PRINT, io:format("Mod:~p, Line:~p, Msg:~p~n", [?MODULE, ?LINE])).
-define(PRINT(Msg), io:format("Mod:~p, Line:~p, Msg:~p~n", [?MODULE, ?LINE, Msg])).

