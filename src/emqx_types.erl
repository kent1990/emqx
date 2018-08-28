%% Copyright (c) 2018 EMQ Technologies Co., Ltd. All Rights Reserved.
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

-module(emqx_types).

%%-include("emqx.hrl").

-export_type([startlink_ret/0]).
-export_type([zone/0, client_id/0, username/0, password/0, peername/0,
              protocol/0, credentials/0]).
-export_type([topic/0, payload/0, dispatches/0]).
%%-export_type([payload/0, message/0, delivery/0]).

-type(startlink_ret() :: {ok, pid()} | ignore | {error, term()}).

-type(zone() :: atom()).
-type(client_id() :: binary() | atom()).
-type(username() :: binary() | undefined).
-type(password() :: binary() | undefined).
-type(peername() :: {inet:ip_address(), inet:port_number()}).
-type(protocol() :: mqtt | 'mqtt-sn' | coap | stomp | none | atom()).
-type(credentials() :: #{client_id := client_id(),
                         username  := username(),
                         peername  := peername(),
                         zone      => zone(),
                         atom()    => term()}).

-type(topic() :: binary()).
-type(payload() :: binary() | iodata()).
%-type(message() :: #message{}).
%-type(delivery() :: #delivery{}).

-type(dispatches() :: [{route, node(), topic()} | {dispatch, topic(), pos_integer()}]).

