#!/bin/bash

MEMORY=2G
SMP=1

while getopts ":smp:memory" opt;
do
    case $opt in
        -smp )
            SMP="$OPTARG"
            shift 2
            ;;
        -memory )
            MEMORY="$OPTARG"
            shift 2
            ;;
        *)
            echo "Unexpected option: $opt"
            ;;
    esac
done

CMD="qemu-system-x86_64 -machine accel=kvm,type=q35 \
                   -smp ${SMP} \
                   -m ${MEMORY} \
                   -enable-kvm \
                   -nographic \
                   -device virtio-net-pci,netdev=net0 \
                   -netdev user,id=net0,hostfwd=tcp::2222-:22 \
                   -netdev bridge,id=en0,br=virbr0 \
                   -device virtio-net-pci,netdev=en0 \
                   -drive if=virtio,format=qcow2,file=ubuntu-cloud.img \
                   -drive if=virtio,format=raw,file=seed.img"

echo "$CMD"

$CMD

# qemu-system-x86_64 -drive if=virtio,format=qcow2,file=ubuntu-cloud.img \
#                    -drive if=virtio,format=raw,file=seed.img \
#                    -device rtl8139,netdev=net0 \
#                    -enable-kvm \
#                    -m 2G \
#                    -netdev user,id=net0 \
#                    -serial mon:stdio \
#                    -smp 2 \
#                    -nographic
