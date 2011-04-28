%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Web server for gc.

-module(gc_web).
-author('author <author@example.com>').

-export([start/1, stop/0, loop/2]).

%% External API

start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
    Loop = fun (Req) ->
                   ?MODULE:loop(Req, DocRoot)
           end,
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req, DocRoot) ->
    io:format("data received!~n"),
    "/" ++ Path = Req:get(path),%[]
    io:format("data received path = ~p!~n", [Req:get(method)]),
    case Req:get(method) of
        Method when Method =:= 'GET'; Method =:= 'HEAD' ->
            case Path of
		"test.gif" ->
		    io:format("data test.gif!~n"),
		    Sys_at = now(),
		    {ok, Ip={A, B, C, D}} = inet_parse:address(Req:get(peer)),
		    Ipcode = A*256*256*256+B*256*256+C*256+D,
		    
		    QueryStringList = [{list_to_atom(Key), Val} || {Key,Val}<- gc_req:get_qs(Req)],
		    List = [{sys_at, Sys_at}, {ip, Ip}, {ipcode, Ipcode} | QueryStringList],
		    {ok, Handle} = dets:open_file("./data/test.log"),
		    dets:insert(Handle, List);
                _ ->
                    Req:serve_file(Path, DocRoot)
            end;
        'POST' ->
            case Path of
                _ ->
                    Req:not_found()
            end;
        _ ->
            Req:respond({501, [], []})
    end.

%% Internal API

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.






%%
%% Tests
%%
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
