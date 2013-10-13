-module(splash).

% must be exported by all extensions
-export([extends/0]).

-export([splash_msg/1,startup/1]).



splash() ->
  Info = erlang:system_info(system_version),
  Version = kjell_profile:get_value(kjell_version),
  Pad = lists:map(fun(X) -> " " end, lists:seq(1,11 - length(Version))),
  Divider = lists:map(fun(X) -> "-" end, lists:seq(1,length(Info))),
  "\n"
  "         .              \n"
  " ,-. ,-. |  ,-. ,-. ,-. \n"
  " |-' |   |  ,-| | | | | \n"
  " `-' '   `' `-^ ' ' `-| \n"
  "-------------------- ,| "++ Divider ++ "\n"
  " kjell v. "++ Version ++ Pad ++ "`'  "++ Info. 

extends() ->
  {
    % Name, Version, Description
    {"splash","0.0.2","Simple startup message"},
    [
      % Extension point, {Module,Function}, Description
      {startup_msg,{?MODULE,splash_msg},"A startup message"},
      {startup,{?MODULE,startup},"Sets flag at startup"}
    ]
  }.

splash_msg(_Arg) ->
  Msg = splash(), 
  {ok, Msg}.


startup(_Arg) ->
  % supress printing of system info when starting user_drv
  kjell_profile:set_value(supress_startup_info,true).
