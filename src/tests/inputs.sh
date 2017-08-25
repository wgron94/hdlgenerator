#!/bin/bash

echo "Running inputs test"
{
   cp parser tests/parser
   cd tests
   ./parser inputs.sm

   #Compare parser outputs to pre written vhd file
   correctOutput=$(<inputsCorrect.vhd)
   programOutput=$(<inputs.vhd)
} &> /dev/null

if [ "$correctOutput" == "$programOutput" ]; then
   echo "Inputs test passed"
else
   echo "Inputs test failed"
fi

