-module(kjell_prompt).

% must be exported by all extensions
-export([extends/0]).

-export([prompt/1]).

%
% NB!: This needs a powerline patched font to look good (see https://github.com/Lokaltog/powerline-fonts).
%
%
% define in profile:
% {prompt_start,{... , ... , ...}}.
% {prompt_text, {... , ... , ...}.
% {prompt_end, {... , ... , ...}.
%

-import(kjell_profile,[q/2]).


extends() ->
    {
      % Name, Version, Description
      {"K Prompt","0.0.1","Kjell powerline-like prompt"},
      [
       % Extension point, {Module,Function}, Description
       {prompt,{?MODULE,prompt},"Prompt function"}
      ]
    }.

prompt(Args) ->
    NodeName = erlang:node(),
    [{history, Count}] = Args,
    CountStr = lists:flatten(io_lib:format("~p ",[Count])),
    get_prompt(CountStr,NodeName).

get_prompt(CountStr,NodeName) when NodeName == nonode@nohost ->
    [q(prompt_start, <<"⮀ ">>), 
     q(prompt_text,CountStr),
     q(prompt_end,<<"⮀ ">>)];

get_prompt(CountStr,NodeName) ->
    NodeStr = lists:flatten(io_lib:format("~ts ",[NodeName])),
    [q(prompt_start, <<"⮀ ">>), 
     q(prompt_text,CountStr),
     q(prompt_text,<<"⮁ ">>),
     q(prompt_text,NodeStr),
     q(prompt_end,<<"⮀ ">>)].



