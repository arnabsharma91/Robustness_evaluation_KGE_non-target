# Please specify the dataset. See download knowledge graphs in the README. ( Source Code)
# Specify the hyperparameters
# For perturbations : 1: Graph level specify level input and ratio 2: For label perturbation level out , method Hard and ratio (k) 3. Parameter level specify level param , method RN , sclaer 0.3 , ratio (k)
d=32
dataset="WN18RR"
base_dir="Robust/dice-embeddings/WN18RRLP"  
d=32
model_list=("ComplEx" "QMult" "DistMult" "Keci" "Pykeen_MuRE")
scaler=0.3

for model in "${model_list[@]}"; do
  for num_epochs in 100 ; do
   for k in 0.0 0.001 0.01 0.02 0.04 0.08 0.16 0.32 ; do
     for randomseed in 1 2 3 4 42; do
      
       python -m dicee.run --trainer PL \
         --path_to_store_single_run "${base_dir}/${dataset}-LP-${model}-Dim${d}-Epoch-${num_epochs}-label-Perturb-k${k}-rs${randomseed}" \
        --model "${model}" --embedding_dim "${d}" --num_epochs "${num_epochs}" \
        --callbacks "{\"Perturb\": { \"level\": \"out\",\"method\": \"Hard\",\"ratio\":${k}}}" \
        --batch_size 1024 --random_seed "${randomseed}"
      done
     done
  done
done