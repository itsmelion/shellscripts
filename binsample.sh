#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
TARGET="$(readlink "$SOURCE")"
if [[ $TARGET == /* ]]; then
# echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
SOURCE="$TARGET"
else
DIR="$( dirname "$SOURCE" )"
# echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
fi
done
# echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
# echo "DIR is '$DIR'"
# echo "Current directory is $( pwd )"


# # Component Scaffold Script
echo "Component name: "
read component
COMPONENT=$component

# Super powerful line substitution command
CONTAINER=$( sed -e "/\\/\\/ COMPONENTS/a\\
import ${COMPONENT}, { componentName as ${COMPONENT} } from \\'../reusable_components/user_list/${COMPONENT}\\';" $ROBOS_DIR/dashboard/src/app/container/index.js < $ROBOS_DIR/dashboard/src/app/container/index.js )

cat <<EOF > $ROBOS_DIR/dashboard/src/app/container/index.js
$CONTAINER
EOF

mkdir $component
cd $component

# TODO: Create files with content
# (from $DIR to $( pwd ))
# # cat > view.html
# # echo 'content' > index.js
# # echo 'content' > style.scss

touch view.html
touch index.js
touch style.scss

echo ""
echo "🤖 ~> Component ${COMPONENT} created ✅"
echo ""
exit 1
