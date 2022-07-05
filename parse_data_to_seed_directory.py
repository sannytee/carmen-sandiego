import sys
import pandas as pd


def seed_region_data_from_excel(excel_filepath, seeds_directory_path):
    try:
        sheets = pd.read_excel(excel_filepath, sheet_name=None)
        for sheet in sheets:
            sheets[sheet].to_csv(f"{seeds_directory_path}/seed_region_{sheet.lower()}.csv", index=False)
    except Exception as e:
        print(F"An error occurred parsing excel file to seed directory: {e}")


if __name__ == "__main__":
    data_directory, seeds_directory = sys.argv[1:3]
    seed_region_data_from_excel(data_directory, seeds_directory)