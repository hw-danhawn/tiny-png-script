for f in "$@"
do

   echo $f | while IFS= read file
   do
        filename=$(basename $file)
        ext=$(echo ${filename##*.} | tr "[:upper:]" "[:lower:]")
        if [ -f $file ]
        then
            if ( [ $ext == "png" ] || [ $ext == "jpg" ] || [ $ext == "jpeg" ] )
            then
                JSON=`curl -i --user api:dK09XtCzVdg8YxgmqLz0t5yF5BHYnhdC --data-binary @$file https://api.tinypng.com/shrink > file  `
                URL=${JSON/*url\":\"/}
                URL=${URL/\"*/}

                curl $URL>${file} > file
            fi
        fi
    done

done

afplay /System/Library/Sounds/Submarine.aiff