# Robust Knowledge Graph Embeddings with Perturbations

This repository contains the code for training and evaluating Knowledge Graph Embedding (KGE) models under various perturbation conditions, using different models such as `ComplEx`, `QMult`, `DistMult`, `Keci`, and `Pykeen_MuRE`.

## Table of Contents
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
  - [Running the Code](#running-the-code)
  - [Perturbation Details](#perturbation-details)
- [Hyperparameters](#hyperparameters)
- [Models](#models)
- [Results](#results)
  
## Dataset
Before running the code, please download the required datasets.

### Download Knowledge Graph Dataset
You need to download the `WN18RR` dataset for training and evaluation. Ensure that the dataset is stored in the appropriate directory before running the code.

```bash
# Download WN18RR dataset
wget https://example-link-to-WN18RR-dataset.com/WN18RR.zip
unzip WN18RR.zip -d data/WN18RR
