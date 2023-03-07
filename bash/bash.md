### primjer bash skripte s provjerom parametara
`
#!/bin/bash
if [ "$#" -ne 3 ]; then
echo "usage ffind [where/to/look] [file_name]"
fi
find $1 -name $2 -type f -print 2>/dev/null
`
