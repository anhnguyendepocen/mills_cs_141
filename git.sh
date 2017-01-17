cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && R -f render.R
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git add .
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git commit -m 'Website update'
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git push -u origin master
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && ghp-import -p -n -m "$(date)" _site