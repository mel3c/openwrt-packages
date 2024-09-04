### openwrt-packages

> https://github.com/kenzok8/openwrt-packages  
> https://github.com/kenzok8/small-package

* 服务列表
```
luci-app-accesscontrol          # 访问时间控制
luci-app-adbyby-plus            # 广告屏蔽大师Plus +
luci-app-ahcp                   # Ad-Hoc配置协议(AHCP) ipv6 and 双栈 自动配置协议
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
luci-app-openclash              # 你懂的那只猫
luci-app-qos                    # 流量服务质量(QoS)流控
luci-app-ramfree                # 释放内存
luci-app-samba4                 # 网络共享（samba）
luci-app-socat                  # 端口转发
luci-app-ttyd                   # 网页终端命令行
luci-app-turboacc               # LuCI support for Flow Offload / Shortcut-FE
luci-app-udpxy                  # udpxy 做组播服务器
luci-app-upnp                   # 通用即插即用 UPnP(端口自动转发)
luci-app-vsftpd                 # FTP 服务器
luci-app-watchcat               # 断网检测功能与定时重启
luci-app-webadmin               # Web管理页面设置
luci-app-wrtbwmon               # 实时流量监测
```

* 工具类

```
Utilities --> disc --> gdisk #GBT分区工具
Utilities --> disc --> lsblk #列出磁盘设备及分区查看工具
Utilities --> Editors --> vim # vim 编辑器
Utilities --> Shells --> bash #命令解释程序
Utilities --> acpid  #电源管理接口（适用于x86平台）
Utilities --> docker-compose
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

* 待确认

```
luci-proto-relay // 中继桥
```

### 本地构建
```
./scripts/feeds clean
./scripts/feeds update -a
./scripts/feeds install -a

rm -rf ./tmp && rm -rf .config
make menuconfig

./scripts/diffconfig.sh > diff.config // 差异化配置生成
```

#### 制作 docker 镜像
```
 docker import openwrt-x86-64-generic-rootfs.tar.gz gaozhenhai/dros:v2
```

#### 基于 docker 运行
```
docker run -d --privileged --cap-add=NET_ADMIN --network host gaozhenhai/dros:v1
// login
root / password
```

#### 制作启动U盘
```
sudo dd if=./openwrt-x64-R23.4.1-squashfs-combined-efi.img of=/dev/disk2 bs=1m
```
