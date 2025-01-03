- find folders greater than 1MB ( in this case )  

`du -sh node_modules/* | grep "\d*M" | sort -n`
