#!/bin/bash

soma() {
    echo $(( $1 + $2 ))
    return 0
}

V=$(soma 15 20)
echo "A soma de 15 e 20 é $V"
