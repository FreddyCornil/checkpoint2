﻿function Log
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

    $digits = 48..57
    $letters = 65..90 + 97..122
    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
}

$Path = "C:\Scripts"
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","fonction","description" -Encoding UTF8  | Select-Object -Skip 1
foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue))
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Prenom.$Nom"
            FullName             = "$Prenom.$Nom"
            Password             = $Password
            Description          = $Description
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Prenom.$Nom"
        Write-Host "L'utilisateur $Prenom.$Nom a été crée, son mot de passe est $Pass"
        Log -FilePath $LogFile -Content "L'utilisateur $Prenom.$Nom a été crée"
    }
    else 
    {
        Write-Host "L'utilisateur $Prenom.$Nom existe déjà"
    }
}