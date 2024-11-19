#!/bin/bash
#
#SBATCH --job-name="abfe_main"
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=10GB

################################################################################
module purge
unset PYTHONPATH
unset LD_LIBRARY_PATH

export PATH="/ceph/hpc/home/deklevad/miniforge3/envs/abfe/bin:$PATH"
source "/ceph/hpc/home/deklevad/miniforge3/bin/activate" "abfe"

BASE="/ceph/hpc/data/s24o01-13-users/deklevad/ABFE_workflow/examples"


cd $BASE

cli-abfe -p ./data/CyclophilinD_min/receptor.pdb \
         -l ./data/CyclophilinD_min/ligands \
         -nr 3 -njr 8 -njl 40 -o output -nosubmit
