#!/bin/bash

SRCDIR=$(dirname $(readlink -f "$0"))
OUTDIR=${SRCDIR}/output

export PRODUCT_LANG="es"
export PRODUCT_VERSION=$(git describe --match 'v[0-9]*' --dirty='.m' --always | sed 's/^v//')
export PRODUCT_BUILD=$(date +%F)

# list of products
MANUALS="manual-xlist manual-dns manual-archive manual-event manual-netfilter manual-archiveui"
GUIDES="guide-basic-dns-sinkhole guide-advanced-dns-sinkhole"
GUIDES="$GUIDES guide-basic-dns-rblzone guide-basic-nfqueue-xlist"
GUIDES="$GUIDES guide-basic-dns-whitehole-nfqueue"

PRODUCTS="$MANUALS $GUIDES"

mkdir -p $OUTDIR
for product in $PRODUCTS; do
	echo "Constructing: ${product}"
	pushd ${SRCDIR}/${product} >/dev/null
	./generate.sh
	mv output.pdf ${OUTDIR}/${product}-${PRODUCT_VERSION}_${PRODUCT_LANG}.pdf
	popd >/dev/null
done
