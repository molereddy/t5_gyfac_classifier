#!/bin/zsh
#
# change mail-user to your email and run by command: sbatch abc.sbatch
# # Partition to submit to (serial_requeue), see here for all avaible resource: https://docs.unity.rc.umass.edu/technical/nodelist.html

#SBATCH -p gpu # Submit job to gpu partition, can also do gpu-preempt
#SBATCH --job-name=train_test_t5
#SBATCH -c 1                        # Number of Cores per Task
#SBATCH -G 1    
#SBATCH --mem=20GB                  #requested CPU mem
#SBATCH --constraint 2080ti            # vram24, a40, a100
#SBATCH -e logs/logs_0.err         # File to which STDERR will be written
#SBATCH --output=logs/logs_0.txt    # output file
#SBATCH --mail-user=amekala@umass.edu   # Email to which notifications will be sent
#SBATCH --mail-type=ALL                 # Email for all types of Actions
#SBATCH -t 10:00:00                 # Job time limit 7-10:00:00 
#SBATCH --account=pi_dhruveshpate_umass_edu # PI account
conda init
conda activate tofu

gpustat
cd /work/pi_dhruveshpate_umass_edu/amekala_umass_edu/
cd tf-gyfac-classifier
TZ="America/New_York" date


python train.py
# python test.py > log_eval.txt

echo "Done"
TZ="America/New_York" date