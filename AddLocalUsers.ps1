function Log
{
    param([string]$FilePath,[string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

Function Random-Password ($length = 10) # Q.2.11 Augmentation de la longeur du mot de passe de 6 à 10
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","fonction","description" -Encoding UTF8  | Select-Object -Skip 1 # Q.2.2 Modification du saut de ligne de 2 à 1

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue)) # Q.2.4 Réduction de la requête aux champs nécessaires
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name" # Q.2.9 Remplacement par la varibale $Name
            FullName             = "$Name" # Q.2.9 Remplacement par la varibale $Name
            Password             = $Password
            Description          = $Description # Q.2.3 Ajout de la prise en compte de la description
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true # Q.2.10 Modification de never expire à true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Name" # Q.2.8 Modification de Utilisateur en Utilisateurs et Q.2.9 Remplacement par la varibale $Name
        Write-Host "L'utilisateur $Name a été crée, son mot de passe est $Pass" #Q.2.5 Ajout de l'affichage du mot de passe et Q.2.9 Remplacement par la varibale $Name
        Log -FilePath $LogFile -Content "L'utilisateur $$Name a été crée" # Q.2.6 Ajout de la journalisation et Q.2.9 Remplacement par la varibale $Name
    }
    else 
    {
        Write-Host "L'utilisateur $Name existe déjà" # Q.2.7 Ajout du message confimant l'exstence de l'utilisateur et Q.2.9 Remplacement par la varibale $Name
    }
}
