BEGIN {
    printf "%15s %5s\n", "IP", "Latência";
}
{
    printf "%15s %5s\n", $1, $2, LatenciaTotal = LatenciaTotal + $2
}
END {
    printf "\n Latência média: %5s\n", LatenciaTotal / NR;
}
