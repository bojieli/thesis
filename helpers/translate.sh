#!/bin/sh
f=$1
[ ! -f "$f" ] && exit

echo "Begin translating $f"

gs -sDEVICE=pngalpha -o temp.png -r300 $f
[ ! -f temp.png ] && exit

python3 `dirname $0`/translate_image.py temp.png translated.jpg
[ ! -f translated.jpg ] && exit

convert translated.jpg translated.png || exit

pngquant --force --output=translated.png --quality=30 translated.png || exit
convert translated.png $f || exit

rm -f temp.png translated.png translated.jpg
echo "Finished translating $f"
