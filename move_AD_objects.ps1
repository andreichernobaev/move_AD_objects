
#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-move_AD_objects_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formMoveADObjects = New-Object 'System.Windows.Forms.Form'
	$label_warning = New-Object 'System.Windows.Forms.Label'
	$buttonEnableObjects = New-Object 'System.Windows.Forms.Button'
	$checkboxOnlyEnabledObjects = New-Object 'System.Windows.Forms.CheckBox'
	$labelLogins = New-Object 'System.Windows.Forms.Label'
	$buttonMoveObjects = New-Object 'System.Windows.Forms.Button'
	$richtextbox_ad_objects = New-Object 'System.Windows.Forms.RichTextBox'
	$labelObjectType = New-Object 'System.Windows.Forms.Label'
	$radiobuttonComputer = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonUser = New-Object 'System.Windows.Forms.RadioButton'
	$labelMoveToOU = New-Object 'System.Windows.Forms.Label'
	$textbox_OU = New-Object 'System.Windows.Forms.TextBox'
	$labelLabel1 = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$formMoveADObjects_Load={
		Import-Module activedirectory
	}
	
	$radiobuttonComputer_CheckedChanged = {
		$labelLogins.Text = "Computer names"
	}
	
	$radiobuttonUser_CheckedChanged={
		$labelLogins.Text = "Logins"
	}
	
		$buttonMoveObjects_Click = {
		
		    $label_warning.Text = ""
			[string]$targetOU = $textbox_OU.text
			$adpath = "AD:\$targetOU"
			if (Test-Path $adpath)
			{
			$ErrorActionPreference = "Stop"
			
				$objs = $richtextbox_ad_objects.Lines
			
			if ($radiobuttonUser.Checked)
			{
				if ($checkboxOnlyEnabledObjects.Checked)
				{
					foreach ($obj in $objs) { Get-ADUser $obj -properties DistinguishedName | Where-Object Enabled | Move-ADObject -TargetPath $targetOU }
				}
				else
				{
					foreach ($obj in $objs) { Get-ADUser $obj -properties DistinguishedName | Move-ADObject -TargetPath $targetOU }
				}
			}
			else
			{
				if ($checkboxOnlyEnabledObjects.Checked)
				{
					foreach ($obj in $objs) { Get-ADComputer $obj -properties DistinguishedName | Where-Object Enabled | Move-ADObject -TargetPath $targetOU }
				}
				else
				{
				    foreach ($obj in $objs) { Get-ADComputer $obj -properties DistinguishedName | Move-ADObject -TargetPath $targetOU }
				}
			}
		}
		else { $label_warning.Text = "Specify the correct path to OU" }
	}
	
	$buttonEnableObjects_Click = {
		
		    $ErrorActionPreference = "Stop"
			$objs = $richtextbox_ad_objects.Lines
			
			if ($radiobuttonUser.Checked)
			{
				foreach ($obj in $objs) { Get-ADUser $obj -properties Enabled | Where-Object { $_.Enabled -eq $false } | Set-ADUser -Enabled $True }
			}
			else
			{
				foreach ($obj in $objs) { Get-ADComputer $obj -properties Enabled | Where-Object { $_.Enabled -eq $false } | Set-ADComputer -Enabled $True }
			}
			
		}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formMoveADObjects.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonEnableObjects.remove_Click($buttonEnableObjects_Click)
			$buttonMoveObjects.remove_Click($buttonMoveObjects_Click)
			$radiobuttonComputer.remove_CheckedChanged($radiobuttonComputer_CheckedChanged)
			$radiobuttonUser.remove_CheckedChanged($radiobuttonUser_CheckedChanged)
			$formMoveADObjects.remove_Load($formMoveADObjects_Load)
			$formMoveADObjects.remove_Load($Form_StateCorrection_Load)
			$formMoveADObjects.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formMoveADObjects.SuspendLayout()
	#
	# formMoveADObjects
	#
	$formMoveADObjects.Controls.Add($label_warning)
	$formMoveADObjects.Controls.Add($buttonEnableObjects)
	$formMoveADObjects.Controls.Add($checkboxOnlyEnabledObjects)
	$formMoveADObjects.Controls.Add($labelLogins)
	$formMoveADObjects.Controls.Add($buttonMoveObjects)
	$formMoveADObjects.Controls.Add($richtextbox_ad_objects)
	$formMoveADObjects.Controls.Add($labelObjectType)
	$formMoveADObjects.Controls.Add($radiobuttonComputer)
	$formMoveADObjects.Controls.Add($radiobuttonUser)
	$formMoveADObjects.Controls.Add($labelMoveToOU)
	$formMoveADObjects.Controls.Add($textbox_OU)
	$formMoveADObjects.AutoScaleDimensions = '8, 16'
	$formMoveADObjects.AutoScaleMode = 'Font'
	$formMoveADObjects.ClientSize = '414, 441'
	$formMoveADObjects.Font = 'Microsoft Sans Serif, 9.75pt'
	$formMoveADObjects.Margin = '4, 4, 4, 4'
	$formMoveADObjects.Name = 'formMoveADObjects'
	$formMoveADObjects.Text = 'Move AD objects'
	$formMoveADObjects.add_Load($formMoveADObjects_Load)
	#
	# label_warning
	#
	$label_warning.AutoSize = $True
	$label_warning.Location = '222, 243'
	$label_warning.Margin = '4, 0, 4, 0'
	$label_warning.Name = 'label_warning'
	$label_warning.Size = '0, 19'
	$label_warning.TabIndex = 11
	$label_warning.UseCompatibleTextRendering = $True
	#
	# buttonEnableObjects
	#
	$buttonEnableObjects.Location = '220, 342'
	$buttonEnableObjects.Margin = '4, 4, 4, 4'
	$buttonEnableObjects.Name = 'buttonEnableObjects'
	$buttonEnableObjects.Size = '178, 39'
	$buttonEnableObjects.TabIndex = 10
	$buttonEnableObjects.Text = 'Enable objects'
	$buttonEnableObjects.UseCompatibleTextRendering = $True
	$buttonEnableObjects.UseVisualStyleBackColor = $True
	$buttonEnableObjects.add_Click($buttonEnableObjects_Click)
	#
	# checkboxOnlyEnabledObjects
	#
	$checkboxOnlyEnabledObjects.Font = 'Microsoft Sans Serif, 9.75pt'
	$checkboxOnlyEnabledObjects.Location = '232, 210'
	$checkboxOnlyEnabledObjects.Margin = '4, 4, 4, 4'
	$checkboxOnlyEnabledObjects.Name = 'checkboxOnlyEnabledObjects'
	$checkboxOnlyEnabledObjects.Size = '163, 30'
	$checkboxOnlyEnabledObjects.TabIndex = 9
	$checkboxOnlyEnabledObjects.Text = 'only enabled objects'
	$checkboxOnlyEnabledObjects.UseCompatibleTextRendering = $True
	$checkboxOnlyEnabledObjects.UseVisualStyleBackColor = $True
	#
	# labelLogins
	#
	$labelLogins.AutoSize = $True
	$labelLogins.Location = '13, 78'
	$labelLogins.Margin = '4, 0, 4, 0'
	$labelLogins.Name = 'labelLogins'
	$labelLogins.Size = '44, 20'
	$labelLogins.TabIndex = 8
	$labelLogins.Text = 'Logins'
	$labelLogins.UseCompatibleTextRendering = $True
	#
	# buttonMoveObjects
	#
	$buttonMoveObjects.Location = '220, 276'
	$buttonMoveObjects.Margin = '4, 4, 4, 4'
	$buttonMoveObjects.Name = 'buttonMoveObjects'
	$buttonMoveObjects.Size = '178, 39'
	$buttonMoveObjects.TabIndex = 7
	$buttonMoveObjects.Text = 'Move objects'
	$buttonMoveObjects.UseCompatibleTextRendering = $True
	$buttonMoveObjects.UseVisualStyleBackColor = $True
	$buttonMoveObjects.add_Click($buttonMoveObjects_Click)
	#
	# richtextbox_ad_objects
	#
	$richtextbox_ad_objects.Location = '13, 109'
	$richtextbox_ad_objects.Margin = '4, 4, 4, 4'
	$richtextbox_ad_objects.Name = 'richtextbox_ad_objects'
	$richtextbox_ad_objects.Size = '192, 318'
	$richtextbox_ad_objects.TabIndex = 6
	$richtextbox_ad_objects.Text = ''
	#
	# labelObjectType
	#
	$labelObjectType.AutoSize = $True
	$labelObjectType.Font = 'Microsoft Sans Serif, 14.25pt'
	$labelObjectType.Location = '248, 113'
	$labelObjectType.Margin = '4, 0, 4, 0'
	$labelObjectType.Name = 'labelObjectType'
	$labelObjectType.Size = '112, 27'
	$labelObjectType.TabIndex = 4
	$labelObjectType.Text = 'Object Type'
	$labelObjectType.UseCompatibleTextRendering = $True
	#
	# radiobuttonComputer
	#
	$radiobuttonComputer.Location = '311, 157'
	$radiobuttonComputer.Margin = '4, 4, 4, 4'
	$radiobuttonComputer.Name = 'radiobuttonComputer'
	$radiobuttonComputer.Size = '100, 30'
	$radiobuttonComputer.TabIndex = 3
	$radiobuttonComputer.Text = 'Computer'
	$radiobuttonComputer.UseCompatibleTextRendering = $True
	$radiobuttonComputer.UseVisualStyleBackColor = $True
	$radiobuttonComputer.add_CheckedChanged($radiobuttonComputer_CheckedChanged)
	#
	# radiobuttonUser
	#
	$radiobuttonUser.Checked = $True
	$radiobuttonUser.Location = '236, 157'
	$radiobuttonUser.Margin = '4, 4, 4, 4'
	$radiobuttonUser.Name = 'radiobuttonUser'
	$radiobuttonUser.Size = '139, 30'
	$radiobuttonUser.TabIndex = 2
	$radiobuttonUser.TabStop = $True
	$radiobuttonUser.Text = 'User'
	$radiobuttonUser.UseCompatibleTextRendering = $True
	$radiobuttonUser.UseVisualStyleBackColor = $True
	$radiobuttonUser.add_CheckedChanged($radiobuttonUser_CheckedChanged)
	#
	# labelMoveToOU
	#
	$labelMoveToOU.AutoSize = $True
	$labelMoveToOU.Font = 'Microsoft Sans Serif, 9.75pt'
	$labelMoveToOU.Location = '13, 15'
	$labelMoveToOU.Margin = '4, 0, 4, 0'
	$labelMoveToOU.Name = 'labelMoveToOU'
	$labelMoveToOU.Size = '76, 20'
	$labelMoveToOU.TabIndex = 1
	$labelMoveToOU.Text = 'Move to OU'
	$labelMoveToOU.UseCompatibleTextRendering = $True
	#
	# textbox_OU
	#
	$textbox_OU.Location = '13, 45'
	$textbox_OU.Margin = '4, 4, 4, 4'
	$textbox_OU.Name = 'textbox_OU'
	$textbox_OU.Size = '387, 22'
	$textbox_OU.TabIndex = 0
	$textbox_OU.Text = 'OU=TEST,DC=laba,DC=local'
	
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formMoveADObjects.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formMoveADObjects.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formMoveADObjects.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formMoveADObjects.ShowDialog()

} #End Function

#Call the form
Show-move_AD_objects_psf | Out-Null
