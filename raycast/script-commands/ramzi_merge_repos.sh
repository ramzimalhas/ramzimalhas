#!/bin/bash

# Clone the main repository if not already cloned
if [ ! -d "data-science-bootcamp" ]; then
  git clone https://github.com/ramzimalhas/data-science-bootcamp.git
fi

cd data-science-bootcamp

# List of repositories to merge
repos=(
    "data-linear-regression"
    "data-solvers"
    "data-knn"
    "data-first-transformer"
    "data-your-first-rnn"
    "data-mnist-classification"
    "data-playground"
    "data-movie-reviews"
    "data-image-compression"
    "data-houses-kaggle-competition"
    "data-loss-functions"
    "data-real-estate-estimator"
    "data-table-design"
    "data-tensor-trials"
    "data-playground-part-ii"
    "data-ham-or-spam"
    "data-preprocessor-tuning"
    "data-batch-gradient-descent"
    "data-orders"
    "data-law-of-large-numbers"
    "data-matplotlib-intro"
    "data-opengraph_api"
    "data-notebook"
    "data-sum-of-three"
    "data-recap-train-at-scale"
    "data-train-at-scale"
    "data-preprocessing-workflow"
    "data-data-preparation"
    "data-context-and-setup"
    "data-real-estate-advanced-estimator"
    "data-back_to_school_query"
    "data-static-front"
    "data-fast-api"
    "data-model-lifecycle"
    "data-train-in-the-cloud"
    "data-langchain"
    "data-gpt-from-scratch"
    "data-transformer-finetuning-challenge"
    "data-classify-electrocardiograms"
    "data-sentiment-analysis-with-word2vec"
    "data-embeddings-with-word2vec"
    "data-your-first-embedding"
    "data-recap_cnn"
    "data-credit-card-challenge"
    "data-autoencoder"
    "data-transfer-learning"
    "data-cifar-classification"
    "data-intuition-on-convolutions"
    "data-pipelines_with_tensorflow"
    "data-finetune-your-neural-network"
    "data-how-to-properly-prevent-overfitting"
    "data-genai-lecture-notebook"
    "data-houses-kaggle-competition-bis"
    "data-multiclass-classification"
    "data-your-first-neural-network"
    "data-vectorizer-tuning"
    "data-arima-101"
    "data-arima"
    "data-recap_workflow"
    "data-regularization"
    "data-hand-made-standardizer"
    "data-pickle-pipe"
    "data-tuning-pipeline"
    "data-custom-transformer"
    "data-workflow"
    "data-feature-selection"
    "data-the_botanist"
    "data-olist_ceo_request"
    "data-recap_ceo_request"
    "data-logit"
    "data-orders-regression"
    "data-simple-analysis"
    "data-exploratory-analysis"
    "data-central-limit-theorem"
    "data-random-variables"
    "data-clt_irl"
    "data-scipy"
    "data-matplotlib-basics"
    "data-optional-experimenting"
    "data-multiple-files-with-pandas"
    "data-us-oil-and-gas-production"
    "data-numpy"
    "data-query-the-db"
    "data-check"
    "data-db-design"
    "data-api"
    "data-csv"
    "data-string-manipulation"
    "data-setup"
)

# Loop through each repository and merge it
for repo in "${repos[@]}"
do
    if [ ! -d "$repo" ]; then
        git remote add $repo https://github.com/ramzimalhas/$repo.git
        git fetch $repo
        if git ls-remote --heads https://github.com/ramzimalhas/$repo.git main | grep -q 'refs/heads/main'; then
            git subtree add --prefix=$repo $repo/main --squash
        elif git ls-remote --heads https://github.com/ramzimalhas/$repo.git master | grep -q 'refs/heads/master'; then
            git subtree add --prefix=$repo $repo/master --squash
        else
            echo "No main or master branch found for $repo"
        fi
        git remote remove $repo
    fi
done

# Push changes to the main repository
git push origin main