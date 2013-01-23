#! /bin/bash 

if  [ "$#" != 6 ]
then 
	echo "Usage: $0 {cobbler server host name or IP address} {user name} {password} {cobbler system name} {host name} {boot profile name}"
	exit
fi
cobbler_server=$1
user_name=$2
password=$3
system_name=$4
host_name=$5
profile=$6
get_head () {
echo -e "POST /cobbler_api HTTP/1.1
Host: 10.251.18.11
Accept-Encoding: gzip
User-Agent: Bash xmlrpc client by Yongjun Rong
Content-Type: text/xml
Content-length:$1" 
}  

function get_size () {
   	size=`echo $1 | wc -c`  
	echo ${size//' '/}
} 
 
##$1 is the xml rpc api req xml  
function invoke_xml_rpc () { 
	req_size=$(get_size "$1")
	req_head=$(get_head "$req_size") 
	#Must keep the empty line as below  
	msg="${req_head}\n\n$1"
	post_ret=`echo -e "$msg" | nc $cobbler_server 80`
	echo $post_ret
}

login_req="<?xml version='1.0'?>
<methodCall>
<methodName>login</methodName>
<params>
<param>
<value><string>$user_name</string></value>
</param>
<param>
<value><string>$password</string></value>
</param>
</params>
</methodCall>" 
 
login_ret=$(invoke_xml_rpc "$login_req") 
echo -e $login_ret
login_ret=${login_ret/*<string>/}
token=${login_ret/<\/string>*/}

echo "======Create new system========"
new_system_req="<?xml version='1.0'?>
<methodCall>
<methodName>new_system</methodName>
<params>
<param>
<value><string>$token</string></value>
</param>
</params>
</methodCall>"
echo -e $new_system_req

new_system_ret=$(invoke_xml_rpc "$new_system_req")
new_system_ret=${new_system_ret/*<value><string>/}
new_system_id=${new_system_ret/<\/string><\/value>*/} 

echo "new_system_id====$new_system_id======="

echo "Modifying system with the passed in arguments name=$2 hostname=$3 profile=$4......" 

##$1 is the system id
##$2 is the attribute name like: name, hostname ,profile....can be found from the reomote.py in cobbler codebase
##$3 is the value of the attribute
##$4 is the token
function get_modify_sys_req () {
	modify_sys_req="<?xml version='1.0'?>
<methodCall>
<methodName>modify_system</methodName>
<params>
<param>
<value><string>$1</string></value>
</param>
<param>
<value><string>$2</string></value>
</param>
<param>
<value><string>$3</string></value>
</param>
<param>
<value><string>$4</string></value>
</param>
</params>
</methodCall>"
	echo -e $modify_sys_req
}

modify_sys_name=$(get_modify_sys_req "$new_system_id" "name" "$system_name" "$token") 
echo -e $modify_sys_name
modify_sys_name_ret=$(invoke_xml_rpc "$modify_sys_name") 
modify_name_ret=${modify_sys_name_ret/*<value><boolean>/}
modify_name_success=${modify_name_ret/<\/boolean><\/value>*/}

if [ "$modify_name_success" == "1" ]; then
	modify_sys_host=$(get_modify_sys_req "$new_system_id" "hostname" "$host_name" "$token")
	echo -e $modify_sys_host
	modify_sys_host_ret=$(invoke_xml_rpc "$modify_sys_host")
	modify_host_ret=${modify_sys_host_ret/*<value><boolean>/}
	modify_host_success=${modify_host_ret/<\/boolean><\/value>*/}
	if [ "$modify_host_success" == "1" ]; then
		modify_sys_profile=$(get_modify_sys_req "$new_system_id" "profile" "$profile" "$token")
		echo -e $modify_sys_profile
		modify_sys_profile_ret=$(invoke_xml_rpc "$modify_sys_profile")
		modify_profile_ret=${modify_sys_profile_ret/*<value><boolean>/}
		modify_profile_success=${modify_profile_ret/<\/boolean><\/value>*/} 
		
		if [ "$modify_profile_success" == "1" ]; then 
			save_sys_req="<?xml version='1.0'?>
<methodCall>
<methodName>save_system</methodName>
<params>
<param>
<value><string>$new_system_id</string></value>
</param>
<param>
<value><string>$token</string></value>
</param>
</params>
</methodCall>" 
			save_sys_ret=$(invoke_xml_rpc "$save_sys_req") 
			save_ret=${save_sys_ret/*<value><boolean>/}
			save_success=${save_ret/<\/boolean><\/value>*/}
			
			echo -e $save_sys_ret
			if [ "$save_success" == "1" ]; then
				echo "Created the system successfully with name=$system_name hostname=$host_name and profile=$profile."   			
			fi
				   
		else
			echo -e $modify_sys_profile_ret
		fi
		
	else
		echo -e  $modify_sys_host_ret
	fi   
else
	echo -e $modify_sys_name_ret
fi    
	

 



