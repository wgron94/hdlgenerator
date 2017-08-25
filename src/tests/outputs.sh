#!/bin/bash

echo "Running outputs test"
{
   cp parser tests/parser
   cd tests
   ./parser outputs.sm

   #Compare parser outputs to pre written vhd file
   correctOutput=$(<outputsCorrect.vhd)
   programOutput=$(<outputs.vhd)
} &> /dev/null

if [ "$correctOutput" == "$programOutput" ]; then
   echo "Outputs test passed"
else
   echo "Outputs test failed"
fi

