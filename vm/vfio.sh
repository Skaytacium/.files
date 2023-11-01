#!/bin/dash

V_ID="10de"
DOM="0000:01:00."

G_ID="249d"
A_ID="228b"

G_F="0"
A_F="1"


if ! lsmod | grep vfio_pci >/dev/null; then
	doas modprobe vfio-pci
	echo "vfio: inserted vfio-pci"
fi


unbind() {
	echo "$DOM$G_F" | doas tee "/sys/bus/pci/devices/$DOM$G_F/driver/unbind" >/dev/null
	echo "vfio: gpu -> unbound"
	echo "$DOM$A_F" | doas tee "/sys/bus/pci/devices/$DOM$A_F/driver/unbind" >/dev/null
	echo "vfio: audio -> unbound"
}

restore() {
	echo "$DOM$G_F" | doas tee "/sys/bus/pci/drivers/nvidia/bind" >/dev/null
	echo "vfio: gpu -> nvidia"
	echo "$DOM$A_F" | doas tee "/sys/bus/pci/drivers/snd_hda_intel/bind" >/dev/null
	echo "vfio: audio -> snd_hda_intel"
}

add_id() {
	echo "$1 $2" | doas tee "/sys/bus/pci/drivers/vfio-pci/new_id" >/dev/null 2>&1
	echo "vfio: vfio-pci new id: $1:$2"
}

vfio() {
	echo "$DOM$G_F" | doas tee "/sys/bus/pci/drivers/vfio-pci/bind" >/dev/null 2>&1 || add_id "$V_ID" "$G_ID"
	echo "vfio: gpu -> vfio-pci"
	echo "$DOM$A_F" | doas tee "/sys/bus/pci/drivers/vfio-pci/bind" >/dev/null 2>&1 || add_id "$V_ID" "$A_ID"
	echo "vfio: audio -> vfio-pci"
}


if [ "$1" = "1" ]; then
	unbind
	vfio
else
	unbind	
	restore
fi
