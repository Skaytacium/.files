# notes
## Drivers?
### mac
- cmdline: `quiet acpi_osi=Darwin`
- chainlod: `efibootmgr -c -L setos -l "/EFI/custom/apple_set_os.efi"`

### msi
- `https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/iwlwifi-ty*(latest).{ucode, pnvm}` -> `/usr/lib/modules`
- `https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/intel/ibt-0041-0041.{ddc, sfi}` -> `/usr/lib/modules`
- NVRAM detection for boot only works with grub

## Programs?
### mac
- apple\_set\_os
    ```sh
    mkdir /boot/efi/EFI/custom
    cd /boot/efi/EFI/custom
    wget -O apple_set_os.efi "https://github.com/0xbb/apple_set_os.efi/releases/download/v1/apple_set_os.efi"
    ```
- facetimehd-firmware
    ```sh
    cd /usr/local/src
    git clone https://github.com/patjak/facetimehd-firmware
    cd facetimehd-firmware
    make
    make install
    ```
- facetimehd
    ```sh
    cd /usr/src
    git clone https://github.com/patjak/facetimehd facetimehd-0.1
    cd facetimehd-0.1
    make
    make install
    ```
- Jellyfin -> dotnet
    ```sh
	cd /usr/local/src
	git clone --depth 1 https://github.com/jellyfin/jellyfin
	cd jellyfin
    DOTNET_CLI_TELEMETRY_OUTPUT=1 /opt/dotnet/dotnet publish Jellyfin.Server --configuration Release --self-contained --runtime linux-x64 --output /opt/jellyfin -p:DebugSymbols=false -p:DebugType=none -p:UseAppHost=true
    ```
- Radarr -> dotnet
    ```sh
    cd /opt
    wget -O radarr "https://radarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64"
    tar xf radarr
    rm radarr
    ```
- Sonarr -> dotnet
    ```sh
    cd /opt
    wget -O sonarr "https://services.sonarr.tv/v1/download/develop/latest?version=4&os=linux"
    tar xf sonarr
    rm sonarr
    ```
- Prowlarr -> dotnet
    ```sh
    cd /opt
    curl https://api.github.com/repos/Prowlarr/Prowlarr/releases/latest | rg 'browser_download_url.*linux-core-x64\.tar\.gz' | sd '.*: "(.*)"' '$1' | wget -O prowlarr -i -
    tar xf prowlarr
    rm prowlarr
    ```
- Bazarr
    ```sh
    cd /opt
    wget -O bazarr "https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip"
    unzip bazarr -d Bazarr
    rm bazarr
    ```
- homepage
    ```
    ```
- LibreSpeed
    ```
    ```
- Filestash
    - Source code modification required in server/plugin/plg_starter_http/index.go to bind to 127.0.0.1
    ```sh
    cd /usr/local/src
    git clone --depth 1 https://github.com/mickael-kerjean/filestash
    cd filestash
    pnpm i
    NODE_ENV=production npm run build
    go generate -x ./server/...
    go build -v -ldflags='-extldflags "-lz -lsharpyuv"' -o dist/filestash cmd/main.go
    cp config/config.json ./dist/data/state/config/
    cp -r dist /opt/filestash
    ```
- VueTorrent
    ```sh
    git clone --single-branch --branch nightly-release https://github.com/VueTorrent/VueTorrent.git /opt/VueTorrent
    ```
- CyberChef
    ```sh
    cd /opt
    mkdir CyberChef
    cp CyberChef
    curl https://api.github.com/repos/gchq/CyberChef/releases/latest | rg 'browser_download_url.*CyberChef.*\.zip' | sd '.*: "(.*)"' '$1' | wget -O CyberChef -i -
    unzip cyberchef
    rm cyberchef
    fd -e txt -x rm
    ```
- Grocy
    ```sh
    cd /opt
    mkdir Grocy
    wget -O grocy https://releases.grocy.info/latest
    unzip grocy -d Grocy
    rm grocy
    ```
- TheLounge
    ```sh
    cd /opt
    git clone --depth 1 https://github.com/thelounge/thelounge
    cd thelounge
    yarn install
    NODE_ENV=production yarn build
    yarn start
    ```
- OpenBooks
    ```sh
    ```
- Prometheus
    ```
    ```
- node_exporter -> Prometheus
    ```
    ```
- Grafana
    ```
    ```
