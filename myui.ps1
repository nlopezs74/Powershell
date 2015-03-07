<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   <A detailed description of the script>
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>
Add-Type -AssemblyName System.Windows.Forms

$form = new-object System.Windows.Forms.form 
$form.Text = "My Window"
$form.AutoScroll = $True
$form.AutoSize = $True
#$form.AutoSizeMode = "GrowAndShrink"
    # or GrowOnly

# Add Search Button

$exButton = new-object System.Windows.Forms.Button
$exButton.Location = new-object System.Drawing.Size(10,125)
$exButton.Size = new-object System.Drawing.Size(85,20)
$exButton.Text = "Search"
$exButton.Add_Click({adddata})
$form.Controls.Add($exButton)

# Add Export Button

$exButton1 = new-object System.Windows.Forms.Button
$exButton1.Location = new-object System.Drawing.Size(100,125)
$exButton1.Size = new-object System.Drawing.Size(85,20)
$exButton1.Text = "Export"
$exButton1.Add_Click({Exportcsv})
$form.Controls.Add($exButton1)

# Add Quit Button

$exButton2 = new-object System.Windows.Forms.Button
$exButton2.Location = new-object System.Drawing.Size(190,125)
$exButton2.Size = new-object System.Drawing.Size(85,20)
$exButton2.Text = "Quit"
$exButton2.Add_Click({$form.Close()})
$form.Controls.Add($exButton2)

$form.topmost = $true
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()