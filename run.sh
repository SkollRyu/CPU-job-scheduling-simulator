#!/bin/bash

# input generator like inputk.in

# Input generate 
# java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment1/input_parameters.prp experiment1/inputs.in

# # Run simulation
# java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/simulator_parameters.prp experiment1/output.out experiment1/inputs.in

# # generate files for experiment1, 2, 3
# for (( i = 1; i <= 3; i++ ))      ### Outer for loop ###
# do

#     for (( j = 1 ; j <= 10; j++ )) ### Inner for loop ###
#     do
#         java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment{$i}/input_parameters.prp experiment1/inputs.in
#     done

#   echo "" #### print the new line ###
# done

for i in {1..10}
do
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment1/input_parameters.prp experiment1/inputs/inputs${i}.in
    # java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment2/input_parameters.prp experiment2/inputs/inputs${i}.in
    # java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment3/input_parameters.prp experiment3/inputs/inputs${i}.in
done

for i in {1..10}
do
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/simulator_parameters.prp experiment1/output/output${i}.out experiment1/inputs/inputs${i}.in
done


