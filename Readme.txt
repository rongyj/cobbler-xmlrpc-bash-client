#! /bin/bash

# ping technorati

#set -v

# configuration
ADDRESS="http://10.251.18.11/cobbler_api"
NAME="C[omp]UTE"
# (end of configuration)

export PATH="$PATH:$CUTE_DIR/scripts"

tmp=`mktemp`
echo "<?xml version=\"1.0\"?>
<methodCall>
  <methodName>weblogUpdates.ping</methodName>
  <params>
    <param>
      <value>$NAME</value>
    </param>
    <param>
      <value>$ADDRESS</value>
    </param>
  </params>
</methodCall>" > "$tmp"

size=`cat "$tmp" | wc -c`

msg=`mktemp`
echo "POST /rpc/ping HTTP/1.0
User-Agent: bash script across netcat - andrew@...
Host: rpc.technorati.com
Content-Type: text/xml
Content-length: $size
" > "$msg"

cat "$tmp" >> "$msg"
rm "$tmp"
cat "$msg"
cat "$msg" | nc rpc.technorati.com 80
rm "$msg"
   

echo "<?xml version='1.0'?>
<methodCall>
<methodName>get_profile_handle</methodName>
<params>
<param>
<value><string>HPToolKit</string></value>
</param>
<param>
<value><string>mxSzw/wOtLFKitFJ5tYa0Xce6RkVVMARMg==</string></value>
</param>
</params>
</methodCall>"

=====================================================

#!/bin/bash
 
# ping technorati
 
#set -v
 
# configuration
ADDRESS="http://www.acooke.org/cute"
NAME="C[omp]UTE"
# (end of configuration)
 
export PATH="$PATH:$CUTE_DIR/scripts"
 
tmp=`mktemp`
echo "<?xml version='1.0'?>
<methodCall>
<methodName>login</methodName>
<params>
<param>
<value><string>merlin</string></value>
</param>
<param>
<value><string>swordinthestone</string></value>
</param>
</params>
</methodCall>" > "$tmp"
 
size=`cat "$tmp" | wc -c`
 
msg=`mktemp`
echo "POST /rpc/ping HTTP/1.0
User-Agent: bash script across netcat - andrew@...
Host: rpc.technorati.com
Content-Type: text/xml
Content-length: $size
" > "$msg"
 
cat "$tmp" >> "$msg"
rm "$tmp"
cat "$msg"
cat "$msg" | nc rpc.technorati.com 80
rm "$msg"           


=============  
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 220

<?xml version='1.0'?>
<methodCall>
<methodName>login</methodName>
<params>
<param>
<value><string>merlin</string></value>
</param>
<param>
<value><string>swordinthestone</string></value>
</param>
</params>
</methodCall>


response:
Date: Thu, 17 Jan 2013 20:45:56 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 162
Connection: close

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><string>1U2LwfJDlyEiv1OixMxALL8bDS8iMNqx6Q==</string></value>
</param>
</params>
</methodResponse>

========================

POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 105

<?xml version='1.0'?>
<methodCall>
<methodName>get_systems</methodName>
<params>
</params>
</methodCall>   

=====================
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 257

<?xml version='1.0'?>
<methodCall>
<methodName>get_profile_handle</methodName>
<params>
<param>
<value><string>HPToolKit</string></value>
</param>
<param>
<value><string>mxSzw/wOtLFKitFJ5tYa0Xce6RkVVMARMg==</string></value>
</param>
</params>
</methodCall>          


==================Create new system========================
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 190

<?xml version='1.0'?>
<methodCall>
<methodName>new_system</methodName>
<params>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>

HTTP/1.1 200 OK
Date: Tue, 22 Jan 2013 21:54:10 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 179
Connection: close

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><string>___NEW___system::h1DWJ4gH5j6ySPxmbAm2ElT7UkmGm6OuXw==</string></value>
</param>
</params>
</methodResponse>

================Modify system=======================
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 416

<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>___NEW___system::h1DWJ4gH5j6ySPxmbAm2ElT7UkmGm6OuXw==</string></value>
</param>
<param>
<value><string>profile</string></value>
</param>
<param>
<value><string>OEL_63-x86_64</string></value>
</param>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>


HTTP/1.1 200 OK
Date: Tue, 22 Jan 2013 22:05:50 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 129
Connection: close

POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 416

<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>___NEW___system::+m1h3ng5RgBUUk6YTItlypmoKmLW8FGNCw==</string></value>
</param>
<param>
<value><string>profile</string></value>
</param>
<param>
<value><string>OEL_63-x86_64</string></value>
</param>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>  

HTTP/1.1 200 OK
Date: Tue, 22 Jan 2013 22:10:05 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 129 

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><boolean>1</boolean></value>
</param>
</params>
</methodResponse>


POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 417

<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>___NEW___system::+m1h3ng5RgBUUk6YTItlypmoKmLW8FGNCw==</string></value>
</param>
<param>
<value><string>name</string></value>
</param>
<param>
<value><string>80:c1:6e:6e:aa:00</string></value>
</param>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>


HTTP/1.1 200 OK
Date: Tue, 22 Jan 2013 22:10:10 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 129
Connection: close

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><boolean>1</boolean></value>
</param>
</params>
</methodResponse>



POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 420

<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>___NEW___system::+m1h3ng5RgBUUk6YTItlypmoKmLW8FGNCw==</string></value>
</param>
<param>
<value><string>hostname</string></value>
</param>
<param>
<value><string>ccpmer-phl-a00-t</string></value>
</param>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>

?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><boolean>1</boolean></value>
</param>
</params>
</methodResponse>

====================save system============================
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 294

<?xml version='1.0'?>
<methodCall>
<methodName>save_system</methodName>
<params>
<param>
<value><string>___NEW___system::+m1h3ng5RgBUUk6YTItlypmoKmLW8FGNCw==</string></value>
</param>
<param>
<value><string>fen9tR/Eqhhob8UQS4GvsoJkRuO8LBlTWQ==</string></value>
</param>
</params>
</methodCall>

HTTP/1.1 200 OK
Date: Tue, 22 Jan 2013 22:11:31 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 129
Connection: close

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><boolean>1</boolean></value>
</param>
</params>
</methodResponse>
Connection: close   

=================Modify mac address=======================
POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: xmlrpclib.py/1.0.1 (by www.pythonware.com)
Content-Type: text/xml
Content-Length: 483

<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>system::80:c1:6e:6e:aa:00</string></value>
</param>
<param>
<value><string>modify_interface</string></value>
</param>
<param>
<value><struct>
<member>
<name>macaddress-eth0</name>
<value><string>80:c1:6e:6e:aa:bb</string></value>
</member>
</struct></value>
</param>
<param>
<value><string>dNSi3E/NJ7fa8eZIwgYCiu+uge4oAG4omg==</string></value>
</param>
</params>
</methodCall>

 
HTTP/1.1 200 OK
Date: Wed, 23 Jan 2013 17:53:55 GMT
Server: BaseHTTP/0.3 Python/2.6.6
Content-type: text/xml
Content-length: 129
Connection: close

<?xml version='1.0'?>
<methodResponse>
<params>
<param>
<value><boolean>1</boolean></value>
</param>
</params>
</methodResponse>