#!/bin/dash

# 1 = Qemu (VM) PID
# 2 = VM CPUs
# 3 = System CPUs

cd /sys/fs/cgroup/cpuset

change_procs() {
	for proc in $(cat "$1"); do echo "$proc" | tr -d '\n' | doas tee -a "$2" >/dev/null; done
}

if [ "$1" = "0" ]; then
	change_procs "nvm/cgroup.procs" "cgroup.procs"
	change_procs "vm/cgroup.procs" "cgroup.procs"
	sleep 2
	doas rmdir nvm
	doas rmdir vm

	echo "cpu: system on all"
else
	doas mkdir nvm
	echo "$3" | doas tee nvm/cpuset.cpus >/dev/null
	echo "0" | doas tee nvm/cpuset.mems >/dev/null
	change_procs "cgroup.procs" "nvm/cgroup.procs" 2>/dev/null

	doas mkdir vm
	echo "$2" | doas tee vm/cpuset.cpus >/dev/null
	echo "0" | doas tee vm/cpuset.mems >/dev/null
	echo "$1" | doas tee -a vm/cgroup.procs >/dev/null

	echo "cpu: system on $3"
	echo "cpu: vm on $2"
fi
