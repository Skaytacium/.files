#!/bin/dash

set -m
PIPEWIRE_RUNTIME_DIR="/run/user/1000"
PIPEWIRE_LATENCY="256/48000"
CPUS=$(grep -c "^processor" /proc/cpuinfo)


OPTS=""
add() {
	OPTS="$OPTS -$1 "
}
FC=$(echo "$CPUS-1" | bc)
HC=$(echo "$FC/2" | bc)
get_cores() {
	echo "$1/2" | bc
}
get_layout() {
	A=$(echo "$HC-($1/2 - 1)" | bc)
	B=$(echo "$FC-($1/2 - 1)" | bc)
	echo "$A-$HC,$B-$FC"
}
get_sys() {
	A=$(echo "$HC-($1/2)" | bc)
	B=$(echo "$FC-($1/2)" | bc)
	echo "0-$A,$(echo "$CPUS/2" | bc)-$B"
}


# machine
add "machine q35"
add "global ICH9-LPC.disable_s3=1"
add "global ICH9-LPC.disable_s4=1"
add "drive file=/usr/share/edk2-ovmf/OVMF_CODE.secboot.fd,readonly=on,if=pflash,format=raw"
add "drive file=win_vars.fd,if=pflash,format=raw"
add "accel kvm"

# cpu
add "cpu host,hv_vapic,hv_relaxed,hv_spinlocks=0x1fff,hv_vpindex,hv_runtime,hv_synic,hv_stimer,hv_reset,hv_time,hv_vendor_id=12alphanum"
add "smp $1,sockets=1,cores=$(get_cores "$1"),threads=2"

# tpm
add "tpmdev passthrough,id=tpm0,path=/dev/tpm0,cancel-path=/dev/null"
add "device tpm-tis,tpmdev=tpm0"

# hugepages
add "m $2G"
add "mem-path /dev/hugepages"
add "mem-prealloc"

# storage
add "object iothread,id=io0"
add "device virtio-blk-pci,iothread=io0,drive=drive0"
add "drive id=drive0,file=win.disk,if=none,cache=none,aio=threads,format=raw"
# add "drive media=cdrom,file=win.iso"
# add "drive media=cdrom,file=virtio.iso"

# network
add "nic user,ipv6=off,model=virtio-net-pci,mac=52:54:BE:EF:19:11"

# gpu passthrough
add "device vfio-pci,host=01:00.0,multifunction=on,x-vga=on"
add "device vfio-pci,host=01:00.1"
add "nographic"
add "vga none"

# looking glass
add "object memory-backend-file,id=ivshmem,share=on,mem-path=/dev/shm/looking-glass,size=32M"
add "device ivshmem-plain,memdev=ivshmem"

# sound
add "audiodev jack,id=ad0,out.client-name=vm,out.connect-ports=Built-in*"
add "device ich9-intel-hda"
add "device hda-output,audiodev=ad0"

# input
add "object input-linux,id=mouse0,evdev=/dev/input/by-id/usb-Logitech_G502_HERO_Gaming_Mouse_0D8B39663330-event-mouse"
add "object input-linux,id=kbd0,evdev=/dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-kbd,grab_all=on,repeat=on"
add "device qemu-xhci"

# misc
add "nodefaults"
add "rtc clock=host,base=localtime"
add "serial none"
add "parallel none"
add "monitor stdio"


./vfio.sh 1
./huge.sh "$2"
doas chown skay /dev/tpm0

qemu-system-x86_64 $OPTS &
QEMU_PID=$!
./cpu.sh "$QEMU_PID" "$(get_layout "$1")" "$(get_sys "$1")"

looking-glass -s -M &
fg %1
wait $QEMU_PID

doas chown root /dev/tpm0
./vfio.sh
./huge.sh 0
./cpu.sh 0 &
