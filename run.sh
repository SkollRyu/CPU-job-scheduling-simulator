#!/bin/bas

test_cases=15

if [[ ! -z "$1" ]]; then
    test_cases=$1
fi

# Clear files

# clean experiment 1
rm -rf experiment1/inputs/*
rm -rf experiment1/scheduler/FCFS/output/*
rm -rf experiment1/scheduler/ISJF/output/*
rm -rf experiment1/scheduler/RR/output/*
rm -rf experiment1/scheduler/SJF/output/*

# clean experiment 2
rm -rf experiment2/inputs/*
rm -rf experiment2/scheduler/FCFS/output/*
rm -rf experiment2/scheduler/ISJF/output/*
rm -rf experiment2/scheduler/RR/output/*
rm -rf experiment2/scheduler/SJF/output/*

# clean experiement 3
rm -rf experiment3/inputs/*
rm -rf experiment3/scheduler/FCFS/output/*
rm -rf experiment3/scheduler/ISJF/output/*
rm -rf experiment3/scheduler/RR/output/*
rm -rf experiment3/scheduler/SJF/output/*
rm -rf experiment3/scheduler/FBRR/output/*

# Input Generate
sed -i "s/meanCpuBurst=[0-9]*\.[0-9]*/meanCpuBurst=10.0/g" experiment1/input_parameters.prp
sed -i "s/meanIOBurst=[0-9]*\.[0-9]*/meanIOBurst=10.0/g" experiment2/input_parameters.prp

for (( i = 1; i <= $((test_cases * 2)); i++ ))
do
    if [ $i -le 15 ]; then
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment3/input_parameters.prp experiment3/inputs/inputs${i}.in
    fi

    if [ $i -eq 15 ]; then
        sed -i "s/meanCpuBurst=[0-9]*\.[0-9]*/meanCpuBurst=20.0/g" experiment1/input_parameters.prp
        sed -i "s/meanIOBurst=[0-9]*\.[0-9]*/meanIOBurst=20.0/g" experiment2/input_parameters.prp
    fi
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment1/input_parameters.prp experiment1/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar InputGenerator experiment2/input_parameters.prp experiment2/inputs/inputs${i}.in
    newSeed=$((RANDOM%(999999999999999-100000000000000+1)+100000000000000))
    sed -i "s/seed=[0-9]*/seed=$newSeed/g" experiment1/input_parameters.prp
    sed -i "s/seed=[0-9]*/seed=$newSeed/g" experiment2/input_parameters.prp
    sed -i "s/seed=[0-9]*/seed=$newSeed/g" experiment3/input_parameters.prp
done


# Run Simulation
for (( i = 1; i <= $((test_cases * 2)); i++ ))
do
    # exp 1
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/FCFS/simulator_parameters.prp experiment1/scheduler/FCFS/output/output${i}.out experiment1/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/ISJF/simulator_parameters.prp experiment1/scheduler/ISJF/output/output${i}.out experiment1/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/RR/simulator_parameters.prp experiment1/scheduler/RR/output/output${i}.out experiment1/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment1/scheduler/SJF/simulator_parameters.prp experiment1/scheduler/SJF/output/output${i}.out experiment1/inputs/inputs${i}.in

    # exp 2
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment2/scheduler/FCFS/simulator_parameters.prp experiment2/scheduler/FCFS/output/output${i}.out experiment2/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment2/scheduler/ISJF/simulator_parameters.prp experiment2/scheduler/ISJF/output/output${i}.out experiment2/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment2/scheduler/RR/simulator_parameters.prp experiment2/scheduler/RR/output/output${i}.out experiment2/inputs/inputs${i}.in
    java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment2/scheduler/SJF/simulator_parameters.prp experiment2/scheduler/SJF/output/output${i}.out experiment2/inputs/inputs${i}.in

    # exp 3
    if [ $i -le 15 ]; then
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment3/scheduler/FCFS/simulator_parameters.prp experiment3/scheduler/FCFS/output/output${i}.out experiment3/inputs/inputs${i}.in
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment3/scheduler/ISJF/simulator_parameters.prp experiment3/scheduler/ISJF/output/output${i}.out experiment3/inputs/inputs${i}.in
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment3/scheduler/RR/simulator_parameters.prp experiment3/scheduler/RR/output/output${i}.out experiment3/inputs/inputs${i}.in
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment3/scheduler/SJF/simulator_parameters.prp experiment3/scheduler/SJF/output/output${i}.out experiment3/inputs/inputs${i}.in
        java -cp target/os-coursework1-1.0-SNAPSHOT.jar Simulator experiment3/scheduler/FBRR/simulator_parameters.prp experiment3/scheduler/FBRR/output/output${i}.out experiment3/inputs/inputs${i}.in
    fi
done

#!/bin/bash
#jupyter nbconvert --execute '{"argv": ["'$1'"]}' report.ipynb --to notebook --ExecutePreprocessor.allow_errors=True --ExecutePreprocessor.timeout=60

#export TEST_CASES=$test_cases
#jupyter nbconvert --execute report.ipynb --to notebook --output executed_report.ipynb
# jupyter-notebook executed_report.ipynb
