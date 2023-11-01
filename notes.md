# notes
## Drivers?
### mac
- webcam -> `https://github.com/patjak/facetimehd` -> `/usr/src/facetimehd-0.1` (dkms directory)
	- firmware -> `https://github.com/patjak/facetimehd-firmware/`
    - `make; make install`
- R9 M370X -> `amdgpu` (supports video decode)
- trackpad -> `bcm5974`
- daisy chain boot -> `https://github.com/0xbb/apple_set_os.efi`
- cmdline -> `quiet acpi_osi=Darwin radeon.si_support=0 amdgpu.si_support=1`

### msi
- `https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/iwlwifi-ty*(latest).{ucode, pnvm}` -> `/usr/lib/modules`
- `https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/intel/ibt-0041-0041.{ddc, sfi}` -> `/usr/lib/modules`
- NVRAM detection for boot only works with grub

## Programs?
### mac
- `amdgpu_top`
    ```sh
	cargo install amdgpu_top
    ```
- `jellyfin`
    ```sh
	cd /usr/local/src
	git clone https://github.com/jellyfin/jellyfin
	cd jellyfin
	dotnet publish Jellyfin.Server --configuration Release --self-contained --runtime linux-x64 --output /opt/jellyfin -p:DebugSymbols=false -p:DebugType=none -p:UseAppHost=true
    ```
- `mergerfs-tools`
    ```sh
	cd /usr/local/src
	git clone https://github.com/trapexit/mergerfs-tools
	cd mergerfs-tools
	make install
    ```

### msi
- `OpenTabletDriver`
    ```sh
	cd /
	curl https://api.github.com/repos/OpenTabletDriver/OpenTabletDriver/releases/latest | rg 'browser_download_url.*opentabletdriver-.*tar.gz' | sd '.*: "(.*)"' '$1' | wget -i -
	tar xf opentabletdriver*.tar.gz
	mv opentabletdriver/* .
	rm -r opentabletdriver opentabletdriver*.tar.gz
    ```
### both
- `mpv-mpris`
    ```sh
	cd ~/.config/mpv/scripts
	curl https://api.github.com/repos/hoyon/mpv-mpris/releases/latest | rg 'browser_download_url.*so' | sd '.*: "(.*)"' '$1' | wget -i -
    ```
- `cpufetch`
    ```sh
	cd /usr/local/src
	git clone https://github.com/dr-noob/cpufetch
	cd cpufetch
	make
	make install
    ```
- `shell-color-scripts`
    ```sh
	cd /usr/local/src
	git clone https://gitlab.com/dwt1/shell-color-scripts
	cd shell-color-scripts
	make install
    ```
- `{dwm, dmenu} -> ?`
    ```sh
	cd /usr/local/src
	cd {dwm, dmenu}
	make
	make install
    ```
- `paq-nvim`
    ```sh
	git clone --depth=1 https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
    ```
- `JamesDSP4Linux`
    ```sh
    ```
- `dotnet`
    ```sh
	curl "https://raw.githubusercontent.com/dotnet/install-scripts/main/src/dotnet-install.sh" | bash -s -- -c STS --install-dir /opt/dotnet
    ```
- `ungoogled-chromium`
    ```sh
	cd /opt
	curl https://api.github.com/repos/clickot/ungoogled-chromium-binaries/releases/latest | rg 'browser_download_url.*tar.xz' | sd '.*: "(.*)"' '$1' | wget -i -
	tar xf ungoogled-chromium*.tar.xz
	mv ungoogled-chromium* ungoogled-chromium
    ```
- `rustup-init`
    ```sh
	rustup-init -y --default-host x86_64-unknown-linux-gnu --default-toolchain stable
    ```
- `zsh4humans`
    ```sh
	sh -c "$(curl -fsSL httpsraw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
    ```
- `fisher`
    ```sh
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    ```

## TODO?
1. make xbps src packages
2. make scripts in chezmoi
	1. to copy files
	2. to install non xbps-src packages
	3. to install xbps-src packages
	4. to install other random packages
	5. to setup drivers
	6. whatever other misc stuff remains
