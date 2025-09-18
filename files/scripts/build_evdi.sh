KERN=${1:-$(ls /usr/src/kernels | head --lines=1)}

set -e

echo "Installing kmod-evdi"
dnf install -y kmod-evdi displaylink

echo "Building evdi kmod for $KERN"
akmods --force --kernels $KERN --akmod evdi

echo "Listing evdi module:"
ls -l /usr/lib/modules/$KERN/extra/evdi
