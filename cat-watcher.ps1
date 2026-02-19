# Buffer to store recent keystrokes
$buffer = ""

Write-Host "Cat watcher is running... (Press Ctrl+C to stop)"

while ($true) {
    if ([Console]::KeyAvailable) {
        $key = [Console]::ReadKey($true)

        # Only process regular character keys
        if ($key.KeyChar -match '\S') {
            $buffer += $key.KeyChar
        }

        # Keep only last 3 characters
        if ($buffer.Length -gt 3) {
            $buffer = $buffer.Substring($buffer.Length - 3)
        }

        # Check if user typed "cat"
        if ($buffer -eq "cat") {
            for ($i = 0; $i -lt 150; $i++) {
                Write-Output "meow"
            }
            $buffer = ""
        }
    }

    Start-Sleep -Milliseconds 50
}