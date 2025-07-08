## TIPS 4 TROUBLESHOOTING COC-JAVA

Text OK would be in your statusline when jdt.ls is ready and you have statusline integration with coc.nvim. 
(could be configured by java.jdt.ls.statusIcons)

Run `:CocOpenLog` to get unexpected errors thrown by coc.nvim extensions. 

Enable verbose trace for jdt.ls by add 
    "java.trace.server": "verbose" 
in your settings file, then check output by `:CocCommand java.open.output`  


Run `:CocCommand java.open.serverLog` to open log of jdt.ls.  

Run `:CocCommand java.open.clientLog` to open extension Log File. 

Try `:CocCommand java.clean.workspace` to clean workspace cache.

#### More info

https://github.com/neoclide/coc-java


