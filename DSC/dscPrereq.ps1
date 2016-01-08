Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
  {
    Script DSCWave {
        GetScript = { @{ Result = (Test-Path -Path "$env:windirtempDSC Resource Kit Wave 6 08212014.zip"); } };
        SetScript = {
            $Uri = 'http://gallery.technet.microsoft.com/DSC-Resource-Kit-All-c449312d/file/124120/1/DSC%20Resource%20Kit%20Wave%206%2008212014.zip';
            $OutFile = "$env:windirtempDSC Resource Kit Wave 6 08212014.zip";
            Invoke-WebRequest -Uri $Uri -OutFile $OutFile;
            Unblock-File -Path $OutFile;
            };
        TestScript = { Test-Path -Path "$env:windirtempDSC Resource Kit Wave 6 08212014.zip"; }
    }
	Archive DSCWave {
			DependsOn = '[Script]DSCWave';
			Ensure = 'Present';
			Path = "$env:windirtempDSC Resource Kit Wave 6 08212014.zip";
			Destination = "$env:ProgramFilesWindowsPowerShellModules";
	}
}