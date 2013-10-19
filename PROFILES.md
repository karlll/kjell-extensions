Kjell profiles
==============

## Text classes

A profile contains the following text classes

* `text` -  Shell output text
* `prompt` -  Basic prompt
* `warning` - Warning messages (log)
* `error` - Error messages (log)
* `info` - Info messages (log)
* `string` - Strings
* `digits` - Digits
* `keyword` - Erlang keywords (not implemented)
* `term` - Terms
* `record_name` - Record names
* `record_field` - Record fields
* `function` - Functions
* `lst_start` - List start ('[')
* `lst_end` - List start (']')
* `tpl_start` - Tuple start ('{')
* `tpl_end` - Tuple end ('}')
* `bstr_start` - Bit string start ('<<') 
* `bstr_end` - Bit string end  ('>>')
* `empty_lst` - Empty list ('[]')
* `empty_tpl` - Empty tuple ('{}')
* `empty_bstr` - Empty bit string ('<<>>') 
* `elipsis` - '...'
* `comma` - ','
* `equal` - '='
* `colon` - ':'
* `pipe` - '|'
* `prompt_start` - Beginning of prompt (used by extension) 
* `prompt_text` - Prompt text (used by extension)
* `prompt_end` - End of prompt (used by extension)

## Profile format

A profile definition contains text classes and attributes with the following format

`{text_class,{text_attribute,foreground_color,background_color}}.`

where 

`text_attribute = none | reset | bright | dim | underscore | blink | reverse | hidden | alt_font_1 | alt_font_2 | alt_font_3 | alt_font_4 | alt_font_5 | alt_font_6 | alt_font_7 | alt_font_8 | alt_font_9 | framed | encircled | overlined`

`foreground_color, background_color = <color>`

`color = black | red | green | yellow | blue | magenta | cyan | white | default_fg | default_bg`

The support for certain text attributes is dependent on the terminal emulator used.

## Example profile

```
{text,{bright,white,none}}.
{prompt,{none,green,none}}.
{warning,{dim,yellow,none}}.
{error,{underscore,red,none}}.
{info,{none,white,none}}.
{string,{none,yellow,none}}.
{digits,{none,green,none}}.
{keyword,{bright,magenta,none}}.
{term,{none,cyan,none}}.
{record_name,{none,magenta,none}}.
{record_field,{none,blue,none}}.
{function,{none,magenta,none}}.
{lst_start,{none,white,none}}.
{lst_end,{none,white,none}}.
{tpl_start,{none,blue,none}}.
{tpl_end,{none,blue,none}}.
{bstr_start,{none,blue,none}}.
{bstr_end,{none,blue,none}}.
{empty_lst,{none,yellow,none}}.
{empty_tpl,{none,yellow,none}}.
{empty_bstr,{none,yellow,none}}.
{elipsis,{dim,white,none}}.
{comma,{none,white,none}}.
{equal,{none,white,none}}.
{colon,{none,white,none}}.
{pipe,{none,white,none}}.
{prompt_start,{reverse,yellow,none}}.
{prompt_text,{dim,black,yellow}}.
{prompt_end,{none,yellow,none}}.
```