#!/bin/bash

GUIDE_NAME="advanced-dns-sinkhole"
MODULE_DIR="../../../es/modules/guides"

guidename="$GUIDE_NAME"
moduledir=`realpath $MODULE_DIR`
revnumber="${PRODUCT_VERSION:-unknown}"
revdate="${PRODUCT_BUILD:-unknown}"

asciidoctor-pdf -o output.pdf -v --trace -r asciidoctor-diagram \
	-a moduledir=$moduledir -a revnumber=$revnumber -a revdate=$revdate \
	-a guidename=$guidename guide.adoc

## remove temporal files generated
imagesdir=$MODULE_DIR/assets/images/${guidename}
rm ${imagesdir}/${guidename}-deployment.png
rm ${imagesdir}/${guidename}-sequence.png
rm -rf .asciidoctor
