# ZINB
for l in {1..1}; do # ZINB, ZIG, ZILN
  for j in {0..0}; do 
    for k in {1..54}; do 
      sbatch --time=10:00:00 --mem 10000 S9_DS2_update.sh 0 $j $k $l 5 80;
      sbatch --time=20:00:00 --mem 10000  S9_DS2_update.sh 0 $j $k $l 5 400; 
      if [[ "$l" = 3 ]]; then
        sbatch --time=10:00:00 --mem 10000  S9_DS2_update.sh 0 $j $k $l 2.5 80;
        sbatch --time=20:00:00 --mem 10000  S9_DS2_update.sh 0 $j $k $l 2.5 400;
        sbatch --time=10:00:00 --mem 10000  S9_DS2_update.sh 0 $j $k $l 0 80;
        sbatch --time=20:00:00 --mem 10000  S9_DS2_update.sh 0 $j $k $l 0 400;
      fi;
    done; 
  done; 
done;

# ijk = scenarios
# i is being looped inside Rscripts.
# $4 = model (1 = zinb, 2 = zig, 3 = zlin)
# $5 = perturb (5 = 50%)
# $6 = n (80, 400)
