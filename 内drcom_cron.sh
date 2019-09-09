#!/bin/bash
logger "【Dr.COM网页认证】开始定时检测"
curl http://10.0.251.18 > drcom.html #①
check_status=`grep "Dr.COMWebLoginID_0.htm" drcom.html` #②
if [[ $check_status != "" ]]
then
    #尚未登录
    logger "【Dr.COM网页认证】上网登录窗尚未登录"
    ##此处为你已修改完毕的curl##③
    curl -X POST "http://10.0.251.18:801/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=10.0.251.18&iTermType=1&wlanacip=null&wlanacname=null&mac=00-00-00-00-00-00&enAdvert=0&queryACIP=0&loginMethod=1" -H "Connection: keep-alive" -H "Cache-Control: max-age=0" -H "Origin: http://10.0.251.18" -H "Upgrade-Insecure-Requests: 1" -H "Content-Type: application/x-www-form-urlencoded" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3" -H "Referer: http://10.0.251.18/a37.htm?wlanacip=null&wlanacname=null&vlanid=0&ssid=null&areaID=null&mac=00-00-00-00-00-00" -H "Accept-Encoding: gzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-TW;q=0.6" -H "Cookie: program=2; vlan=0; ssid=null; areaID=null; ISP_select=@xyw; md5_login2=%2C0%2C账号@xyw%7C密码" --data "DDDDD=%2C0%2C账号%40xyw&upass=密码&R1=0&R2=0&R3=0&R6=0&para=00&0MKKey=123456&buttonClicked=&redirect_url=&err_flag=&username=&password=&user=&cmd=&Login=&v6ip=" --insecure
    logger "【Dr.COM网页认证】上网登录窗未登录，现已登录"
else
    #已经登录
    logger "【Dr.COM网页认证】上网登录窗之前已登录"
fi
logger "【Dr.COM网页认证】结束定时检测"