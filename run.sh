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

# add a few lines to clean all the inputs and outputs before replicate

test_cases=15

if [[ ! -z "$1" ]]; then
    test_cases=$1
fi

for (( i = 1; i <= $test_cases; i++ ))
do
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment1/input_parameters.prp experiment1/inputs/inputs${i}.in
    newSeed=$((RANDOM%(999999999999999-100000000000000+1)+100000000000000))
    sed -i "s/seed=[0-9]*/seed=$newSeed/g" experiment1/input_parameters.prp
    # java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment2/input_parameters.prp experiment2/inputs/inputs${i}.in
    # java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment3/input_parameters.prp experiment3/inputs/inputs${i}.in
done

for (( i = 1; i <= $test_cases; i++ ))
do
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/FCFS/simulator_parameters.prp experiment1/scheduler/FCFS/output/output${i}.out experiment1/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/RR/simulator_parameters.prp experiment1/scheduler/RR/output/output${i}.out experiment1/inputs/inputs${i}.in
done

#!/bin/bash
#jupyter nbconvert --execute '{"argv": ["'$1'"]}' report.ipynb --to notebook --ExecutePreprocessor.allow_errors=True --ExecutePreprocessor.timeout=60

export TEST_CASES=$test_cases
jupyter nbconvert --execute report.ipynb --to notebook --output executed_report.ipynb
# jupyter-notebook executed_report.ipynb
