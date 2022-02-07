#!/bin/sh
echo ""
echo "##############"
echo "### MONOPHONES ALIGNMENT ####"
echo "##############"
echo ""
train_cmd=utils/run.pl
steps/align_si.sh --boost-silence 1.25 --nj 1 --cmd "$train_cmd" data/train_yesno data/lang exp/mono0a exp/mono_ali || exit 1;
echo ""
echo "##############"
echo "### TRAINING DELTA-BASED TRIPHONES ####"
echo "##############"
echo ""
steps/train_deltas.sh --boost-silence 1.25 --cmd "$train_cmd" 2000 10000 data/train_yesno data/lang exp/mono_ali exp/tri1 || exit 1;
echo ""
echo "##############"
echo "### ALIGNING DELTA-BASED TRIPHONES ####"
echo "##############"
echo ""
steps/align_si.sh --nj 1 --cmd "$train_cmd" data/train_yesno data/lang exp/tri1 exp/tri1_ali || exit 1;
echo ""
echo "##############"
echo "### TRAINING DELTA+DELTA-DELTA TRIPHONES ####"
echo "##############"
echo ""
steps/train_deltas.sh --cmd "$train_cmd" 2500 15000 data/train_yesno data/lang exp/tri1_ali exp/tri2a || exit 1;
echo ""
echo "##############"
echo "### ALIGNING DELTA+DELTA-DELTA TRIPHONES ####"
echo "##############"
echo ""
steps/align_si.sh  --nj 1 --cmd "$train_cmd" --use-graphs true data/train_yesno data/lang exp/tri2a exp/tri2a_ali  || exit 1;
echo ""
echo "##############"
echo "#### TRAINING SAT TRIPHONES ####"
echo "##############"
echo ""
steps/train_sat.sh  --cmd "$train_cmd" 4200 40000 data/train_yesno data/lang exp/tri2a_ali exp/tri3a || exit 1;
echo ""
echo "##############"
echo "#### ALIGNING SAT TRIPHONES WITH FMLLR ####"
echo "##############"
echo ""
steps/align_fmllr.sh --nj 1 --cmd "$train_cmd" data/train_yesno data/lang exp/tri3a exp/tri3a_ali || exit 1;

echo ""
echo "##############"
echo "#### END OF FILE ####"
echo "##############"
echo ""