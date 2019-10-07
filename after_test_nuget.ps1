if($env:CONFIGURATION -eq "Default" -and $env:APPVEYOR_REPO_TAG -eq "true" -and $isWindows)
{
	cd $env:APPVEYOR_BUILD_FOLDER
	cd Open.Nat
	nuget pack Open.Nat.nuspec -Version $env:APPVEYOR_BUILD_VERSION
	
	$nupkg = (Get-ChildItem Open.Nat*.nupkg)[0];
	Push-AppveyorArtifact $nupkg.FullName -FileName $nupkg.Name -DeploymentName "Open.Nat.nupkg";
}