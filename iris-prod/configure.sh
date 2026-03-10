cat << EOF | iris session iris -U %SYS

do ##class(%SYSTEM.CSP).SetConfig("CSPConfigName","$HOSTNAME")

halt
EOF