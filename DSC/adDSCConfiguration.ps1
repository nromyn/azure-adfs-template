
Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
  {
	   WindowsFeature ADDSInstall             
        {             
            Ensure = "Present"             
            Name = "AD-Domain-Services"             
        } 
	  WindowsFeature ADDSTools            
        {             
            Ensure = "Present"             
            Name = "RSAT-ADDS-Tools"             
        }
	  WindowsFeature ADPowerShell
	  {
		  Ensure = "Present"
		  Name = "RSAT-AD-PowerShell"
	  }
	 WindowsFeature ADAdminCenter
	  {
		  Ensure = "Present"
		  Name = "RSAT-AD-AdminCenter"
	  }
	  WindowsFeature GPManagement
	  {
		  Ensure = "Present"
		  Name = "GPMC"
	  }
	  WindowsFeature DNSServer
	  {
		  Ensure = "Present"
		  Name = "DNS"
	  }
	  WindowsFeature DNSServer-Tools
	  {
		  Ensure = "Present"
		  Name = "RSAT-DNS-Server"
	  }



	 <#
	  AD-Domain-Services
	  DNS
	  GPMC
	  RSAT-AD-AdminCenter
	  RSAT-AD-ADDS-Tools
	  RSAT-DNS-Server
	#>
   <#
    Script DownloadWebDeploy
    {
        TestScript = {
            Test-Path "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
        }
        SetScript ={
            $source = "http://download.microsoft.com/download/A/5/0/A502BE57-7848-42B8-97D5-DEB2069E2B05/WebDeploy_amd64_en-US.msi"
            $dest = "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
            Invoke-WebRequest $source -OutFile $dest
        }
        GetScript = {@{Result = "DownloadWebDeploy"}}
        DependsOn = "[WindowsFeature]WebServerRole"
    }
    Package InstallWebDeploy
    {
        Ensure = "Present"  
        Path  = "C:\WindowsAzure\WebDeploy_amd64_en-US.msi"
        Name = "Microsoft Web Deploy 3.6 Beta"
        ProductId = "{50638DB8-30CE-4713-8EA0-6AA405740391}"
        Arguments = "ADDLOCAL=ALL"
        DependsOn = "[Script]DownloadWebDeploy"
    }
    Service StartWebDeploy
    {                    
        Name = "WMSVC"
        StartupType = "Automatic"
        State = "Running"
        DependsOn = "[Package]InstallWebDeploy"
    } #>
  }
}