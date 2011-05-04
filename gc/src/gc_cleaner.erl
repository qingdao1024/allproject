%%%-------------------------------------------------------------------
%%% File    : gc_cleaner.erl
%%% Author  : gordon chao <gordon@ubuntu>
%%% Description : 
%%%
%%% Created :  4 May 2011 by gordon chao <gordon@ubuntu>
%%%-------------------------------------------------------------------
-module(gc_cleaner).

-vsn({?MODULE, 001}).
-author({gordon, chao}).

-include("../include/gc.hrl").

-export([translate/2]).


translate({sys_at, Sys_at}, Record) ->
    Record#dc_log1{sys_at = Sys_at};
translate({ip, Ip}, Record) ->
    Record#dc_log1{ip = Ip};
translate({ipcode, Ipcode}, Record) ->
    Record#dc_log1{ipcode = Ipcode};
translate({refer, Refer}, Record) ->
    Record#dc_log1{refer = Refer};
translate({browser, Browser}, Record) ->
    Record#dc_log1{browser = Browser};
translate({os, Os}, Record) ->
    Record#dc_log1{os = Os};
translate({resolution, Resolution}, Record) ->
    Record#dc_log1{resolution = Resolution};
translate({url, Url}, Record) ->
    Record#dc_log1{url = Url};
translate(Other, Record) ->
    ?PRINT({Other, Record}).
