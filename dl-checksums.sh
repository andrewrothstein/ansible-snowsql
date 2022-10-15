#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap

dl()
{
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    local os=$4
    local arch=$5
    local bundle=$6
    local platform="${os}_${arch}"
    local file="snowsql-${major_ver}.${minor_ver}.${patch_ver}-${platform}.${bundle}"

    # https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash
    local url="${MIRROR}/${major_ver}.${minor_ver}/${platform}/${file}"

    local lfile="${DIR}/${file}"
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    printf "  '%s.%s.%s':\n" $major_ver $minor_ver $patch_ver
    dl $major_ver $minor_ver $patch_ver linux x86_64 bash
    dl $major_ver $minor_ver $patch_ver darwin x86_64 pkg
    dl $major_ver $minor_ver $patch_ver windows x86_64 msi
}

dl_ver 1 2 22
dl_ver 1 2 23
