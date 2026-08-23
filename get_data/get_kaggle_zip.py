import kagglehub
import zipfile, os
import pandas as pd 

# Download latest version
def main():
    csv_file_path = "get_data/csv/global-supply-chain-risk-and-logistics-2024-2026.csv"
    kaggle_zip_dl_path  ="nudratabbas/global-supply-chain-risk-and-logistics-2024-2026"

    print("Downloading dataset...")
    # kaggle_hub.dataset_download : 
    dataset_path = kagglehub.dataset_download(kaggle_zip_dl_path)
    print("Path to dataset files: ", dataset_path)

    csv_files = [f for f in os.listdir(dataset_path) if f.endswith(".csv")]

    if not csv_files:
        print("CSV file not found in the dataset.")
        return 

    source_csv = os.path.join(dataset_path, csv_files[0])
    df = pd.read_csv(source_csv)
    df.to_csv(csv_file_path, index=False)
    print(f"Dataset successfully saved to {csv_file_path}")

if __name__ == "__main__":
    main() 