BEGIN { 
    print "Hello, world!\n"
    N = 0;    
}
    
    $2 == "Francisco" {
        print $1;
        N = N + 1;
    }
    
END { 
    print "Goodbye, world!\n" 
    print N;
}
