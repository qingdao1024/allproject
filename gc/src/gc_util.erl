%%%-------------------------------------------------------------------
%%% File    : gc_util.erl
%%% Author  : gordon chao <gordon@ubuntu>
%%% Description : 
%%%
%%% Created :  4 May 2011 by gordon chao <gordon@ubuntu>
%%%-------------------------------------------------------------------
-module(gc_util).

-vsn({?MODULE, 001}).
-author({gordon, chao}).

-include("../include/gc.hrl").

-export([get_tab_name/3]).

%%根据参数得到对应的表名
get_tab_name(Mod, Record, Date) ->
    {Y, M, D} = Date,
    atom_to_list(Mod) ++ "_" ++ atom_to_list(Record) ++ "_" ++ integer_to_list(Y) ++"-" ++ 
	integer_to_list(M) ++"-" ++ integer_to_list(D) ++ ".dat".


