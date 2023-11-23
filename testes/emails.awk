BEGIN {

}
{
    NOME=$2
    EMAIL=$NF
    np = substr(NOME, np, 1)
    ne = substr(EMAIL, ne, 1)
    if (np == toupper(ne)) {
        print 
        count += 1
    }
}
END {
    print "Total de emails com inicial do nome igual a inicial do email: " count
}
