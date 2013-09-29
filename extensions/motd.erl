-module(motd).

% must be exported by all extensions
-export([extends/0]).

-export([msg/1]).


logo() -> "          .              |\n"
          "  ,-. ,-. |  ,-. ,-. ,-. |\n"
          "  |-' |   |  ,-| | | | | |\n"
          "  `-' '   `' `-^ ' ' `-| |\n"
          "                      ,| |\n"
          "                      `' |\n". 

extends() ->
    {
      % Name, Version, Description
      {"MOTD","0.0.1","Simple startup message"},
      [
       % Extension point, {Module,Function}, Description
       {startup_msg,{?MODULE,msg},"A startup message"}
      ]
    }.

msg(Arg) ->
    Msg = logo(), %"Kjell 0.2.0",

    {ok, Msg}.


