-module(dash_cmd).

% must be exported by all extensions
-export([extends/0]).

-export([d/1, dash/1]).

-define(INVOKE_CMD,"open dash://").

extends() ->
  {
    % Name, Version, Description
    {"dash_cmd","0.0.1","Dash integration (http://kapeli.com/dash)"},
    [
      % Extension point, {Module,Function}, Description
      {command,{?MODULE,d},"d(String) - Search Erlang doc set using Dash"},
      {command,{?MODULE,dash},"dash(String) - Search all doc sets using Dash"}
    ]
  }.

d(SearchStr) ->
  os:cmd(?INVOKE_CMD ++ "erlang:" ++ SearchStr),
  ok.


dash(SearchStr) ->
  os:cmd(?INVOKE_CMD ++ SearchStr),
  ok.
