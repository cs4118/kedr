#!/bin/sh

if ! grep nokaslr /proc/cmdline > /dev/null; then
	if ! [ -f /etc/default/grub ]; then
		echo '##########################################################'
		echo '# Please ensure kASLR is disabled for correct operation. #'
		echo '##########################################################'
	else
		if ! grep 'GRUB_CMDLINE_LINUX_DEFAULT.*nokaslr' /etc/default/grub > /dev/null; then
			echo "Setting kernel boot parameter to disable kASLR..."
			sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"/GRUB_CMDLINE_LINUX_DEFAULT=\"nokaslr /g' /etc/default/grub && update-grub
		fi
		echo '######################################'
		echo '# Please reboot to complete install. #'
		echo '######################################'
	fi
fi
