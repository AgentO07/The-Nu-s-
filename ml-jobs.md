# ML Pipeline

## Installation 

### AWS S3 File MountPoint

MountPoint and related tech allows `S3` and related tech ( Cloud Storage )
to be accessible as if they are local file system.

See here : https://github.com/awslabs/mountpoint-s3/blob/main/doc/SEMANTICS.md


### Whisper Transcription 

Follow the manual from here : 
https://github.com/ggerganov/whisper.cpp?tab=readme-ov-file#quick-start
Specifically, the Quick Demo section.


### Huggingface 

Essentially follow instruction from here : https://huggingface.co/docs/transformers/installation 


1. Create VENV with python either `3.10`, `3.11`
2. Install Huggingface transformers - remember to install  `torch`,  `tensorflow` , `tf-keras`, `transformers`  
3. Run this to check if things run 

```shell
python -c "from transformers import pipeline; print(pipeline('sentiment-analysis')('we love you'))" 
```

## Design 

1. The machine must automatically mount the apropriate folders using MountPoint on boot.
2. A [SQS consumer](sqs_consumer.py) has been setup, which would on each new message, process the `.bin` audio file 
3. Then should copy the responese appropriately to appropriate folders
4. Which via using mountpoint would be synched into the `S3` storage.

To run, activate the virtual env created, 
go to the `ml` folder and start running the [SQS consumer](sqs_consumer.py) with:

```shell
python3 ./sqs_consumer.py
```
To debug if the consumer would run properly ingesting any message, run it with a test message in isolation:

```shell
python3 ./sqs_consumer.py "2024/08/15/12/12/12/time-stamp-id(user-id).bin"
```

## Isolation 

This can run as docker image, or an isolated machine. 
Isolated machine is preferred.
System gets max RSS memory around 3GB while the max Virtual Memory around 11 GB while processing
https://www.youtube.com/watch?v=IhsqPZmZvng 
