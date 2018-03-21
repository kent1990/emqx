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

-module(emqx_cli).

-export([print/1, print/2, usage/1]).

print(Msg) ->
    io:format(Msg).

print(Format, Args) ->
    io:format(Format, Args).

usage(CmdList) ->
    lists:foreach(
      fun({Cmd, Descr}) ->
        io:format("~-48s# ~s~n", [Cmd, Descr])
      end, CmdList).

