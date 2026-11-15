Write-Host "`nAzure AD Object ID Lookup" -ForegroundColor Cyan
Write-Host "Enter the UPN (email address) for each lab user when prompted.`n"

$roles = @(
    @{ Label = "SysAdmin (Owner)";             VarName = "sysadmin_object_id" },
    @{ Label = "SupportTech (VM Contributor)"; VarName = "support_user_object_id" },
    @{ Label = "Auditor (Reader)";             VarName = "auditor_object_id" }
)

$results = @()
foreach ($role in $roles) {
    $upn = (Read-Host "Enter UPN for $($role.Label)").Trim()
    try {
        $objectId = az ad user show --id $upn --query id -o tsv 2>$null
        if (-not $objectId -or $LASTEXITCODE -ne 0) {
            Write-Warning "Could not find user: $upn - check the email and try again."
            $objectId = "NOT_FOUND"
        }
    } catch { $objectId = "ERROR" }
    $results += @{ VarName = $role.VarName; ObjectId = $objectId }
    Write-Host "  Result: $objectId" -ForegroundColor Green
}

Write-Host "`n=== Paste these into terraform.tfvars ===" -ForegroundColor Yellow
foreach ($r in $results) {
    Write-Host "$($r.VarName.PadRight(25)) = `"$($r.ObjectId)`""
}