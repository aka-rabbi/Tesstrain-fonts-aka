rm -rf train/* 
	OMP_THREAD_LIMIT=4 tesstrain.sh \
	--fonts_dir fonts \
	--fontlist 'Nikosh2' \
	--lang ben \
	--linedata_only \
	--langdata_dir langdata_lstm \
	--tessdata_dir tessdata/best \
	--save_box_tiff \
	--maxpages 10 \
	--output_dir train
combine_tessdata -e tessdata/best/ben.traineddata ben.lstm
rm -rf output/nid/*
OMP_THREAD_LIMIT=8 lstmtraining \
	--continue_from ben.lstm \
	--model_output output/nid/ \
	--traineddata tessdata/best/ben.traineddata \
	--train_listfile train/ben.training_files.txt \
	--max_iterations 500
lstmtraining --stop_training \
	--continue_from ben.lstm \
	--traineddata tessdata/best/ben.traineddata \
	--model_output output/ben_iter500.traineddata
