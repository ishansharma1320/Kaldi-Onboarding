# Kaldi-Onboarding

Kaldi YesNo Tutorial GMM Training, Alignment and training a NNET 2 model

These scripts are largely based on points 2 and 3 under Some References. 

It is advised that the reader or user goes line by line to get a proper understanding of what is happening behind the scenes

1. Execute ./run.sh
    This file will download the datasets and perform a training over monophones based on the downloaded dataset
    
2. Aligning Monophones, Generating and Aligning Triphones (Towards training a GMM model)
    Execute ./train_gmm.sh

3. Training a NNET-2 model
    For this GMM training must be done first, and there must be a aligned triphone directory present in the experiments directory
    Move the following files to "steps/nnet2"
      1. get_egs_simple.sh
      2. get_lda_simple.sh
      3. train_simple.sh
      4. decode_simple.sh
    Then Run ./run_nnet2_simple.sh
    
Some References:
1. GMM Training Overview: What essentially is happening when we are creating and aligning Monophones and Triphones:
    https://www.eleanorchodroff.com/tutorial/kaldi/training-overview.html

2. Steps involved in Training an Acoustic Model: 
    https://www.eleanorchodroff.com/tutorial/kaldi/training-acoustic-models.html
    
3. JRMeyer's Tutorial on "How to Build a NN model in Kaldi": 
    http://jrmeyer.github.io/asr/2016/12/15/DNN-AM-Kaldi.html
    
4. Kaldi-ASR Documentation (Onboarding Example): 
    https://kaldi-asr.org/doc/tutorial.html
    
5. Kaldi-ASR Deep Neural Network Documentation:
    https://kaldi-asr.org/doc/dnn.html



    
    
      
