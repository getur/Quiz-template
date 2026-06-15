$json = Get-Content 'c:\Users\getur\OneDrive\Documents\UNICEF\MAZA\Quiz-template\quiz.json' -Raw -Encoding UTF8

# Build the standalone HTML by reading the template and injecting quiz data
$template = Get-Content 'c:\Users\getur\OneDrive\Documents\UNICEF\MAZA\Quiz-template\quiz.html' -Raw -Encoding UTF8

$output = $template.Replace('__QUIZ_DATA_PLACEHOLDER__', $json)
$output | Out-File 'c:\Users\getur\OneDrive\Documents\UNICEF\MAZA\Quiz-template\quiz_standalone.html' -Encoding UTF8

Write-Host "Done! File size: $((Get-Item 'c:\Users\getur\OneDrive\Documents\UNICEF\MAZA\Quiz-template\quiz_standalone.html').Length / 1MB) MB"
