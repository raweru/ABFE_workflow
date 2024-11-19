#!/bin/bash
# This is a base shell template file

export OMP_NUM_THREADS="${1}"
STEPNAME="${2}"
TOPOLOGY="${3}"
STRUCTURE="${4}"

#opts
GROMACS_TPR="${STEPNAME}.tpr"
CONFOUT="${STEPNAME}.gro"


#Grompp this:
gmx grompp -f ./${STEPNAME}.mdp -c ${STRUCTURE} -r ${STRUCTURE} -p ${TOPOLOGY} -o ${GROMACS_TPR} -maxwarn 2

# run gromacs command
gmx mdrun -ntmpi 1 -ntomp ${OMP_NUM_THREADS} -s $GROMACS_TPR -c $CONFOUT -deffnm ${STEPNAME} -pme gpu -pmefft gpu -bonded gpu -nb gpu

exit 0