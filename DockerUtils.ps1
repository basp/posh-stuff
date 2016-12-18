function ql { $args }
function qs { "$args" }

function Get-DockerImage {
    $cols = ql ID Repository Tag CreatedAt Size
    $fmt = ($cols | foreach-object { "{{.$_}}" }) -join ","
    docker images --format $fmt  | convertfrom-csv -header $cols
}

function Get-DockerContainer {
    param([switch] $a)
    $cols = ql ID Names Image Command CreatedAt Status Size Ports Labels
    $fmt = ($cols | foreach-object { "{{.$_}}" }) -join ","
    docker ps -a --format $fmt | convertfrom-csv -header $cols
}

function Remove-DockerContainer {
    param($ID)
    docker rm $ID
}