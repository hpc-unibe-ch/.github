# .github

## Label Colors

There are several color palettes in this repository. These have
been used for the labels. Each category of labels has its palette:

 * Serverities: pastel_rainbow.png
 * Resolution: simple gray value #cccccc for all
 * Topic: pastel_forest.png
 * Type: pastel_dark_colors.png

## Managing labels

Details on how to use the tool labels can be found here
https://github.com/hackebrot/labels

The following procedure is recommended:

- Edit labels.toml and add/modify as needed
- Sync to .github repo first using dry-run. From within `.github` repo run:  
  `labels sync -f labels.toml -n`
- If ok/finished, really sync to `.github` and have look at  
  https://github.com/hpc-unibe-ch/.github/labels
- If lables are as expected, sync to all repos by running  
  `./sync_labels.sh`  
  from within this repo's root folder
- Add changed files and commit with a good commit message

## Installing labels tool

The following installation procedure illustrates the installation of labels
into a conda environment and setting some environment variables for
github.com authentication using username and token. Envronment variables are
load/unloaded to/from the environment on activating/deactivating the conda
environment.

```
conda activate ENVNAME

# Install labels and its dependencies
pip install labels

# Setup scripts to set environemnt variables
# for the github api authentication
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
mkdir -p $CONDA_PREFIX/etc/conda/deactivate.d
echo "export LABELS_USERNAME=<your-github-username>" >> mkdir -p $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo "export LABELS_TOKEN=<your-github-token>" >> mkdir -p $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo <<<EOF > $CONDA_PREFIX/etc/conda/deactivate.d/env_vars.sh
unset LABELS_USERNAME
unset LABELS_TOKEN
EOF

# Activate the environment again to setup the variables
conda activate ENVNAME

# Test by fetching the labels of this repo to a testfile
labels fetch -o hpc-unibe-ch -r .github -f test.toml
```


