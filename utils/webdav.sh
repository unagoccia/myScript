PROXY="xxxxxxx"
USER="xxxxxxx"
PASS="xxxxxxx"
SERVER="xxxxxxx"
DIST_DIR="xxxxxxx"
TMP_SHELL_FILE="webdavTmp.sh"

echo '
    set http:proxy '${PROXY}'
    set http:authorization '${USER}':'${PASS}'
    open '${SERVER}'
    lcd '${DIST_DIR}'
    mirror -v --only-newer -X .DAV/
    close
    quit
' > ${TMP_SHELL_FILE}

lftp -f ${TMP_SHELL_FILE}

rm -rf ${TMP_SHELL_FILE}
