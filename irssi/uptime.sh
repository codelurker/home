#!/bin/bash
uptime | awk '{print "Uptime:",$3,$4,$5,"hrs"}' | tr -d ","
