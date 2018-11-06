alias webdav="sudo mount -t cifs //10.100.20.101/documents /media/davmount/ -o user=nma-dw"

export DOCUMENT_DIR=~/Projets/documents
export PROJETS=~/Projets

# Load the custom .*-team I have
for i in ~/.*-team; do
  [ -e $i/.load.zsh ] && . $i/.load.zsh
done
               
