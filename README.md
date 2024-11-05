### openwrt-packages

> https://github.com/kenzok8/openwrt-packages
> https://github.com/kenzok8/small-package

* 服务列表
```
luci-app-accesscontrol          # 访问时间控制
luci-app-arpbind                # IP/MAC 绑定
luci-app-autoreboot             # 计划重启
luci-app-diskman                # 磁盘管理工具
luci-app-dockerman              # Docker Manager
luci-app-eqos                   # 根据IP控制网速
luci-app-filetransfer           # 上传文件功能
luci-app-firewall               # 防火墙和端口转发,必备
luci-app-netdata                # Netdata实时监控（图表）,选中openclash才会显示出来
luci-app-nlbwmon                # 网络带宽监视器
luci-app-oaf                    # 应用过滤神器
luci-app-omcproxy               # 组播代理，用于iptv
luci-app-qos                    # 流量服务质量(QoS)流控
luci-app-ramfree                # 释放内存
luci-app-samba4                 # 网络共享（samba）
luci-app-socat                  # 端口转发
luci-app-ttyd                   # 网页终端命令行
luci-app-turboacc               # LuCI support for Flow Offload / Shortcut-FE
luci-app-udpxy                  # udpxy 做组播服务器
luci-app-upnp                   # 通用即插即用 UPnP(端口自动转发)
luci-app-vsftpd                 # FTP 服务器
luci-app-webadmin               # Web管理页面设置
luci-app-wrtbwmon               # 实时流量监测
```

* 工具类

```
Utilities --> disc --> cfdisk #GBT分区工具
Utilities --> disc --> lsblk #列出磁盘设备及分区查看工具
Utilities --> Editors --> vim # vim 编辑器
Utilities --> Shells --> bash #命令解释程序
Utilities --> acpid  #电源管理接口（适用于x86平台）
Extra packages ---> ipv6helper （勾选此项即可，下面几项自动勾选）
```

* 开启无线功能

```
Firmware--iwlwifi-firmware-ax210
Kernel modules--Wireless Drivers--kmod-iwlwifi

Network--WirelessAPD--hostapd
Network--WirelessAPD--wpa-supplicant
Network--WirelessAPD--wpa-cli

Base system--rpcd-mod-iwinfo
Base system--wireless-tools
```

### 本地构建
```
$ docker run --rm -ti gaozhenhai/lede-base:v1 bash
$ su - openwrt
$ cd /home/openwrt/lede/

$ sed -i "/luci/i\src-git mel3c https://github.com/mel3c/openwrt-packages" feeds.conf.default
$ sed -i '1s/coolsnowwolf\/packages/mel3c\/packages;20230906/' feeds.conf.default
$ sed -i 's/coolsnowwolf\/luci/mel3c\/luci;20240630/g' feeds.conf.default

$ ./scripts/feeds clean
$ ./scripts/feeds update -a
$ ./scripts/feeds install -a

$ rm -rf ./tmp && rm -rf .config
$ cp custom-config ./.config   // 加载已有配置
$ make menuconfig

$ ./scripts/diffconfig.sh > diff.config // 差异化配置生成
```

#### 制作 docker 镜像
```
docker import openwrt-x86-64-generic-rootfs.tar.gz gaozhenhai/dros:v2
```

#### 基于 docker 运行
```
docker run -d --privileged --cap-add=NET_ADMIN --network host gaozhenhai/dros:v2 /sbin/init
// login
root / password
```

#### 制作启动U盘
```
sudo dd if=./openwrt-x64-R23.4.1-squashfs-combined-efi.img of=/dev/disk2 bs=1m
```

### ttyd 设置 SSL 证书
```
vi /etc/config/ttyd

config ttyd
    option interface '@lan'
    option command '/bin/login'
    option port '17681'  // 指定端口
    option ssl '1'
    option ssl_cert '/mnt/sda3/ssl/ttyd/server.crt'
    option ssl_key '/mnt/sda3/ssl/ttyd/server.key'

/etc/init.d/ttyd restart  // 重启 ttyd 服务
```

### netdata 监控组件设置 SSL 证书
```
vi /etc/netdata/netdata.conf

[web]
    ssl key = /mnt/sda3/ssl/ttyd/server.key
    ssl certificate = /mnt/sda3/ssl/ttyd/server.crt
    tls version = 1.3
    tls ciphers = TLS13-AES-128-GCM-SHA256:TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:TLS13-AES-128-CCM-8-SHA256:TLS13-AES-128-CCM-SHA256:EECDH+CHACHA20:EECDH
    default port = 29999  // 指定端口

service netdata restart  // 重启服务
```

#### 遗留问题
* wifi 开启中继后不能获取上游 IP 地址的问题

