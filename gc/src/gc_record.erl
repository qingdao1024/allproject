%%%-------------------------------------------------------------------
%%% File    : gc_record.erl
%%% Author  : gordon chao <gordon@ubuntu>
%%% Description : save data
%%%
%%% Created :  4 May 2011 by gordon chao <gordon@ubuntu>
%%%-------------------------------------------------------------------
-module(gc_record).

-vsn({?MODULE, 001}).
-author({gordon, chao}).

-include("../include/gc.hrl").

%%-record(dc_log1, {id, ip, sys_at, ipcode, refer, browser, os, resolution, url}).%% id = {ip, sys_at}.
-export([save/1, save/2]).

save(Record) when is_record(Record, dc_log1)->
    Path = ?PATH ++ gc_util:get_tab_name(gc, dc_log1, date()),
    {ok, Handle} = dets:open_file(Path, [{keypos, 1}, {ram_file, true}, {type, set}]),
    dets:insert(Handle, Record).

save([], Record) ->
    save(Record);
save([Item|List], Record) ->
    NewRecord = gc_cleaner:translate(Item, Record),
    save(List, NewRecord);
save(Other, Record) ->
    ?PRINT({Other, Record}).


