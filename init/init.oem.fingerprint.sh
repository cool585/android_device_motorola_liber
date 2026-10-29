#!/vendor/bin/sh
#
# Identify fingerprint sensor model
#
# Copyright (c) 2019 Lenovo
# All rights reserved.
#
# Changed Log:
# ---------------------------------
# April 15, 2019  chengql2@lenovo.com  Initial version
# April 28, 2019  chengql2  Add fps_id creating step
# December 2, 2019  chengql2  Store fps_id into persist fs, and identify sensor
#                             again when secure unit boots as factory mode.

script_name=${0##*/}
script_name=${script_name%.*}
function log {
    echo "$script_name: $*" > /dev/kmsg
}

persist_fps_id=/mnt/vendor/persist/fps/vendor_id

FPS_VENDOR_GOODIX=goodix
FPS_VENDOR_FPC=fpc
FPS_VENDOR_NONE=none

PROP_FPS_IDENT=vendor.hw.fps.ident
MAX_TIMES=20

function load_goodix {
    log "- prepare Goodix driver"
    if [ -d /sys/bus/platform/drivers/fpc1020/soc:fpc_fpc1020 ]; then
        log "- unbind fpc platform device"
        echo soc:fpc_fpc1020 > /sys/bus/platform/drivers/fpc1020/unbind 2>/dev/null
    fi
    if [ ! -d /sys/bus/platform/drivers/goodix_fp/soc:goodix_fingerprint ]; then
        log "- bind goodix platform device"
        echo soc:goodix_fingerprint > /sys/bus/platform/drivers/goodix_fp/bind 2>/dev/null
    fi
    insmod /vendor/lib/modules/goodix_fod_mmi.ko 2>/dev/null
}

function load_fpc {
    log "- prepare FPC driver"
    if [ -d /sys/bus/platform/drivers/goodix_fp/soc:goodix_fingerprint ]; then
        log "- unbind goodix platform device"
        echo soc:goodix_fingerprint > /sys/bus/platform/drivers/goodix_fp/unbind 2>/dev/null
    fi
    if [ ! -d /sys/bus/platform/drivers/fpc1020/soc:fpc_fpc1020 ]; then
        log "- bind fpc platform device"
        echo soc:fpc_fpc1020 > /sys/bus/platform/drivers/fpc1020/bind 2>/dev/null
    fi
    insmod /vendor/lib/modules/fpc1020_mmi.ko 2>/dev/null
}

function ident_fps {
    load_goodix
    sleep 0.5
    log "- identify Goodix sensor"
    setprop $PROP_FPS_IDENT ""
    start gf_ident
    for i in $(seq 1 $MAX_TIMES)
    do
        sleep 0.1
        ident_status=$(getprop $PROP_FPS_IDENT)
        log "-result : $ident_status"
        if [ "$ident_status" == "$FPS_VENDOR_GOODIX" ]; then
            log "ok"
            echo $FPS_VENDOR_GOODIX > $persist_fps_id
            return 0
        elif [ "$ident_status" == "$FPS_VENDOR_NONE" ]; then
            log "fail"
            break
        fi
    done

    load_fpc
    echo $FPS_VENDOR_FPC > $persist_fps_id
    return 0
}

if [ ! -f $persist_fps_id ]; then
    ident_fps
    return $?
fi

fps_vendor=$(cat $persist_fps_id)
log "FPS vendor: $fps_vendor"

if [ "$fps_vendor" == "$FPS_VENDOR_GOODIX" ]; then
    load_goodix
    return $?
fi

if [ "$fps_vendor" == "$FPS_VENDOR_FPC" ]; then
    load_fpc
    return $?
fi

ident_fps
return $?