- Technitium DNS -> dotnet
    ```sh
    cd /opt
    mkdir Technitium
    cd Technitium
    wget https://download.technitium.com/dns/DnsServerPortable.tar.gz
    rm DnsServerPortable.tar.gz
    ```
- mergerfs-tools
    ```sh
	cd /usr/local/src
	git clone https://github.com/trapexit/mergerfs-tools
	cd mergerfs-tools
	make install
    ```
<!-- - Vikunja -->
<!--     ``` -->
<!--     ``` -->
- CouchDB
    ```sh
    git clone https://github.com/apache/couchdb
    ./configure --disable-spidermonkey --disable-docs --js-engine=quickjs
    mv rel/couchdb /opt
    ```
- Deno
    ```sh
    curl -fsSL https://deno.land/install.sh | sh
    ```j
### msi
- OpenTabletDriver -> dotnet
    ```sh
	cd /opt
	curl https://api.github.com/repos/OpenTabletDriver/OpenTabletDriver/releases/latest | rg 'browser_download_url.*opentabletdriver-.*tar\.gz' | sd '.*: "(.*)"' '$1' | wget -i -O otdarchive -
	tar xf opentabletdriver*.tar.gz
	mv opentabletdriver/* .
	rm -r opentabletdriver opentabletdriver*.tar.gz
    ```
### both
- jedi-language-server
    ```sh
    python3 -m pip install jedi-language-server --break-system-packages
    ```
- zsh4humans
    ```sh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
    ```
- paq-nvim
    ```sh
	git clone --depth=1 https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
    ```
- shell-color-scripts
    ```sh
	cd /usr/local/src
	git clone https://gitlab.com/dwt1/shell-color-scripts
	cd shell-color-scripts
	make install
    ```
- dotnet
    ```sh
	curl "https://raw.githubusercontent.com/dotnet/install-scripts/main/src/dotnet-install.sh" | bash -s -- -c LTS --install-dir /opt/dotnet
    ```
- {dwm, dmenu}
    ```sh
	cd /usr/local/src
	cd {dwm, dmenu}
	make
	make install
    ```
- JamesDSP4Linux
    ```sh
    git clone --depth 1 --recursive https://github.com/Audio4Linux/JDSP4Linux
    cd JDSP4Linux
    mkdir build
    cd build
    qmake ../JDSP4Linux.pro
    make -j8
    mv src/ /opt/JDSP4
    ln -s /opt/JDSP4/jamesdsp /usr/local/bin/jamesdsp
    ```
- ungoogled-chromium
    ```sh
	cd /opt
	curl https://api.github.com/repos/clickot/ungoogled-chromium-binaries/releases/latest | rg 'browser_download_url.*tar.xz' | sd '.*: "(.*)"' '$1' | wget -i -O ucarc -
	tar xf ucarc
	mv ungoogled-chromium* ungoogled-chromium
    ```
- rustup-init
    ```sh
	rustup-init -y --default-host x86_64-unknown-linux-gnu --default-toolchain stable
    ```
- mpv-mpris
    ```sh
	cd ~/.config/mpv/scripts
	curl https://api.github.com/repos/hoyon/mpv-mpris/releases/latest | rg 'browser_download_url.*so' | sd '.*: "(.*)"' '$1' | wget -i -
    ```
- asdf
    ```sh
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
    ```
- CoreFreq
    ```sh
    cd /usr/local/src
    git clone --depth 1 https://github.com/cyring/CoreFreq
    make -j8
    make install
    rm -r /usr/lib/systemd
    ```
    to run:
    ```sh
    insmod /usr/local/src/CoreFreq/corefreqk.ko; corefreqd &; corefreq-cli
    ```
- cpufetch
    ```sh
	cd /usr/local/src
	git clone --depth 1 https://github.com/dr-noob/cpufetch
	cd cpufetch
	make
	make install
    ```
- fisher
    ```sh
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    ```
- pipewire, pipewire-pulse, alsa-pipewire
    ```sh
	mkdir -p /etc/pipewire/pipewire.conf.d
    ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
    # don't use pulseaudio
    # ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
    mkdir -p /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
    ```

## TODO?
1. make xbps src packages
2. make scripts in chezmoi
	1. ~~to copy files~~
	2. to install non xbps-src packages
	3. to install xbps-src packages
	4. to setup drivers
	5. whatever other misc stuff remains
