$json = Get-Content 'c:\Users\getur\OneDrive\Documents\UNICEF\MAZA\Quiz-template\quiz.json' -Raw | ConvertFrom-Json
foreach ($question in $json.questions) {
    Write-Host "Q$($question.id): correctCardIds=$($question.correctCardIds)"
    foreach ($card in $question.cards) {
        Write-Host "  Card $($card.id): $($card.title.Substring(0, [Math]::Min(60, $card.title.Length)))"
    }
}
