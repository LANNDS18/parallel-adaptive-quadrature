# TP Coursework Part 2
Using an adaptive quadrature method that computes the integral of a function on a closed interval using a divide-and-conquer method.

## Compile
Using Intel-20.4 compilers to compile the program. To compile on Cirrus, first we should

```
module unload gcc/10.2.0
module load intel-20.4/compilers
```

Then make sure the CC in Makefile is `icc -O3 -qopenmp -std=c99`
Using GNU gcc/10.2.0 compilers to compile the program. To compile on Cirrus, first we should

```
module unload intel-20.4/compilers
module load gcc/10.2.0
```

Then make sure the CC in Makefile is `gcc -O3 -fopenmp`

After then

```
    make
```



## Program Structure

```
├── solver1                 // Simple Task Constructs
├── solver1_limitdepth      // Task Constructs with Limited Recursion Depth
├── solver2                 // Simple Parllel version with active thread mechanism
├── solver2_multiqueue      // Active thread mechanism with Multiple Queues

```

## Submission on Cirrus

For Intel-20.4/compilers,

```
    sbatch solver_gun_compiler.slurm
```

For GNU gcc/10.2.0,

```
    sbatch solver_gun_compiler.slurm
```
