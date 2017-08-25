#!/bin/bash

echo "Running input/output test"
{
   cp parser tests/parser
   cd tests
   ./parser inout.sm

   #Compare parser outputs to pre written vhd file
   correctOutput=$(<inoutCorrect.vhd)
   programOutput=$(<inout.vhd)
} &> /dev/null

if [ "$correctOutput" == "$programOutput" ]; then
   echo "Inout test passed"
else
   echo "Inout test failed"
fi

