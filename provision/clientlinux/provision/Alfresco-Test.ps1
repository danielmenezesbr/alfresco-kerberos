function test($label, $url, $match) {
    Write-Host $label
    $r = iwr $url -UseDefaultCredentials
    if (-Not ($r.RawContent -match $match)) {
        throw "Failed! Raw: ", $r.RawContent
    }
    Write-Host "OK!"
}

try {
    test "Test Alfresco Home..." http://clientlinux.mshome.net:8080/alfresco "<h1>Welcome to Alfresco</h1>"
    test "Test Alfresco Webdav..." http://clientlinux.mshome.net:8080/alfresco/webdav "Directory listing for /"
    test "Test Alfresco Share..." http://clientlinux.mshome.net:8080/share "Alfresco.constants.USERNAME = `"vagrant`""
} catch {
    $r = $_.Exception
    Write-Host $r
    exit 1
}

exit 0