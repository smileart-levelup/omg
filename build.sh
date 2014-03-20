cwd=$(pwd)

for i in "$cwd"/files/* ; do
  if [ -d "$i" ]; then
    cd "$i"
    package=$(basename $(pwd))
    echo "Archive $package files"
    tar --exclude="$package.tar.bz2" --exclude=".DS_Store" --exclude=".." -zcvf "$package.tar.bz2" .
  fi
done