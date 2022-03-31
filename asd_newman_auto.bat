rem ** start appscan traffic recorer proxy
START "" "C:\Program Files (x86)\HCL\AppScan Standard\AppscanCMD.exe" /scan_template "C:\Users\appscanadmin\Documents\Appscan\apiv2.scant" /d "C:\Users\appscanadmin\Documents\Appscan\apiv7.scan" /to /mmer /opr /lp "3033"

rem ** sleep 60 seconds to allow proxy time to start
timeout /t 60

rem ** kick off newman command to simulate API traffic defined in Postman collection
cd "C:\Samples\postman"
set HTTP_PROXY=127.0.0.1:3033 && newman run altoro_apis.json -e environment.json

rem ** close proxy
"C:\Program Files (x86)\HCL\AppScan Standard\AppscanCMD.exe" cpr