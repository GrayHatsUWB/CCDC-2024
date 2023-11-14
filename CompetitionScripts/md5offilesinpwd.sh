find . -type f ! -name '*.md5' -execdir sh -c 'md5sum "$1" > "$1.md5"' _ {} \;
