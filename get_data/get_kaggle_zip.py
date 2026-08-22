import kagglehub
import zipfile, os
import pandas as pd 

# Download latest version
def main():
    zip_file_path  ="get_data/global-supply-chain-risk-and-logistics-2024-2026.zip"
    csv_file_path  ="get_data/global-supply-chain-risk-and-logistics-2024-2026.csv"

    if not os.path.exists(zip_file_path):
        path = kagglehub.dataset_download(
            "nudratabbas/global-supply-chain-risk-and-logistics-2024-2026",
            output_dir = zip_file_path 
            )
        print("Path to dataset files:", path)
    else:
        print("Zip file already exists.")

        with zipfile.ZipFile(zip_file_path, "r") as z:
            csv_filename = [f for f in z.namelist() if f.ends_with(".csv")][0]
            with z.open(csv_filename) as f:
                df = pd.read_csv(f)
        df.to_csv(csv_file_path, index=False)

if __name__ == "__main__":
    main()