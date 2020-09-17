function test($label, $url, $match) {
    Write-Host $label
    $r = iwr $url -UseDefaultCredentials
    if (-Not ($r.RawContent -match $match)) {
        throw "Failed! Raw: ", $r.RawContent
    }
    Write-Host "OK!"
}

try {
    test "Test debugKerberos..." http://clientlinux.mshome.net:8001/debugKerberos/secure/ "Remote user: vagrant"
} catch {
    $r = $_.Exception
    Write-Host $r
    exit 1
}

exit 0