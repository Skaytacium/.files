#!/bin/dash

# 1 = Hugepages required in GB

allocate() {
	PAGES=$(echo "$1*512" | bc)
	echo "$PAGES" | doas tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages >/dev/null
	echo "huge: allocated: $1G"
}

hclear() {
	doas umount /dev/hugepages
	doas rm -r /dev/hugepages
	echo "huge: unmounted and removed"
}

add() {
	doas mkdir /dev/hugepages
	doas mount -t hugetlbfs none /dev/hugepages

	doas chown root:kvm /dev/hugepages
	doas chmod 770 /dev/hugepages
	echo "huge: created and mounted"
}


if [ "$1" = "0" ]; then
	allocate 0
	hclear
else
	if ! [ -d /dev/hugepages ]; then
		add
	fi
	allocate "$1"
fi
