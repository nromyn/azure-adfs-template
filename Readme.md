# azure-adfs-template
* Creates ADFS Servers in Azure
* Deploys the following infrastructure:
 * Storage Account
 * Virtual Network
  * 3 subnets: AD, Internal, DMZ
  * 3 Network Security Groups:
    * AD - permits AD traffic, RDP incoming to network; limits DMZ access
    * Internal - permissive; restricts traffic to DMZ
    * DMZ - restrictive; permits 443 traffic to Internal, RDP from internal, very limited traffic from Internal
  * Public IP Address
  * 2 Load Balancers
    * Internal - to be used to access AD FS Servers
    * External - to be used to access Web Application Proxy servers (via PublicIP)

  _Note: only one VM Size is specified (at this time)_

  _Note: Network Cards and Availability Sets are provisioned for VMs_

  * AD VMs - 2 VMs of size specified
  * AD FS VMs - Number to be specified of size specified
  * WAP VMs - Number to be specified (same as AD FS VMs)


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnromyn%2Fazure-adfs-template%2Fmaster%2FTemplates%2FazureDeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/nromyn/azure-adfs-template/master/Templates/azureDeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>
