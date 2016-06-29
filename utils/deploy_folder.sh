currentDir=`pwd dirname $0`
distArchiveRemoteDir=xxxxxx
decompressionRemoteDir=xxxxx
remoteHost="xxxxxx"
srcRootDir=~/xxxxxxx
srcDir="xxxxxxx"
tmpShellFile="deployTmp.sh"

## create archive.
cd $srcRootDir
svn update
rev=`LC_ALL=en_US.UTF8 svn info | grep 'Revision:' | grep -o '[0-9].*'`
archive="xxxxxxx_r${rev}.tar.gz"
tar cfz ${archive} ${srcDir}
mv ${archive} ${currentDir}/${archive}

## deploy archive.
cd ${currentDir}
scp ${archive} ${remoteHost}:${distArchiveRemoteDir}
rm -rf ${archive}

## remote run command.
echo '
    rm -rf '${decompressionRemoteDir}/${srcDir}'
    tar zxf '${distArchiveRemoteDir}/${archive}' -C '${decompressionRemoteDir}'
    chown -R root:root '${decompressionRemoteDir}/${srcDir}'
' > ${tmpShellFile}

ssh ${remoteHost} 'bash -s' < ${tmpShellFile}

rm -rf ${tmpShellFile}
