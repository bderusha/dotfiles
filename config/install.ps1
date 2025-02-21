# https://gist.github.com/gbingersoll/c3033f8cb41c3eb865563c0711a30545

git clone https://github.com/powerline/fonts.git
Set-Location fonts
.\install.ps1

Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name 'posh-git'
Install-Module -Name 'oh-my-posh'
Install-Module -Name 'Get-ChildItemColor'