### openwrt-packages

> https://github.com/kenzok8/openwrt-packages  
> https://github.com/kenzok8/small-package

* 默认开启

```
luci-app-accesscontrol          # 上网时间控制
luci-app-adbyby-plus            # 广告屏蔽大师 Plus+
luci-app-arpbind                # IP/MAC 绑定
luci-app-autoreboot             # 计划重启
luci-app-ddns                   # 动态域名解析 --
luci-app-diskman                # 磁盘管理工具
luci-app-filetransfer           # 上传文件功能
luci-app-firewall               # 防火墙和端口转发,必备
luci-app-ipsec-vpnd             # --
luci-app-nlbwmon                # 网络带宽监视器
luci-app-samba4                 # 网络共享（samba）
luci-app-ttyd                   # 网页终端命令行
luci-app-turboacc               # LuCI support for Flow Offload / Shortcut-FE
luci-app-unblockmusic           # LuCI support for Unblock NeteaseCloudMusic
luci-app-upnp                   # 通用即插即用 UPnP(端口自动转发)
luci-app-vlmcsd                 # KMS 服务器（WIN 激活工具）
luci-app-vsftpd                 # FTP 服务器
luci-app-wireguard              # VPN 服务器 WireGuard 状态 --
luci-app-wol                    # 网络唤醒
luci-app-xlnetacc               # 迅雷快鸟 --
luci-app-zerotier               # 虚拟局域网
```

* 手动开启
```
luci-app-acme                   # 证书申请
luci-app-advanced-reboot        # 高级重启
luci-app-aliyundrive-webdav     # aliyundrive-webdav
luci-app-aliddns                # 阿里DDNS客户端
luci-app-argon-config           # Argon主题设置
luci-app-adguardhome            # 广告过滤
luci-app-docker                 # docker-ce
luci-app-dockerman              # Docker Manager
luci-app-e2guardian             # Web内容过滤器
luci-app-eqos                   # 根据IP控制网速
luci-app-easymesh               # mesh 组网
luci-app-guest-wifi             # WiFi访客网络
luci-app-hd-idle                # 硬盘休眠
luci-app-mwan3                  # MWAN3分流助手
luci-app-mwan3helper            # MWAN3 Helpe
luci-app-mail                   # 邮件设置
luci-app-oaf                    # 应用过滤神器
luci-app-openclash              # 你懂的那只猫
luci-app-omcproxy               # 组播代理，用于iptv
luci-app-pushbot                #
luci-app-pppoe-relay            # PPPoE NAT穿透 点对点协议(PPP) ???
luci-app-qos                    # 流量服务质量(QoS)流控
luci-app-ramfree                # 释放内存
luci-app-rp-pppoe-server        # Roaring Penguin PPPoE Server 服务器 ???
luci-app-statistics             # 流量监控工具
luci-app-socat                  # 端口转发
luci-app-serverchan             # 企业微信推送通知
luci-app-smartdns               # dns
luci-app-udpxy                  # udpxy 做组播服务器
luci-app-uhttpd                 # uHTTPd Web服务器
luci-app-vnstat                 # vnStat网络监控(图表)
luci-app-watchcat               # 断网检测功能与定时重启
luci-app-wrtbwmon               # 实时流量监测
luci-app-wifischedule           # WiFi计划
```

* 工具类

```
Utilities --> acpid  #电源管理接口（适用于x86平台）
Utilities --> Editors --> vim-full # vim 编辑器
Utilities --> Shells --> bash #命令解释程序
Utilities --> disc --> gdisk #GBT分区工具
Utilities --> disc --> lsblk #列出磁盘设备及分区查看工具
Extra packages ---> ipv6helper （勾选此项即可，下面几项自动勾选）
```

#### on docker

```
docker run --privileged --network host -d -v /data/router:/opt gaozhenhai/lede-router:v1
```
