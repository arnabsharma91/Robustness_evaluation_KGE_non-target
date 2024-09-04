# Robust Knowledge Graph Embeddings with Perturbations

This repository contains the code for training and evaluating Knowledge Graph Embedding (KGE) models under various perturbation conditions, using different models such as `ComplEx`, `QMult`, `DistMult`, `Keci`, and `Pykeen_MuRE`. To replicate the results reported in the paper Robustness Evaluation of Knowledge Graph Embedding Models under Non-targeted Attacks, first, you will need to install the dice embeddings. This will then load and install the necessary datasets, models, code to replicate the results. To install the dice emebdddings, please follow the instructions [here](https://github.com/arnabsharma91/Robustness_evaluation_KGE_non-target_attack/tree/master/RobustKGE).

## Usage

### Running the Code

You can run the script for different models and perturbation conditions using the provided `.sh` file. The code trains Knowledge Graph Embedding (KGE) models on the `WN18RR` dataset with different levels of perturbation.

To execute the training script, use:

```bash run_experiments.sh```

### Perturbation Details

The perturbations applied during training are of three types:

1. **Graph-level Perturbation**: Modify the graph input.
   - **Level**: `input`
   - **Ratio**: Varying ratios of perturbation.
   
2. **Label Perturbation**: Modify the labels used during training.
   - **Level**: `out`
   - **Method**: `Hard`
   - **Ratio (k)**: Varying levels of label perturbation (e.g., `k = 0.0`, `0.001`, etc.).

3. **Parameter-level Perturbation**: Perturbation applied to the model's parameters.
   - **Level**: `param`
   - **Method**: `RN`
   - **Scaler**: Set to `0.3`
   - **Ratio (k)**: Same as label perturbation.

For each combination of perturbation type and ratio, the model's performance is evaluated.

---
### Example Command

python -m dicee.run --trainer PL \
    --path_to_store_single_run "Robust/dice-embeddings/WN18RRLP/WN18RR-LP-ComplEx-Dim32-Epoch-100-label-Perturb-k0.01-rs1" \
    --model "ComplEx" --embedding_dim 32 --num_epochs 100 \
    --callbacks "{\"Perturb\": { \"level\": \"out\", \"method\": \"Hard\", \"ratio\": 0.01}}" \
    --batch_size 1024 --random_seed 1


## Hyperparameters

The main hyperparameters used in the training process include:

- `d=32`: Dimensionality of the embeddings.
- `num_epochs=100`: Number of epochs for training.
- `batch_size=1024`: Batch size for training.
- `random_seed`: Multiple seeds are used to ensure stability, including `1`, `2`, `3`, `4`, and `42`.
- `scaler=0.3`: Scaling factor for parameter perturbation.

### Perturbation Ratios
The label perturbation ratio `k` is varied across the following values:
k = [0.0, 0.001, 0.01, 0.02, 0.04, 0.08, 0.16, 0.32]

