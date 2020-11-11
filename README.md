This repo is for people who want to train a specific font on top of the provided traineddata files. You need to tweak/add the .sh file to fit your own requirements. In this structure i am training Nikosh2 font for bengali language with 10 maxpages and iteration of 500.

Please note that you can also continue from the _checkpoint file on the output/nid/ folder. That checkpoint file will be the best accuracy acheived in the previous run. Tweak the --continue_from line in the finetune-all-combined.sh file-
	--continue_from _checkpoint
You also need to set your max_iterations to a value that so that it is last iteration value + new iteration value. for example if you did 500 on the last run and you want 1000 more iterations set-
	--max-iterations 1500


