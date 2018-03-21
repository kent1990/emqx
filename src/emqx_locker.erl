%%--------------------------------------------------------------------
%% Copyright © 2013-2018 EMQ Inc. All rights reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emqx_locker).

-export([start_link/0]).

%% Lock/Unlock API based on canal-lock.
-export([lock/1, unlock/1]).

%% @doc Starts the lock server
-spec(start_link() -> {ok, pid()} | ignore | {error, any()}).
start_link() ->
    canal_lock:start_link(?MODULE, 1).

%% @doc Lock a Key
-spec(lock(binary()) -> boolean()).
lock(Key) ->
    case canal_lock:acquire(?MODULE, Key, 1, 1) of
        {acquired, 1} -> true;
        full -> false
    end.

%% @doc Unlock a Key
-spec(unlock(binary()) -> ok).
unlock(Key) ->
    canal_lock:release(?MODULE, Key, 1, 1).

