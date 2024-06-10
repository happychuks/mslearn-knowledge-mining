#!/bin/bash

# Set values for your storage account
subscription_id="c36c8f93-a745-43c3-b18d-3c5ebf1376ac"
azure_storage_account="storageaccnt1006"
azure_storage_key="7ylKDwIKxFgqj7YWwo3DfBUxSLkFn57Ng4NC3FkRKiCDEc1nK2diaq9WbMRXV68BZZuZox2pgqc/+AStdZ6pig=="

# Create container
echo "Creating container..."
az storage container create \
  --account-name "$azure_storage_account" \
  --subscription "$subscription_id" \
  --name margies \
  --public-access blob \
  --auth-mode key \
  --account-key "$azure_storage_key" \
  --output none

# Upload files
echo "Uploading files..."
az storage blob upload-batch \
  -d margies \
  -s data \
  --account-name "$azure_storage_account" \
  --auth-mode key \
  --account-key "$azure_storage_key" \
  --output none