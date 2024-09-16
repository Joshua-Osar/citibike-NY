# NYC Citibike Data Engineering Project

## Overview
This project is a comprehensive data engineering pipeline that collects, processes, and analyzes Citibike trip data from New York City. The goal is to extract meaningful insights about bike usage patterns, popular routes, and user behavior in the city's bike-sharing system.

## Project Structure
- `main.tf`: Terraform configuration for setting up Google Cloud infrastructure
- `docker-compose.yml`: Docker Compose file for local development and running the Mage AI orchestration tool
- `load_api_data.py`: Python script to fetch and load Citibike data from the API
- `transform_data.py`: Data transformation script to prepare the data for analysis
- `export_gcs_partitioned.py`: Script to export processed data to Google Cloud Storage in a partitioned format

## Technologies Used
- Terraform: Infrastructure as Code (IaC) for GCP resource management
- Docker: Containerization for consistent development and deployment
- Mage AI: Data pipeline orchestration tool
- Google Cloud Platform (GCP):
  - Google Cloud Storage: Data lake storage
  - BigQuery: Data warehousing and analysis
- Python: Data processing and analysis
- Pandas: Data manipulation and analysis library
- PyArrow: Efficient data serialization and storage

## Setup and Installation
1. Clone this repository
2. Set up GCP credentials:
   - Place your GCP service account key in `./keys/my-cred.json`
   - Update the `GOOGLE_APPLICATION_CREDENTIALS` path in `export_gcs_partitioned.py`
3. Configure environment variables:
   - Create a `.env` file with necessary PostgreSQL and project-specific variables
4. Run `terraform init` and `terraform apply` to set up GCP resources
5. Build and run the Docker containers:
   ```
   docker-compose build
   docker-compose up
   ```

## Data Pipeline
1. **Data Extraction**: Fetches Citibike trip data from the official API using `load_api_data.py`
2. **Data Transformation**: Processes and cleans the data, adding derived columns like date fields using `transform_data.py`
3. **Data Loading**: Exports the transformed data to Google Cloud Storage in a partitioned Parquet format using `export_gcs_partitioned.py`

## Analysis Capabilities
With this pipeline, you can analyze:
- Daily, weekly, and monthly ride patterns
- Popular start and end stations
- Trip duration statistics
- Member vs. casual rider usage patterns
- Geographic distribution of rides

## Future Enhancements
- Implement real-time data streaming for up-to-the-minute analysis
- Develop a dashboard for visualizing key metrics and trends
- Integrate machine learning models for demand prediction and route optimization

## Contributing
Contributions to this project are welcome! Please fork the repository and submit a pull request with your proposed changes.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
 
