#!/usr/bin/env python3

import json
import requests
import boto3
import time
import os

def download_and_filter_products(url, price_threshold):
    print("Downloading products...")
    response = requests.get(url)
    products = response.json()['products']
    return [product for product in products if product['price'] >= price_threshold]

def upload_to_s3(bucket_name, file_name, s3_client):
    print(f"Uploading {file_name} to S3 bucket {bucket_name}...")
    s3_client.upload_file(file_name, bucket_name, file_name)

def download_via_cloudfront(url):
    print(f"Downloading file from CloudFront URL: {url}")
    full_url = f'https://{url}' if not url.startswith(('http://', 'https://')) else url
    response = requests.get(full_url)
    
    if response.status_code != 200:
        print(f"Failed to download file: HTTP {response.status_code}")
        print(f"Response content: {response.text}")
        return None
    
    try:
        return response.json()
    except json.JSONDecodeError:
        print("The downloaded content is not valid JSON.")
        print(f"Response content: {response.text}")
        return None

def main():
    PRODUCTS_URL = 'https://dummyjson.com/products'
    PRICE_THRESHOLD = 100
    BUCKET_NAME = os.getenv('BUCKET_ID')
    CLOUDFRONT_URL = os.getenv('CLOUDFRONT_URL')

    FILE_NAME = 'filtered_products.json'

    # Ensure environment variables are set
    if not BUCKET_NAME or not CLOUDFRONT_URL:
        print("Environment variables for BUCKET_ID or CLOUDFRONT_URL are not set.")
        return

    # Download and filter products
    filtered_products = download_and_filter_products(PRODUCTS_URL, PRICE_THRESHOLD)
    with open(FILE_NAME, 'w') as file:
        print("Saving filtered products to file...")
        json.dump(filtered_products, file)

    # Initialize S3 client
    s3_client = boto3.client('s3')

    # Upload to S3
    upload_to_s3(BUCKET_NAME, FILE_NAME, s3_client)

    # Wait for a short time before downloading via CloudFront
    sleep_time = 15
    print(f"Waiting {sleep_time} seconds for CloudFront distribution...")
    time.sleep(sleep_time)  # Wait time in seconds; 

    # Download via CloudFront
    cloudfront_full_url = f'{CLOUDFRONT_URL}/{FILE_NAME}'
    downloaded_content = download_via_cloudfront(cloudfront_full_url)
    if downloaded_content:
        print("Successfully downloaded and verified JSON from CloudFront.")
        print("Downloaded Content:")
        print(json.dumps(downloaded_content, indent=4))

if __name__ == "__main__":
    main()




