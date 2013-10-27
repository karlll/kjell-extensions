Kjell extensions
================

# Extension points

A number of extension point are defined at certain places in the shell execution / lifecycle. Extensions can register to be notified when these points are activated. Depending on which type of extension point that are being activated, the extension might be provided with input, and may also produce some output.

The following extension points are defined

* `prompt` - Activated for each new used input in the shell. 
  Returns a custom prompt that replaces the default one.
  Extensions should export `prompt(LineCount) -> PromptChars`
* `startup_msg` - Activated before the first input prompt is shown.
  Returns a startup message. Extensions should export `startup_msg(_Arg) -> {ok, Message}`
* `startup` - Activated when kjell is started, after configuration is initialized. Extensions should export `startup(_Arg) -> {ok} | {error,Msg}`
* `command` - Activated when a function exported by the command extension is invoked from the shell.

The following extension points are defined but yet not implemented

* `shell_input_line`
* `shell_output_line`

# Writing extensions

An extension should export the function `extends/0` which should return the following

```
extends() ->
    {
      % Name, Version, Description
      {"Test extension","0.0.1","En example extension."},
      [
       % Extension point, {Module,Function}, Description
       {startup_msg,{?MODULE,msg},"A simple startup msg"}
      ]
    }.

msg(_Arg) -> "Hello world.".
```   

The example above extends the startup_msg extension point, and will return hello world when the startup_msg extension point is activated.
On extension module can provide multiple extension points.

# Using extensions

When placed in `$USER/.kjell/extensions` the extension will be compiled and registered next time kjell is started. 