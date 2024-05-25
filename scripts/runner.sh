#!/bin/bash

# Define the list of process numbers

# Define the number of repetitions
nrep=1000

# Iterate over the process numbers
for num in {001..36};
do
    # Generate the output file name
    output_file="bmark_np${num}_nrep${nrep}.log"

    # Run the MPI benchmark
    mpirun -np $num -hostfile mpi_hosts.conf ~/mpi_shared/ca-final-project/reprompi/bin/mpibenchmark \
        --msizes-list=800 \
        --nrep=$nrep \
        --calls-list=MPI_Allgather,MPI_Allreduce,MPI_Barrier,MPI_Bcast,MPI_Reduce,MPI_Gather \
        --summary=mean,min,max >| data/$output_file
        #--output=data/$output_file
    echo -e "[*] Generated ${output_file}"
done

