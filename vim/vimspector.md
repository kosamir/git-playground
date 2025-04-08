### VIMSPECTOR  
Adding a few lines of Plug into the .vimrc:  
`  
Plug 'prabirshrestha/async.vim'  
Plug 'prabirshrestha/vim-lsp'  
Plug 'mattn/vim-lsp-settings'  
Plug 'prabirshrestha/asyncomplete.vim'  
Plug 'prabirshrestha/asyncomplete-lsp.vim'  
`  
`:PlugInstall` will then install those.  
Next open a java-file and install the language server:  
`:LspInstallServer eclipse-jdt-ls`  
Without further config fiddling my maven and gradle projects work.  
  
Just debugging is a pain…  
  
### Connecting with Vim:  
This one is a little bit more tricky.  
  
First we need Vimspector. It is a frontend for debugger inside Vim. For installation we use Plug again and add inside the .vimrc:  
  
`Plug 'puremourning/vimspector'`  
  
`:PlugInstall`  
  
Depending on your preferences they provide some default keybindings. One sane one would be:  
  
`let g:vimspector_enable_mappings = 'HUMAN'`  
  
With that you get the following keys bound:  
  
"   <F3>     VimspectorStop  
"   <F4>     VimspectorRestart  
"   <F5>     VimspectorContinue  
"   <F6>     VimspectorPause  
"   <F8>     VimspectorAddFunctionBreakpoint  
"   <F9>     VimspectorToggleBreakpoint  
"   \<F9>    VimspectorToggleConditionalBreakpoint  
"   <F10>    VimspectorStepOver  
"   <F11>    VimspectorStepInto  
"   <F12>    VimspectorStepOut  
  
Now you need an adapter. You can install it from within Vim via:  
`:VimspectorInstall vscode-java-debug`  
If you would run the debugger now by hitting F5, it would give you an error about missing configurations. Put a .vimspector.json file in your project folder and fill it with the following code:  
`  
{  
"configurations": {  
"Java Attach": {  
"adapter": "vscode-java",  
"configuration": {  
"request": "attach",  
"hostName": "${host}",  
"port": "${port}",  
"projectName": "${projectName}",  
"sourcePaths": [  
"${workspaceRoot}/src/main/java",  
"${workspaceRoot}/src/test/java"  
]  
}  
}  
}  
}  
`  
  
You can replace ${host} and ${port} directly here, else you will need to enter those again each time you let the debug run.  
Adjust projectName to the name of your project or you will get the message "Cannot evaluate, please specify projectName in launch.json" when you want to use :VimspectorEval to evaluate code.  
Running the debug via F5 now will ask for host and port, but also for another port for the DAP. This is the port of the debug server, which we still need to install.  
The debug server for Java comes from Microsoft. Clone the git repository and do the as they suggest:  
`./mvnw clean install`  
This gives in my case the needed jar at:  
  
`$HOME/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.36.0/com.microsoft.java.debug.plugin-0.36.0.jar`  
eclipse-jdt-ls will use that java-debug as a plugin, but for that we need to announce that to it. In our case we can use the lsp_settings inside the .vimrc to do so:  
  
`  
let g:lsp_settings = {  
\ 'eclipse-jdt-ls': {  
\     'initialization_options': {  
\         'bundles': [  
\             '/home/$USER/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.28.0/com.microsoft.java.debug.plugin-0.28.0.jar'  
\         ]  
\     }  
\ }  
\ }  
`  
   
The DAP server will not start automatically when we want to do some debugging. Therefor we need to start it from within Vim by notifying the eclipse-jdt-ls to do so:  
  
`:call lsp#send_request('eclipse-jdt-ls', {'method': 'workspace/executeCommand', 'params': {'command': 'vscode.java.startDebugSession'}, 'on_notification': function('lsp#utils#error')})`  
  
This sends the request to start the debug session to the eclipse-jdt-ls, and puts the returned message as output on the vim messages as error. The important part is the result, which is the port that we will put into the DAPPort:  
  
{'response': {'id': 3, 'jsonrpc': '2.0', 'result': 43071}, 'request': {'id': 3, 'jsonrpc': '2.0', 'method': 'workspace/executeCommand', 'params': {'command': 'vscode.java.startDebugSession'}}}  
  
Finally, having all parts installed and set up, we can do some debugging in Vim:  
start the debug process via maven, which opens the port 5005  
start the vscode.java-debug-session, which gives an open port, like 43071  
put breakpoints in your code via F9  
start debugging in Vim via F5, put in localhost as host, 5005 as port, and 43071 for DAPPORT  
Edit:  
  
Sometimes it happened for me, that the eclipse-jdt-ls doesn't want to start again, and :LspStatus will just give eclipse-jdt-ls: exited . Looking at the vim-lsp.log didn't give any meaningful or helpful information. Neither the log of the server found at: ~/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/data/.metadata/.log  
  
But I found a little hint at the eclipse-jdt-ls repository about Java 9 or newer. Adding those extra and missing options:  
  
--add-modules=ALL-SYSTEM --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED  
to the end of the java-line in the ~/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls/eclipse-jdt-ls file seems to help.  
  
