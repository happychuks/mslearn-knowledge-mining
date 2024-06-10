@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id=c36c8f93-a745-43c3-b18d-3c5ebf1376ac
set azure_storage_account=storageaccnt1006
set azure_storage_key=7ylKDwIKxFgqj7YWwo3DfBUxSLkFn57Ng4NC3FkRKiCDEc1nK2diaq9WbMRXV68BZZuZox2pgqc/+AStdZ6pig==


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
