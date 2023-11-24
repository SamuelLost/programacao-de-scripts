#!/bin/bash
uptime | cut -d ' ' -f4

who | wc -l # Conta as linhas do comando who
