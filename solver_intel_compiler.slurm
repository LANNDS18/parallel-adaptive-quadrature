#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=Adaptive_Intel
#SBATCH --time=0:20:0
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=36

#SBATCH --output=%x-%j.out
#SBATCH --account=m22oc-s2311726

# We use the "standard" partition as we are running on CPU nodes
#SBATCH --partition=standard
# We use the "short" QoS as our runtime is less than 20 mins 
#SBATCH --qos=short

module unload gcc/10.2.0
module load intel-20.4/compilers

# Change to the submission directory
cd $SLURM_SUBMIT_DIR

echo
echo "simple parallel solver 1"
for thread in "1" "2" "4" "6" "8" "12" "16" "24" "32"
do

    export OMP_NUM_THREADS="$thread"
    echo "Number of Thread: $thread"
    srun --cpu-bind=cores ./solver1
done

echo
echo "parallel solver 1 with limit depth"
for thread in "1" "2" "4" "6" "8" "12" "16" "24" "32"
do

    export OMP_NUM_THREADS="$thread"
    echo "Number of Thread: $thread"
    srun --cpu-bind=cores ./solver1_limitdepth
done

echo
echo "simple parallel solver 2"
for thread in "1" "2" "4" "6" "8" "12" "16" "24" "32"
do

    export OMP_NUM_THREADS="$thread"
    echo "Number of Thread: $thread"
    srun --cpu-bind=cores ./solver2
done

echo
echo "parallel solver 2 optimized with Multiple Queue"
for thread in "1" "2" "4" "6" "8" "12" "16" "24" "32"
do

    export OMP_NUM_THREADS="$thread"
    echo "Number of Thread: $thread"
    srun --cpu-bind=cores ./solver2_multiqueue
done
