if $(which conda &> /dev/null); then
    echo "Conda is already installed."
else
    echo "Installing Miniconda..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    rm ~/miniconda.sh
    export PATH="$HOME/miniconda/bin:$PATH"
fi

# Check if conda is in PATH
if ! $(which conda &> /dev/null); then
    echo "Conda installation failed. Please check your PATH."
    exit 1
fi

# Check if psgan environment already exists
if conda env list | grep -q "psgan"; then
    echo "Environment 'psgan' already exists. Please remove it first."
    exit 1
fi

# Create a new conda environment
conda create -n psgan --file requirements.txt
conda activate psgan

# Install additional dependencies
pip install torchgpipe

# Success message
echo "Environment setup complete. Activate the environment using 'conda activate psgan'."