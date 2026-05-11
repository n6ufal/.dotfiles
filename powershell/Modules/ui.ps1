function Show-Greeting {
    $hour = (Get-Date).Hour

    # Single source of truth for time periods
   $timeData = @(
    @{ Range = @(5, 7);   Label = "EARLY MORNING"; Icon = "󰖨"; Color = $teal;   Greeting = "You're up early. Good for you." }
    @{ Range = @(7, 9);   Label = "MORNING";       Icon = "󰖨"; Color = $teal;   Greeting = "Coffee's a good idea." }
    @{ Range = @(9, 11);  Label = "MID-MORNING";   Icon = "󰖨"; Color = $teal;   Greeting = "Good time to be alive, probably." }
    @{ Range = @(11, 13); Label = "NOON";           Icon = "󰖙"; Color = $yellow; Greeting = "Eat something." }
    @{ Range = @(13, 15); Label = "AFTERNOON";      Icon = "󰖙"; Color = $yellow; Greeting = "It happens to everyone." }
    @{ Range = @(15, 17); Label = "LATE AFTERNOON"; Icon = "󰖙"; Color = $yellow; Greeting = "Almost done. Allegedly." }
    @{ Range = @(17, 19); Label = "EARLY EVENING";  Icon = "󰖔"; Color = $blue;   Greeting = "Hey, you made it to evening." }
    @{ Range = @(19, 21); Label = "EVENING";        Icon = "󰖔"; Color = $blue;   Greeting = "Take it easy." }
    @{ Range = @(21, 23); Label = "NIGHT";          Icon = "󰖔"; Color = $red;    Greeting = "Getting late. Just saying." }
    @{ Range = @(23, 24); Label = "LATE NIGHT";     Icon = "󰖔"; Color = $red;    Greeting = "Still up." }
    @{ Range = @(0, 5);   Label = "DEEP NIGHT";     Icon = "󰖔"; Color = $red;    Greeting = "Please sleep." }
)

    # Find matching time period
    $current = $timeData | Where-Object { $hour -ge $_.Range[0] -and $hour -lt $_.Range[1] } | Select-Object -First 1
    if (-not $current) { $current = $timeData[-1] }  # Fallback to last entry

    # Extract values
    $label    = $current.Label
    $icon     = $current.Icon
    $color    = $current.Color
    $greeting = $current.Greeting
    $time     = (Get-Date).ToString("HH:mm")

    # The UI: Minimal and clean
Write-Host "  $color$icon $time$reset  $subtext—  $greeting$reset"
}
