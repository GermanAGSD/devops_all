
:global regex "10\\.0\\.2\\.\\d+/30|10\\.\\d+\\.\\d+\\.0/24";
:if ([:len [/file find name="net-list.txt"]] = 0) do={
    /file add name=net-list.txt
}
/file set net-list.txt contents="";
:foreach i in=[/ip route find where active=yes] do={
    :local dstAddress [/ip route get $i dst-address];
    :if ($dstAddress ~ $regex) do={
        :local currentContents [/file get net-list.txt contents];
        /file set net-list.txt contents=($currentContents . $dstAddress . "\r\n");
    }
}