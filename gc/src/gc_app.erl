%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the gc application.

-module(gc_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2, stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for gc.
start(_Type, _StartArgs) ->
    gc_deps:ensure(),
    gc_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for gc.
stop(_State) ->
    ok.


%%
%% Tests
%%
-include_lib("eunit/include/eunit.hrl").
-ifdef(TEST).
-endif.
