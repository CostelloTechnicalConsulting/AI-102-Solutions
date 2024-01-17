$resourceGroupName = "ResourceGroup1"
$location = "eastus"
# Unique name for azure AI Services of form "ai102svcyyyymmdd" where yyyymmdd is the date of creation
#get-date -format "yyyyMMdd"
$azureAIServicesName = "ai102svc$(get-date -format 'yyyyMMdd')"


az login

#az cognitiveservices account list-kinds

az cognitiveservices account create --name $azureAIServicesName --resource-group $resourceGroupName  --kind CognitiveServices --sku S0 --location $location --yes

# get keys and endpoint for Azure AI Services
$azureAIServicesKey = az cognitiveservices account keys list --name $azureAIServicesName --resource-group $resourceGroupName --query key1 -o tsv
$azureAIServicesEndpoint = az cognitiveservices account show --name $azureAIServicesName --resource-group $resourceGroupName --query endpoint -o tsv

