# TROUBLESHOOTING ako se sve u worskpaceu sjebe coc-java

    1.
        `CocCommand java.clean.workspace`
        `CocRestart`
    2.ako ovo gore ne pomogne:
        `cd /home/amirkos/.config/coc/extensions/coc-java-data/`
        `rm -rf jdt*`
        `go to step 1`

    3.usefull commands for troubleshooting:
        `:CocCommand java.open.serverLog`
        `:CocCommand java.clean.workspace`
        `:CocCommand java.workspace.compile`
        `:CocCommand java.open.output`
