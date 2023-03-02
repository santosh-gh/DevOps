# To deploy a ARM template, use any of the following options:

# Template format
  In its simplest structure, a template has the following elements:

  
  {
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "",
    "apiProfile": "",
    "parameters": {  },
    "variables": {  },
    "functions": [  ],
    "resources": [  ],
    "outputs": {  }
  }

- Azure portal

- Azure CLI
  az group deployment create --resource-group MyRG --template-file "C:\DevOps\Infra-Deployment\ARM\WebApp-Service.json" --parameters "C:\DevOps\Infra-Deployment\ARM\WebApp-Service.parameters.json"

- PowerShell
  New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName MyRG `
      -TemplateFile "C:\DevOps\Infra-Deployment\ARM\WebApp-Service.json" `
      -TemplateParameterFile "C:\DevOps\Infra-Deployment\ARM\WebApp-Service.parameters.json"

- REST API

- Button in GitHub repository

- Azure Cloud Shell