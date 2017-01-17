cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git add .
git remote add origin ssh://git@github.com:mpancia/mills_cs_141.git
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git commit -m 'Website update'
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && git push -u origin master
cd "/Users/mpancia/Dropbox (Personal)/Mills/Mills Website" && ghp-import -p -n -m "$(date)" _site