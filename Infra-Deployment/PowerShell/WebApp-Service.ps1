# Create variables
$WEB_APP_NAME = "HelloWorl$(Get-Random)"
$APP_SERVICE_PLAN_NAME = "HelloWorld$(Get-Random)"
$RESOURCE_GROUP_NAME = 'StepUp-Cloud-RG'
$LOCATION_NAME = 'South India'


# Create a resource group
New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location $LOCATION_NAME

# Create an App Service plan in S1 tier
New-AzAppServicePlan -Name $APP_SERVICE_PLAN_NAME -Location $LOCATION_NAME -ResourceGroupName $RESOURCE_GROUP_NAME -Tier Free

# Create a web app
New-AzWebApp -Name $WEB_APP_NAME -Location $LOCATION_NAME -AppServicePlan $APP_SERVICE_PLAN_NAME -ResourceGroupName $RESOURCE_GROUP_NAME

# Remove a Resource Group
Remove-AzResourceGroup -Name $RESOURCE_GROUP_NAME

# Run the Script File
# PowerShell -File C:\DevOps\YAML\WebApp-Service.ps1