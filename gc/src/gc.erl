%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(gc).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%% @spec start() -> ok
%% @doc Start the gc server.
start() ->
    gc_deps:ensure(),
    ensure_started(crypto),
    application:start(gc).

%% @spec stop() -> ok
%% @doc Stop the gc server.
stop() ->
    Res = application:stop(gc),
    application:stop(crypto),
    Res.
