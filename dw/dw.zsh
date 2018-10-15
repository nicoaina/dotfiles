alias webdav="mount.davfs https://webdav.deveryware.net/documents/ /media/davmount -o rw,uid=nma-dw"

export DOCUMENT_DIR=~/Projets/documents
export PROJETS=~/Projets

# Load the custom .*-team I have
for i in ~/.*-team; do
  [ -e $i/.load.zsh ] && . $i/.load.zsh
done
               
