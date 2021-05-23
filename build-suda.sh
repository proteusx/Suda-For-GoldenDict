#!/bin/bash

TLG_CDROM=/usr/local/proteus/CDROMS/tlg/
SUDA_TLG_ID="-a 9010 -b 001"

TLG2U_PROG=/usr/local/bin/tlg2u
PARAMS="-P -d $TLG_CDROM -c tlg -B 0 -T 89 -M 0 $SUDA_TLG_ID"

$TLG2U_PROG $PARAMS > tmp.utf
sed -i 's/\ *$//' tmp.utf         # Remove trailling spaces
patch tmp.utf suda.patch &> /dev/null

./suda.pl > ./suda-body

# The header includes the UTF-8 BOM
# Without BOM GoldenDict will not see the file
cat ./suda-header ./suda-body > ./dictionary/suda.dsl
rm ./suda-body ./tmp.utf
