function AskYesNo {
    param (
        [string]$message
    )
    
    while ($true) {
        $response = Read-Host "$message (y/n)"
        switch ($response.ToLower()) {
            'y' { return $true }
            'yes' { return $true }
            'n' { return $false }
            'no' { return $false }
            default { Write-Host "Please enter 'y' (yes) or 'n' (no)." }
        }
    }
}
# Main script logic
$question = "Do you want to re create everyhting"
$proceed = AskYesNo -message $question

if ($proceed) {
    Write-Host "`n  Deleting laravel..."
    kubectl delete namespace laravel
    Write-Host "`n  Deleting storageClass..."
    kubectl delete sc standard 
    Write-Host "`n  Deleting volumes..."
    kubectl delete pv mysql-pv
    kubectl delete pv laravel-pv
    kubectl delete pv phpmyadmin-pv
    Write-Host "`n  Re-creating..."
    kubectl apply -f namespace.yaml
    kubectl get namespace
} else {
    Write-Host "`n  Action canceled."
}

Write-Host "`n  Creating persistent volumes..."

kubectl apply -f ./volumes/.

kubectl get persistentvolumes

Write-Host "`n  Creating resources..."

# Define an array with the names of the directories
$directories = @("config-maps", "php", "laravel", "mysql")

# Loop through each directory in the array
foreach ($dir in $directories) {
    # Check if the directory exists
    if (Test-Path $dir) {
        # Get all files recursively from the directory
        $files = Get-ChildItem -Path $dir -Recurse
        
        # Apply each file using kubectl
        foreach ($file in $files) {
            if ($file.GetType().Name -eq "FileInfo") {
                kubectl apply -f $file.FullName
            }
        }
    } else {
        Write-Host "`n  Directory $dir does not exist."
    }
}

Read-Host -Prompt "`n  Press any key to close..."