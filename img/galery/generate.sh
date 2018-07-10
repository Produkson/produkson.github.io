#!/bin/bash

echo Will generate a galery

FILES=./brut/*.jpg
NAME_ID=$((001))

echo    '<juiceboxgallery galleryTitle="">' > ./config.xml

for f in $FILES
do
    NAME_IMG=./images/img_$(printf "%02d\n" $NAME_ID).jpg
    NAME_THUMB=./images/img_thumb_$(printf "%02d\n" $NAME_ID).jpg

    echo "Processing $f file to $NAME_IMG and $NAME_THUMB ... "

    cp "$f" $NAME_IMG

    convert $NAME_IMG -resize 85x85 $NAME_THUMB

    
    echo    "    <image imageURL=\"img/galery/images/$NAME_IMG\"" >> ./config.xml
	echo    "        thumbURL=\"img/galery/images/$NAME_THUMB\"" >> ./config.xml
	echo    "        linkURL=\"img/galery/images/$NAME_IMG\"" >> ./config.xml
	echo    "        linkTarget=\"_blank\">" >> ./config.xml
	echo    "        <title></title>" >> ./config.xml
    echo    "    </image>" >> ./config.xml







  NAME_ID=$((NAME_ID+1))
  # take action on each file. $f store current file name
done

echo    "</juiceboxgallery>" >> ./config.xml
